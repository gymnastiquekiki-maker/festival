(function () {
  var runBtn = document.getElementById("run");
  var output = document.getElementById("output");
  var downloadToggle = document.getElementById("download");

  if (!runBtn || !output) {
    return;
  }

  var transforms = [
    { name: "info.json", xslt: "xslt/festival-info.xslt", match: "/festival/info" },
    { name: "venues.json", xslt: "xslt/festival-venues.xslt", match: "/festival/venues" },
    { name: "performers.json", xslt: "xslt/festival-performers.xslt", match: "/festival/performers" },
    { name: "events.json", xslt: "xslt/festival-events.xslt", match: "/festival/events" }
  ];

  function fetchText(url) {
    return fetch(url, { cache: "no-store" }).then(function (res) {
      if (!res.ok) {
        throw new Error("HTTP " + res.status + " for " + url);
      }
      return res.text();
    });
  }

  function parseXml(text) {
    var xml = new DOMParser().parseFromString(text, "application/xml");
    if (xml.querySelector("parsererror")) {
      throw new Error("XML parse error");
    }
    return xml;
  }

  function transform(xml, xsltText, contextXPath) {
    var xsltDoc = parseXml(xsltText);
    var processor = new XSLTProcessor();
    processor.importStylesheet(xsltDoc);

    var context = xml.evaluate(contextXPath, xml, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    if (!context) {
      throw new Error("Missing node for " + contextXPath);
    }

    var fragment = processor.transformToFragment(context, document);
    return (fragment.textContent || "").trim();
  }

  function download(name, text) {
    var blob = new Blob([text], { type: "application/json;charset=utf-8" });
    var url = URL.createObjectURL(blob);
    var link = document.createElement("a");
    link.href = url;
    link.download = name;
    document.body.appendChild(link);
    link.click();
    link.remove();
    URL.revokeObjectURL(url);
  }

  runBtn.addEventListener("click", function () {
    output.textContent = "Načítám...";

    Promise.all([fetchText("festival.xml")].concat(transforms.map(function (t) { return fetchText(t.xslt); })))
      .then(function (texts) {
        var xml = parseXml(texts[0]);
        var results = [];

        transforms.forEach(function (t, i) {
          var xsltText = texts[i + 1];
          var jsonText = transform(xml, xsltText, t.match);
          results.push({ name: t.name, json: jsonText });
        });

        output.textContent = results.map(function (r) { return "// " + r.name + "\n" + r.json; }).join("\n\n");

        if (downloadToggle && downloadToggle.checked) {
          results.forEach(function (r) {
            download(r.name, r.json + "\n");
          });
        }
      })
      .catch(function (err) {
        output.textContent = "Chyba: " + err.message;
      });
  });
})();
