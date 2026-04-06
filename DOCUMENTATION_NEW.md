# Titulní strana

**Název projektu:** Iron Forge Prague 2026  
**Předmět:** Značkovací jazyky  
**Typ projektu:** Webová prezentace festivalu s datovou vrstvou XML, XSD, XSLT, JSON a OpenAPI  
**Místo řešení v repozitáři:** [web](web), [data](data), [transformace XSLT](data/transformation), [JSON výstupy](data/json), [openapi.yaml](data/openapi.yaml)  
**Hlavní dokumentace projektu:** [DOCUMENTATION.md](more/root-files/DOCUMENTATION.md)  
**Nová dokumentace:** [DOCUMENTATION_NEW.md](DOCUMENTATION_NEW.md)  
**Datum:** 21. 3. 2026

---

# Obsah

1. Stručný popis festivalu
2. Odkaz na místo a místa řešení
3. Seznam všech požadavků v tabulce
4. Metodika projektu
5. Postup tvorby
6. Které nástroje byly využity, verze
7. Ukázky hlavních promptů

---

# 1. Stručný popis festivalu

Iron Forge Prague 2026 je fiktivní třídenní metalový festival zasazený do industriálního prostředí Nákladového nádraží Žižkov v Praze. Projekt kombinuje prezentační web se samostatnou datovou vrstvou. Web obsahuje úvodní stránku, program, účinkující a praktické informace. Datová část je postavená na XML souboru [festival.xml](data/festival.xml), který je validovaný pomocí XSD a dále transformovaný do JSON výstupů přes XSLT. Nad vzniklými výstupy je připravena i OpenAPI specifikace.

Festival je navržen jako tematicky konzistentní metalová akce se dvěma scénami, třídenním programem, šedesáti účinkujícími a šedesáti programovými položkami. Vedle samotného webu projekt řeší také sémantické HTML, metadata, strukturovaná data a oddělení prezentační a datové vrstvy.

# 2. Odkaz na místo a místa řešení

**Místo konání festivalu:** [Nákladové nádraží Žižkov - Google Maps](https://www.google.com/maps/search/?api=1&query=N%C3%A1kladov%C3%A9+n%C3%A1dra%C5%BE%C3%AD+%C5%BDi%C5%BEkov+Praha)

**Místa řešení v projektu:**

| Oblast | Umístění |
|---|---|
| Dokumentace | [DOCUMENTATION_NEW.md](DOCUMENTATION_NEW.md) |
| Hlavní XML zdroj | [data/festival.xml](data/festival.xml) |
| XSD validace | [data/festival.xsd](data/festival.xsd) |
| OpenAPI specifikace | [data/openapi.yaml](data/openapi.yaml) |
| XSLT transformace | [data/transformation](data/transformation) |
| JSON výstupy | [data/json](data/json) |
| Finální web pro odevzdání | [web](web) |

# 3. Seznam všech požadavků v tabulce

| Požadavek | Stav | Řešení |
|---|---|---|
| Titulní stránka webu | Splněno | [web/index.html](web/index.html) |
| Stránka s programem | Splněno | [web/program.html](web/program.html) |
| Stránka s účinkujícími | Splněno | [web/performers.html](web/performers.html) |
| Stránka s praktickými informacemi | Splněno | [web/info.html](web/info.html) |
| Sémantické HTML elementy (`header`, `nav`, `main`, `section`, `article`, `footer`) | Splněno | Použito napříč HTML stránkami ve složce [web](web) |
| Povinné HTML prvky (`head`, `meta`, `title`, `p`, `a`, `img`, `h1`, `h2`, `h3`, `aside`, `address`, `time`, `ul/ol`, `li`) | Splněno | Implementováno v [index.html](web/index.html), [program.html](web/program.html), [performers.html](web/performers.html), [info.html](web/info.html) |
| Minimálně 3 sekce a 3 články | Splněno | Program i seznam účinkujících obsahují více sekcí a článků |
| Metadata stránky | Splněno | `title`, `description`, Open Graph, Twitter card, JSON-LD |
| Externí CSS | Splněno | [web/style.css](web/style.css) |
| Vlastní vizuální styl | Splněno | Tmavá metalová stylizace, vlastní font, galerie, karty |
| XML datová základna | Splněno | [data/festival.xml](data/festival.xml) |
| Validace přes XSD | Splněno | [data/festival.xsd](data/festival.xsd) |
| Transformace XML do JSON přes XSLT | Splněno | [data/transformation](data/transformation) |
| JSON výstupy | Splněno | [data/json](data/json) |
| OpenAPI popis API | Splněno | [data/openapi.yaml](data/openapi.yaml) |
| Napojení HTML na XML data | Splněno | [program.html](web/program.html) načítá [festival.xml](data/festival.xml); na stránkách jsou vazby na XML endpoint |
| Minimálně 3 dny programu | Splněno | 14. 8. 2026 až 16. 8. 2026 |
| Minimálně 2 místa konání | Splněno | 2 scény v XML datech |
| Minimálně 60 účinkujících | Splněno | 60 performerů v XML datech |
| Minimálně 60 programových položek | Splněno | 60 eventů v XML datech |

# 3A. Důkazy z kódu ke splněným požadavkům

Níže jsou ke každému splněnému požadavku uvedeny konkrétní ukázky přímo z trackovaných souborů v projektu.

## 1. Titulní stránka webu

Soubor: [web/index.html](web/index.html)

```html
<title>Iron Forge Prague 2026 — Úvod</title>
<h1>Iron Forge Prague 2026</h1>
<section class="hero" id="hero">
```

## 2. Stránka s programem

Soubor: [web/program.html](web/program.html)

```html
<title>Iron Forge Prague 2026 — Program</title>
<h1>Program</h1>
<section id="day-1" data-endpoint="../data/festival.xml#events" data-date="2026-08-14" data-api="/api/events?day=2026-08-14">
```

## 3. Stránka s účinkujícími

Soubor: [web/performers.html](web/performers.html)

```html
<title>Iron Forge Prague 2026 — Účinkující</title>
<h1>Účinkující</h1>
<section id="list" data-endpoint="../data/festival.xml#performers" data-api="/api/performers">
```

## 4. Stránka s praktickými informacemi

Soubor: [web/info.html](web/info.html)

```html
<title>Iron Forge Prague 2026 — Praktické informace</title>
<h1>Praktické informace</h1>
<section id="location" data-endpoint="../data/festival.xml#info" data-api="/api/festival">
```

## 5. Sémantické HTML elementy

```html
<header class="site-header">
<nav aria-label="Hlavní navigace">
<main>
<section class="hero">
<article class="performer-card">
<footer class="site-footer">
```

Ukázky jsou např. v [web/index.html](web/index.html), [web/program.html](web/program.html), [web/performers.html](web/performers.html) a [web/info.html](web/info.html).

## 6. Povinné HTML prvky

```html
<head>
<meta charset="utf-8">
<title>Iron Forge Prague 2026 — Úvod</title>
<p>Iron Forge Prague je třídenní metalový festival s důrazem na hlasitou kytarovou energii, pyrotechniku a komunitu fanoušků tvrdé hudby.</p>
<a href="program.html">Program</a>
<img src="../more/web-assets/featured-photos/hero-ocel-ohen-riffy.jpg" alt="Atmosférická fotografie pro sekci Ocel, oheň, riffy" loading="lazy">
<h1>Iron Forge Prague 2026</h1>
<h2>O festivalu</h2>
<h3>Jednodenní</h3>
<aside aria-label="Upozornění">
<address>
<time datetime="2026-08-14T16:00">16:00</time>
<ul>
<ol>
<li>Vstup je pouze pro osoby 18+.</li>
```

## 7. Minimálně 3 sekce a 3 články

Sekce:

```html
<section class="hero">
<section id="day-1" data-endpoint="../data/festival.xml#events" data-date="2026-08-14" data-api="/api/events?day=2026-08-14">
<section id="day-2" data-endpoint="../data/festival.xml#events" data-date="2026-08-15" data-api="/api/events?day=2026-08-15">
<section id="day-3" data-endpoint="../data/festival.xml#events" data-date="2026-08-16" data-api="/api/events?day=2026-08-16">
```

Články:

```html
<article class="ticket-card">
<article>
<article class="performer-card">
```

## 8. Metadata stránky

Základní metadata a sociální metadata jsou na HTML stránkách doložena např. takto:

```html
<meta name="description" content="Iron Forge Prague 2026: metalový festival v prostoru Nákladového nádraží Žižkov.">
<meta property="og:title" content="Iron Forge Prague 2026">
<meta property="og:description" content="Třídenní metalový festival — Praha, 14.–16. 8. 2026.">
<meta property="og:image" content="https://picsum.photos/1200/630?random=101">
<meta name="twitter:card" content="summary_large_image">
```

JSON-LD je doložené např. na:

```html
<script type="application/ld+json">
```

v [web/index.html](web/index.html) a [web/program.html](web/program.html).

## 9. Externí CSS

```html
<link rel="stylesheet" href="style.css">
```

Soubor stylů: [web/style.css](web/style.css)  
Aktuální počet řádků: `69`

## 10. Vlastní vizuální styl

Soubor: [web/style.css](web/style.css)

```css
@font-face{font-family:"Xirwena";src:url("xirwena1.ttf") format("truetype");font-display:swap;}
:root{
  --bg:#0b0b0d;--fg:#f2eee7;--muted:#b7aea2;--accent:#ff3b2f;--accent-2:#ff9b3f;--panel:#141417;
}
body{
  margin:0;font-family:var(--font-body);background:radial-gradient(circle at top,#1a0f10,#0b0b0d 60%);
}
.performer-card{display:grid;grid-template-columns:1fr 280px;gap:1rem;align-items:center;}
```

## 11. XML datová základna

Soubor: [data/festival.xml](data/festival.xml)

```xml
<festival>
    <info>
        <name>Iron Forge Prague</name>
        <edition>5</edition>
        <location>Nákladové nádraží Žižkov, Praha</location>
        <description>Třídenní metalový festival v industriálním prostoru s důrazem na silný line-up, pyrotechniku a komunitní atmosféru.</description>
        <start_date>2026-08-14</start_date>
        <end_date>2026-08-16</end_date>
```

## 12. Validace přes XSD

Soubor: [data/festival.xsd](data/festival.xsd)

```xml
<xs:unique name="uniqueVenueId">
<xs:unique name="uniquePerformerId">
<xs:unique name="uniqueEventId">
<xs:key name="venueKey">
<xs:keyref name="eventVenueRef" refer="venueKey">
<xs:pattern value="([01]\d|2[0-3]):[0-5]\d"/>
<xs:pattern value="v[1-9]\d*"/>
<xs:pattern value="p[1-9]\d*"/>
<xs:pattern value="e[1-9]\d*"/>
<xs:enumeration value="day"/>
<xs:enumeration value="full"/>
<xs:enumeration value="vip"/>
```

## 13. Transformace XML do JSON přes XSLT

Skript: [data/transform.ps1](data/transform.ps1)  
Šablony: [data/transformation](data/transformation)

```powershell
"festival-info.xslt" = "festival.json"
"festival-venues.xslt" = "venues.json"
"festival-performers.xslt" = "performers.json"
"festival-events.xslt" = "events.json"
$venueXslt = Join-Path $xsltDir "festival-venue-detail.xslt"
$performerXslt = Join-Path $xsltDir "festival-performer-detail.xslt"
$eventXslt = Join-Path $xsltDir "festival-event-detail.xslt"
```

## 14. JSON výstupy

JSON výstupy jsou generované do [data/json](data/json). Vazba je přímo vidět v transformačním skriptu:

```powershell
"festival-info.xslt" = "festival.json"
"festival-venues.xslt" = "venues.json"
"festival-performers.xslt" = "performers.json"
"festival-events.xslt" = "events.json"
```

Detail výstupy generují složky:

```powershell
New-Item -ItemType Directory -Path (Join-Path $outDir "venues") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $outDir "performers") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $outDir "events") -Force | Out-Null
```

## 15. OpenAPI popis API

Soubor: [data/openapi.yaml](data/openapi.yaml)

```yaml
openapi: 3.1.0
/api/festival:
/api/venues:
/api/performers:
/api/events:
```

## 16. Napojení HTML na XML data

Přímá vazba na XML a JSON endpointy:

```html
<link rel="alternate" type="application/xml" href="../data/festival.xml" title="Festival API (XML)">
<link rel="alternate" type="application/json" href="/api/events" title="Events API (JSON)">
<section id="day-1" data-endpoint="../data/festival.xml#events" data-date="2026-08-14" data-api="/api/events?day=2026-08-14">
```

Dynamické načtení XML v programu:

```javascript
var url = "../data/festival.xml";
fetch(url, { cache: "no-store" })
```

## 17. Minimálně 3 dny programu

Soubor: [data/festival.xml](data/festival.xml)

```xml
<start_date>2026-08-14</start_date>
<end_date>2026-08-16</end_date>
```

Ve webu:

```html
<h2>Pátek 14. 8. 2026</h2>
<h2>Sobota 15. 8. 2026</h2>
<h2>Neděle 16. 8. 2026</h2>
```

## 18. Minimálně 2 místa konání

Soubor: [data/festival.xml](data/festival.xml)  
Počet `venue`: `2`

```xml
<venue id="v1">Steel Stage</venue>
<venue id="v2">Pyro Hall</venue>
```

## 19. Minimálně 60 účinkujících

Soubor: [data/festival.xml](data/festival.xml)  
Počet `performer`: `60`

```xml
<performer id="p1">Metallica</performer>
...
<performer id="p60">Devin Townsend</performer>
```

## 20. Minimálně 60 programových položek

Soubor: [data/festival.xml](data/festival.xml)  
Počet `event`: `60`

```xml
<event id="e1" venue_id="v1" performer_id="p1" date="2026-08-14" time="18:00" />
...
<event id="e60" venue_id="v2" performer_id="p55" date="2026-08-17" time="05:30" />
```

# 4. Metodika projektu

Nejprve vznikl základní koncept festivalu a návrh datového modelu. Poté se souběžně rozvíjela obsahová, prezentační a datová vrstva:

1. Byl určen námět projektu, cílový styl a struktura festivalu.
2. Vznikl XML datový zdroj jako centrální místo pravdy pro informace o festivalu.
3. Nad datovým zdrojem byla doplněna XSD validace, aby bylo možné kontrolovat správnost struktury a vazeb.
4. Následně byly vytvořeny HTML stránky a společné CSS.
5. Po dokončení webové vrstvy byly doplněny XSLT transformace do JSON a navazující OpenAPI specifikace.
6. Na závěr proběhla kontrola požadavků a doplnění dokumentace.

Šlo o kombinaci ručního návrhu, iterativních úprav a využití AI asistence pro rychlejší generování návrhů, kontrolu požadavků a postupné zpřesňování struktury.

# 5. Postup tvorby

| Fáze | Popis |
|---|---|
| 1. Návrh tématu | Bylo zvoleno téma fiktivního metalového festivalu v Praze. |
| 2. První specifikace | Vznikl soubor [specification.md](specification.md) a pracovní materiály ve složce [projekt](more/root-folders/projekt). |
| 3. Datový model | Byl vytvořen [festival.xml](data/festival.xml) se sekcemi `info`, `venues`, `performers` a `events`. |
| 4. Webová část | Postupně vznikly stránky [index.html](web/index.html), [program.html](web/program.html), [performers.html](web/performers.html) a [info.html](web/info.html). |
| 5. Stylování | Byl doplněn externí CSS soubor a sjednocen vzhled stránek. |
| 6. Metadata a sémantika | Do stránek byly doplněny metadata, Open Graph a JSON-LD. |
| 7. Validace dat | K XML byl vytvořen XSD soubor s vlastními omezeními. |
| 8. Transformace | Vznikla sada XSLT transformací a skript [data/transform.ps1](data/transform.ps1). |
| 9. API vrstva | Byly vygenerovány JSON výstupy a připravena OpenAPI specifikace. |
| 10. Finalizace | Byla vytvořena finální odevzdávací verze ve složce `web/` a doplněna dokumentace. |

# 6. Které nástroje byly využity, verze

| Nástroj | Verze | Využití |
|---|---|---|
| GPT | 5-2 codex, 5-3 codex, 5-4 | průběžné úpravy HTML, CSS, kontrola požadavků a dokumentace |
| Gemini |  | prvotní generování základních podkladů do složky `projekt/` |
| Git | 2.53.0.windows.1 | verzování projektu |
| Windows PowerShell | 5.1.26100.7920 | práce se skripty, transformace, správa souborů |
| ripgrep | 15.1.0 | rychlé vyhledávání v projektu |
| Markdown |  | technická dokumentace a specifikace |
| XML / XSD / XSLT / JSON / OpenAPI | standardy bez jedné lokální verze | datová a API vrstva projektu |


# 7. Ukázky hlavních promptů

Níže jsou uvedeny reprezentativní prompty odpovídající skutečnému postupu práce popsanému v projektu:

## Prompt 1: Návrh tématu a datového základu

```text
Načti si složku Značkovací jazyky, jsou zde specifikace k projektu, který budeme vytvářet. Na základě tohoto vzoru rozpracuj 
návrh fiktivního festivalu v Praze, jeho základní identita je metalovy festival, bude se konat tři dny, mít
alespoň dvě scény, minimálně 60 účinkujících.
```

## Prompt 2: Generování první specifikace

```text
Sepiš stručnou specifikaci projektu pro webovou prezentaci festivalu Iron Forge Prague 2026.
Popiš strukturu webu, cílové publikum, obsah jednotlivých stránek a základní datový model.
Výstup dej do Markdownu.
```

## Prompt 3: Úprava HTML a CSS

```text
Uprav existující HTML a CSS soubory tak, aby web působil jako metalový festival.
Zachovej sémantické HTML, přidej konzistentní vizuální styl, responzivní rozložení,
galerii, karty účinkujících a oddělené sekce.
```

## Prompt 4: Kontrola povinných požadavků

```text
Zkontroluj, jestli projekt splňuje požadavky na předmět Značkovací jazyky.
Ověř sémantické HTML, povinné elementy, metadata, externí CSS, XML, XSD, XSLT transformace, JSON výstupy a vazbu mezi 
webem a daty. U každého bodu napiš důkaz z konkrétních souborů.
```

## Prompt 5: Datová a API vrstva

```text
Chci rozšířit XML model festivalu tak, aby šel použít pro API.
Zkontroluj a případně dotáhni XSD validaci. Podle festival-event-detail.xslt, vytvoř XSLT transformace pro 
list i detail endpointy. Spusť transform.ps1 a vygeneruj JSON výstupy. 
```
## Prompt 6: Dokumentace

```text
Pojďme vytvořit OpenAPI 3.1. specifikace. Chci aby v něm bylo popsáno: 
GET /api/festival
GET /api/venues
GET /api/venues/{id}
GET /api/performers
GET /api/performers/{id}
GET /api/events
GET /api/events/{id}
U každého uveď jaké má parametry, že vrací application/json, jeké má HTTP kódy (200, 400, 404) a na jaké schéma je JSON navázaný
```

## Prompt 7: Dokumentace

```text
Vytvoř novou projektovou dokumentaci v češtině.
Zachovej původní dokumentaci beze změny a připrav nový soubor, který bude obsahovat
titulní stranu, obsah, stručný popis festivalu, tabulku všech požadavků,
odkaz na místo a místa řešení, metodiku projektu, postup tvorby,
seznam použitých nástrojů včetně verzí a ukázky hlavních promptů.
```
## Posouzení práce s AI
Umělá inteligence byla v tomto projektu velice přínosná. Na základě vkládaných vzorů dokončovala, co bylo začato, což usnadnilo mnoho práce. Dále působila jako "kontrolor" a pomáhala vyhledávat drobné chyby. Po každém jejím zásahu byla provedena kontrola změn a zárověň otevřeno nové vlákno a znovu musela vše komplexně prověřit, neboť občas, když jí došel kontext, pracovala sice správně, ale nesouvisle. Také usnadňovala práci při udržování konzistence a průběžné dokumentace.

---

Tato nová dokumentace doplňuje původní [DOCUMENTATION.md](more/root-files/DOCUMENTATION.md).
