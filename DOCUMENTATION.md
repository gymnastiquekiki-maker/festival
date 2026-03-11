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
Kopie hlavního XML (datový zdroj).

### `data/festival.xsd`
XSD schéma pro validaci XML. Obsahuje vlastní omezení s komentáři:
- pattern pro datum a čas,
- pattern pro ID (`vN`, `pN`, `eN`),
- rozsah ročníku (1–99).

### `data/xslt/`
Sada XSLT transformací, každá generuje JSON pro jeden endpoint:
- `festival-info.xslt` → `info.json`
- `festival-venues.xslt` → `venues.json`
- `festival-performers.xslt` → `performers.json`
- `festival-events.xslt` → `events.json`

### `data/json/`
Vygenerované JSON výstupy odpovídající API datům:
- `info.json`
- `venues.json`
- `performers.json`
- `events.json`

### `data/transform.ps1`
Skript pro spuštění XML → XSLT → JSON transformací. Po spuštění vygeneruje JSON soubory do `data/json/`.

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
1. Zkontrolovali jsme sémantické HTML a metadata.
2. Opravili jsme `og:image` na Lorem Picsum v HTML souborech.
3. Přidali jsme `aside` do `info.html` kvůli povinnému prvku.
4. Upravili jsme `program.html` tak, aby program vycházel z dat `festival.xml` (JS načítání a render).
5. Zredukovali jsme CSS na požadovaný rozsah 50–100 řádků.
6. Připravili jsme složku `web/` pro odevzdání (HTML + `style.css` + assets).
7. Vytvořili jsme `data/` s XML, XSD, XSLT, JSON výstupy a skriptem `transform.ps1`.
8. Krátce jsme zkoušeli stránku pro transformaci v prohlížeči, ale následně jsme ji kompletně odstranili.


