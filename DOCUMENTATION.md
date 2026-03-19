# Dokumentace projektu – Iron Forge Prague 2026

## 1) Přehled projektu
Webová prezentace fiktivního metalového festivalu. Projekt obsahuje:
- HTML stránky (kořen i složka `web/` pro odevzdání),
- CSS stylování,
- XML datový zdroj,
- XSD validaci,
- XSLT transformace do JSON,
- JSON výstupy (vygenerované).

## 2) Struktura repozitáře (hlavní složky)
- `web/` – finální verze pro odevzdání (HTML + `style.css` + assets)
- `data/` – datová základna (XML, XSD, XSLT, JSON, skript)
- Kořen projektu – pracovní kopie HTML/CSS (stejné stránky jako ve `web/`, ale s `styles.css`)

## 3) Kořenové soubory (pracovní verze)

### `index.html`
Úvodní stránka festivalu. Obsahuje:
- hero sekci,
- základní informace o festivalu,
- přehled scén,
- galerii,
- vstupenky.

### `program.html`
Stránka programu. Obsahuje:
- harmonogram pro 3 dny,
- rozdělení podle scén,
- časové údaje v elementu `<time>`.

### `performers.html`
Seznam interpretů a detailní profily vybraných kapel.

### `info.html`
Praktické informace (místo konání, doprava, ubytování, pravidla vstupu).
Obsahuje i `<address>` a `<time>`.

### `styles.css`
Hlavní CSS pro pracovní verzi (kořen). Nastavuje barvy, typografii, pozadí, layouty a responsivitu.

### `festival.xml`
XML datový zdroj pro festival:
- `info` (název, ročník, lokace, data),
- `venues` (scény),
- `performers` (interpreti),
- `events` (program podle data/času/scény/interpreta).

## 4) Složka `web/` – finální odevzdání

### `web/index.html`
Finální úvodní stránka pro odevzdání.

### `web/program.html`
Finální stránka programu pro odevzdání.

### `web/performers.html`
Finální stránka účinkujících pro odevzdání.

### `web/info.html`
Finální stránka praktických informací pro odevzdání.

### `web/style.css`
CSS pro odevzdání (název odpovídá požadavku).

### `web/festival.xml`
Kopie XML pro potřeby webu.

### `web/mapa-zizkov.png`
Obrázek mapy v info stránce.

### `web/Black-Metal-Logos-4.jpg`
Obrázek použitý na webu (hlavní vizuál).

### `web/PickysideRegular-vn7w4.otf`, `web/xirwena1.ttf`
Lokální fonty použité v CSS.

## 5) Složka `data/` – datová základna

### `data/festival.xml`
Kopie hlavního XML (datový zdroj). XML bylo rozšířeno o `description`, `tickets` a `links`, aby šlo přímo generovat data pro endpoint `GET /api/festival`.

### `data/festival.xsd`
XSD schéma pro validaci XML. Obsahuje vlastní omezení s komentáři:
- pattern pro datum a čas,
- pattern pro ID (`vN`, `pN`, `eN`),
- rozsah ročníku (1–99).

### `data/xslt/`
Sada XSLT transformací, které generují JSON pro list i detail endpointy:
- `festival-info.xslt` → `festival.json`
- `festival-venues.xslt` → `venues.json`
- `festival-performers.xslt` → `performers.json`
- `festival-events.xslt` → `events.json`
- `festival-venue-detail.xslt` → `venues/{id}.json`
- `festival-performer-detail.xslt` → `performers/{id}.json`
- `festival-event-detail.xslt` → `events/{id}.json`

### `data/json/`
Vygenerované JSON výstupy odpovídající API datům:
- `festival.json`
- `venues.json`
- `venues/{id}.json`
- `performers.json`
- `performers/{id}.json`
- `events.json`
- `events/{id}.json`

### `data/transform.ps1`
Skript pro spuštění XML → XSLT → JSON transformací. Po spuštění vygeneruje list i detail JSON soubory do `data/json/`.

### `data/README.md`
Krátké instrukce k datové části a transformacím.

## 6) Jak projekt spustit lokálně
Nejjednodušší je spustit lokální server ve složce `web/`:
```
cd "C:\Users\krist\OneDrive\druhak\Značkovací jazyky\web"
python -m http.server 8000
```
Pak otevřít:
```
http://localhost:8000/index.html
```

## 7) Poznámky k požadavkům
- Sémantická struktura HTML je splněna (header/nav/main/section/article/footer).
- Metadata: `title`, `description`, Open Graph + JSON‑LD jsou přítomné.
- CSS je v externím souboru a má 50–100 řádků (ve `style.css`).
- Datová základna obsahuje XML + XSD + XSLT + JSON výstupy.

---

Pokud chcete něco rozšířit nebo upravit, doplňte do této dokumentace konkrétní část.

## 8) Průběh práce (chronologicky)

Na úplném začátku jsme použili Gemini k rychlému vygenerování základních podkladů do složky `projekt/`. Vznikly soubory `festival.xml` a `specifications.md`, protože jsme potřebovali mít od začátku datový zdroj a sepsané požadavky projektu. Do promptu jsme vložili požadavky z Moodlu a současně jsme určili téma – festival bude metalový – aby všechny další materiály (texty, struktura i data) odpovídaly zvolenému žánru.

Dalším krokem bylo založení projektu v Gitu.

Následně vznikl základní datový soubor `festival.xml`. Ten slouží jako hlavní datový zdroj pro celý projekt – obsahuje:
- `info` (název festivalu, ročník, místo a datum),
- `venues` (seznam scén),
- `performers` (seznam interpretů),
- `events` (harmonogram – vazby mezi interpretem, scénou, datem a časem).
Díky tomu jsou všechna data na webu konzistentní a mohou se z XML dále zpracovávat (např. validace nebo transformace do JSON).

Současně jsme vytvořili první HTML stránky:

`index.html`
Stránka je rozdělená na samostatné sekce pomocí `<section>`, což jasně odděluje jednotlivé části obsahu.
- `<header>` obsahuje název festivalu a hlavní navigaci, která propojuje všechny stránky.
- `<main>` drží hlavní obsah stránky a dělí ho na tematické bloky: úvodní hero, informace o festivalu, základní fakta, scény, galerie a vstupenky.
- `<footer>` uzavírá stránku a nese drobné organizační informace.
Smyslem je, aby uživatel okamžitě pochopil hlavní informace a snadno se zorientoval.

`info.html`
Tato stránka je zaměřená na praktické informace a také je členěná do více samostatných sekcí.
- `<header>` a `<nav>` jsou stejné jako na ostatních stránkách, aby byla navigace konzistentní.
- `<main>` obsahuje bloky: místo konání (s adresou), doprava a parkování, ubytování, bezpečnost, pravidla vstupu a služby v areálu.
- Každá část má vlastní nadpis (`<h2>`), aby bylo jasné rozdělení obsahu.
Cílem je oddělit jednotlivá témata tak, aby návštěvník rychle našel konkrétní informaci.

Poté jsme doplnili další stránky: `program.html` a `performers.html`.

`program.html`
Stránka je strukturovaná podle dnů festivalu. Každý den je samostatná sekce (`<section>`), která obsahuje dvě samostatné části pro scény (`<article>`).
Uvnitř je harmonogram jako seznam (`<ul>`), kde každý řádek obsahuje čas v elementu `<time>` a název interpreta.
Cílem je, aby návštěvník rychle našel konkrétní den a scénu a okamžitě viděl přehled vystoupení.

`performers.html`
Stránka je rozdělena do dvou hlavních bloků. První blok obsahuje seznam všech interpretů v přehledném sloupcovém rozložení (`<ul>`).
Druhý blok obsahuje detailní profily vybraných kapel, každá jako samostatný `<article>`, s nadpisem `<h3>`, krátkým popisem a obrázkem.
Díky tomu stránka kombinuje rychlý přehled i detailní informace.

Poté jsme vytvořili `styles.css`, abychom sjednotili vzhled všech HTML stránek a oddělili prezentaci od obsahu.

CSS nastavuje:
- barevnou paletu a kontrast (tmavé pozadí + akcenty),
- typografii (základní písmo + výrazný display font),
- základní layout (šířka obsahu, mezery, rozdělení do sekcí),
- vzhled navigace, tlačítek a karet,
- práci s obrázky (responsivní chování, zaoblení),
- responsivní úpravy pro menší obrazovky.

Díky tomu mají všechny stránky jednotný vizuální styl a konzistentní strukturu.

Následovaly postupné úpravy CSS – za pomoci GPT 5.2‑Codex. Nejprve jsme do `styles.css` přidali vlastní font pomocí `@font-face` a nastavili hlavní typografii (`--font-body`, `--font-display`). Poté jsme dolaďovali layout přes konkrétní třídy jako `.hero` (hlavní úvodní blok), `.tickets-layout` (rozvržení vstupenek) a `.performer-card` (karty interpretů). Součástí úprav bylo i sjednocení vzhledu sekcí (`section, article, aside`), tlačítek (`.btn`) a práce s obrázky (`img`, `.gallery`, `.hero-media`). Zároveň jsme do HTML doplnili vlastní obrázky – například hero/galerii v `index.html` a profilové fotky v `performers.html`.

Dalším krokem byla úprava metadat ve všech HTML souborech. Do `<head>` jsme doplnili:
- `<title>` a `<meta name="description">` pro základní popis stránky,
- Open Graph metadata (`og:title`, `og:description`, `og:image`) pro správné náhledy při sdílení,
- Twitter card pro náhledy na sociálních sítích,
- JSON‑LD (schema.org) pro festival a eventy, aby byla data strojově čitelná.

Pak jsme vytvořili datovou část ve složce `data/`. Do ní jsme zkopírovali `festival.xml` jako hlavní datový zdroj a vytvořili `festival.xsd` pro validaci (včetně vlastních omezení typu pattern/rozsah). Přidali jsme XSLT šablony do `data/xslt/`, které převádějí XML na JSON, a vygenerovali výstupy do `data/json/`. Později jsme XML rozšířili o popis festivalu, vstupenky a odkazy, aby OpenAPI specifikace i endpoint `GET /api/festival` odpovídaly skutečným datům. Spuštění transformace zajišťuje skript `data/transform.ps1`.

Další krok byl doplnění napojení na API. V HTML jsme zanechali odkaz na XML endpoint a do `program.html` jsme přidali načítání `festival.xml` pomocí `fetch`, aby se program mohl generovat z dat. Tím se zajistilo, že obsah stránky odpovídá datům v XML a změny v `festival.xml` se mohou promítnout do programu.

Následovala kontrola požadavků. Postupně jsme do GPT‑5.2‑Codex zadávali jednotlivé požadavky a vyžadovali ověření i konkrétní důkazy z kódu.








1. Zkontrolovali jsme sémantické HTML a metadata.
2. Opravili jsme `og:image` na Lorem Picsum v HTML souborech.
3. Přidali jsme `aside` do `info.html` kvůli povinnému prvku.
4. Upravili jsme `program.html` tak, aby program vycházel z dat `festival.xml` (JS načítání a render).
5. Zredukovali jsme CSS na požadovaný rozsah 50–100 řádků.
6. Připravili jsme složku `web/` pro odevzdání (HTML + `style.css` + assets).
7. Vytvořili jsme `data/` s XML, XSD, XSLT, JSON výstupy a skriptem `transform.ps1`.
8. Krátce jsme zkoušeli stránku pro transformaci v prohlížeči, ale následně jsme ji kompletně odstranili.










### 2026-03-12
- Opraveny JSON výstupy ve `data/json/` (odstranění ne‑JSON částí, zůstává pouze validní JSON).
- Aktualizováno `data/festival.xsd`: přidána unikátnost ID, referenční integrita (`key`/`keyref`), zpřesněné typy (date, time, patterny), nové typy `NonEmptyTextType` a `LocationType`.
- Opraveny XSLT šablony v `data/xslt/` (správné uvozovky v XPath) a znovu spuštěna transformace XML → JSON.
- Ověřena validace `data/festival.xml` proti `data/festival.xsd`.
- Vytvořena OpenAPI 3.1 specifikace v `openapi.yaml`.

### 2026-03-19
- Rozšířeno `festival.xml` o `description`, `tickets` a `links`, aby datový model pokryl požadavky endpointu `GET /api/festival`.
- Rozšířeno `data/festival.xsd` o nové typy a omezení pro popis, vstupenky a interní odkazy.
- Upraven `data/transform.ps1`, aby generoval `festival.json` a detail JSON soubory pro `venues/{id}`, `performers/{id}` a `events/{id}`.
- Doplněny nové XSLT šablony pro detail endpointy a upraven `events.json` na list response s filtry a stránkováním.
- Přepsána OpenAPI specifikace na REST endpointy `/api/festival`, `/api/venues`, `/api/performers` a `/api/events` včetně detailů, filtrů a HTTP kódů.

## 9) Ověření požadavků

### Ověření: výchozí datová základna `festival.xml`
- well‑formed XML: soubor se načte bez chyby XML parserem.
- min. 3 dny: `2026-08-14` až `2026-08-16` → 3 dny.
- min. 2 místa: 2 venues.
- min. 60 účinkujících: 60 performers.
- min. 60 programových položek: 60 events.
- minimální entity: `<festival>`, `<venues>`, `<performers>`, `<events>`.
- Poznámka k programu: část nočních vystoupení posledního festivalového dne pokračuje po půlnoci do `2026-08-17`, ale stále patří ke 3. festivalovému dni v rámci rozsahu `2026-08-14` až `2026-08-16`.

Důkaz (počty a dny):
```
venues     : 2
performers : 60
events     : 60
start_date : 2026-08-14
end_date   : 2026-08-16
days       : 3
```
Důkaz (entity v XML):
```
<festival>
<venues>
<performers>
<events>
```

### Ověření: povinné stránky (samostatné HTML soubory)
- Úvodní stránka: `web/index.html`
- Program: `web/program.html`
- Účinkující: `web/performers.html`
- Praktické informace: `web/info.html`

Důkaz (soubory ve složce `web/`):
```
index.html
program.html
performers.html
info.html
```

Důkaz (seznam + detail účinkujících):
```
<h2>Seznam interpretů</h2>
<h2>Detail účinkujících</h2>
```

Důkaz (praktické informace – místo, doprava/parkování, ubytování):
```
<h2>Místo konání</h2>
<h2>Doprava a parkování</h2>
<h2>Ubytování</h2>
```

### Ověření: sémantické HTML
- smysluplná struktura: `header`, `nav`, `main`, `section`, `article`, `footer`.
- korektní hierarchie nadpisů: `h1` → `h2` → `h3`.
- vhodné elementy pro seznamy a data: např. `time` v programu.

Důkaz (struktura):
```
<header>
<nav>
<main>
<section>
<article>
<footer>
```

Důkaz (nadpisy):
```
<h1>Program</h1>
<h2>Harmonogram tří dnů</h2>
<h3>Steel Stage</h3>
```

Důkaz (time v programu):
```
<li><time datetime="2026-08-14T18:00">18:00</time> Metallica</li>
```

### Ověření: metadata
- `title` + `meta name="description"` jsou na stránkách.
- Open Graph minimum (`og:title`, `og:description`, `og:image` s Lorem Picsum).
- JSON‑LD pro festival i eventy.

Důkaz (title + description):
```
<title>Iron Forge Prague 2026 — Úvod</title>
<meta name="description" content="Iron Forge Prague 2026: metalový festival v prostoru Nákladového nádraží Žižkov.">
```

Důkaz (Open Graph minimum):
```
<meta property="og:title" content="Iron Forge Prague 2026">
<meta property="og:description" content="Třídenní metalový festival — Praha, 14.–16. 8. 2026.">
<meta property="og:image" content="https://picsum.photos/1200/630?random=1">
```

Důkaz (JSON‑LD festival):
```
<script type="application/ld+json">
{
  "@type": "MusicFestival",
  ...
}
</script>
```

Důkaz (JSON‑LD eventy):
```
<script type="application/ld+json">
{
  "@graph": [
    { "@type": "Event", ... }
  ]
}
</script>
```

### Ověření: napojení na API
- HTML odkazuje na XML endpoint přes `link rel="alternate"`.
- Sekce mají `data-endpoint` s vazbou na části XML.
- Program načítá `festival.xml` přes `fetch`.

Důkaz (odkaz na endpoint):
```
<link rel="alternate" type="application/xml" href="festival.xml" title="Festival API (XML)">
```

Důkaz (data-endpoint):
```
<section id="about" data-endpoint="festival.xml#info">
<section id="venues" data-endpoint="festival.xml#venues">
<section id="list" data-endpoint="festival.xml#performers">
<section id="day-1" data-endpoint="festival.xml#events" data-date="2026-08-14">
```

Důkaz (fetch v programu):
```
var url = "festival.xml";
```

### Ověření: povinné elementy
- `head`, `meta`, `title`, `header`, `footer`, `p`, `a`, `img`, `h1`, `h2`.
- `section` min. 3×.
- `article` min. 3×.
- `aside`, `address`, `time`, `ul/ol`, `li`, `h3`.

Důkaz (head/meta/title/header/footer/p/a/img/h1/h2):
```
<head>
<meta charset="utf-8">
<title>Iron Forge Prague 2026 — Úvod</title>
<header class="site-header">
<footer class="site-footer">
<p>...</p>
<a ...>
<img ...>
<h1>Iron Forge Prague 2026</h1>
<h2>O festivalu</h2>
```

Důkaz (section min. 3×):
```
<section class="hero">
<section id="day-1" ...>
<section id="day-2" ...>
<section id="day-3" ...>
```

Důkaz (article min. 3×):
```
<article class="performer-card">
<article class="performer-card">
<article class="performer-card">
```

Důkaz (aside/address/time/ul/ol/li/h3):
```
<aside aria-label="Upozornění">
<address>
<time datetime="2026-08-14T16:00">16:00</time>
<ul> ... <li> ... </li>
<ol> ... <li> ... </li>
<h3>MHD</h3>
```

### Ověření: CSS
- 1× externí soubor (`style.css`).
- 50–100 řádků: aktuálně 67.
- Baseline: barvy, fonty, pozadí, oddělení sekcí.
- Bez frameworků a knihoven.

Důkaz (externí CSS):
```
<link rel="stylesheet" href="style.css">
```

Důkaz (počet řádků):
```
Lines: 67
```

Důkaz (barvy/fonty/pozadí/oddělení sekcí):
```
:root{ ... --font-body ... --font-display ... }
body{ ... background: radial-gradient(...) ... }
section,article,aside{ ... border ... padding ... }
@font-face{ ... }
```

### Ověření: datová základna
- `data/festival.xml` existuje.
- `data/festival.xsd` obsahuje vlastní omezení s komentáři.
- XSLT → JSON transformace je funkční a spustitelná (`data/transform.ps1`).
- Výstupy JSON odpovídají API (`festival`, `venues`, `performers`, `events` + detail endpointy).

Důkaz (XSD omezení + komentáře):
```
<!-- Vlastní omezení: ročník festivalu jako kladné celé číslo v rozsahu 1–99 -->
<xs:minInclusive value="1"/>
<xs:maxInclusive value="99"/>

<!-- Vlastní omezení: typ data -->
<xs:restriction base="xs:date"/>

<!-- Vlastní omezení: enumerace typů vstupenek -->
<xs:enumeration value="day"/>
<xs:enumeration value="full"/>
<xs:enumeration value="vip"/>
```

Důkaz (XSLT soubory):
```
festival-info.xslt
festival-venues.xslt
festival-performers.xslt
festival-events.xslt
festival-venue-detail.xslt
festival-performer-detail.xslt
festival-event-detail.xslt
```

Důkaz (JSON výstupy):
```
festival.json
venues.json
performers.json
events.json
venues/{id}.json
performers/{id}.json
events/{id}.json
```

Důkaz (mapování v transform.ps1):
```
"festival-info.xslt" = "festival.json"
"festival-venues.xslt" = "venues.json"
"festival-performers.xslt" = "performers.json"
"festival-events.xslt" = "events.json"
```


