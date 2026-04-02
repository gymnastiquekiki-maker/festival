# Titulní strana

**Název projektu:** Iron Forge Prague 2026  
**Předmět:** Značkovací jazyky  
**Typ projektu:** Webová prezentace festivalu s datovou vrstvou XML, XSD, XSLT, JSON a OpenAPI  
**Místo řešení v repozitáři:** `web/`, `data/`, `7xAPI/transformation/festival-info.xslt`, `7xAPI/json/festival.json`, `API/openapi.yaml`  
**Hlavní dokumentace projektu:** `DOCUMENTATION.md`  
**Nová dokumentace:** `DOCUMENTATION_NEW.md`  
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

Iron Forge Prague 2026 je fiktivní třídenní metalový festival zasazený do industriálního prostředí Nákladového nádraží Žižkov v Praze. Projekt kombinuje prezentační web se samostatnou datovou vrstvou. Web obsahuje úvodní stránku, program, účinkující a praktické informace. Datová část je postavená na XML souboru `festival.xml`, který je validovaný pomocí XSD a dále transformovaný do JSON výstupů přes XSLT. Nad vzniklými výstupy je připravena i OpenAPI specifikace.

Festival je navržen jako tematicky konzistentní metalová akce se dvěma scénami, třídenním programem, šedesáti účinkujícími a šedesáti programovými položkami. Vedle samotného webu projekt řeší také sémantické HTML, metadata, strukturovaná data a oddělení prezentační a datové vrstvy.

# 2. Odkaz na místo a místa řešení

**Místo konání festivalu:** [Nákladové nádraží Žižkov - Google Maps](https://www.google.com/maps/search/?api=1&query=N%C3%A1kladov%C3%A9+n%C3%A1dra%C5%BE%C3%AD+%C5%BDi%C5%BEkov+Praha)

**Místa řešení v projektu:**

| Oblast | Umístění |
|---|---|
| Původní dokumentace | `DOCUMENTATION.md` |
| Nová dokumentace | `DOCUMENTATION_NEW.md` |
| Hlavní XML zdroj | `data/festival.xml` |
| XSD validace | `data/festival.xsd` |
| OpenAPI specifikace | `API/openapi.yaml` |
| XSLT transformace | `7xAPI/transformation/festival-info.xslt` |
| JSON výstupy | `7xAPI/json/festival.json` |
| Finální web pro odevzdání | `web/` |

# 3. Seznam všech požadavků v tabulce

| Požadavek | Stav | Řešení |
|---|---|---|
| Titulní stránka webu | Splněno | `web/index.html` |
| Stránka s programem | Splněno | `web/program.html` |
| Stránka s účinkujícími | Splněno | `web/performers.html` |
| Stránka s praktickými informacemi | Splněno | `web/info.html` |
| Sémantické HTML elementy (`header`, `nav`, `main`, `section`, `article`, `footer`) | Splněno | Použito napříč HTML stránkami ve složce `web/` |
| Povinné HTML prvky (`head`, `meta`, `title`, `p`, `a`, `img`, `h1`, `h2`, `h3`, `aside`, `address`, `time`, `ul/ol`, `li`) | Splněno | Implementováno v `index.html`, `program.html`, `performers.html`, `info.html` |
| Minimálně 3 sekce a 3 články | Splněno | Program i seznam účinkujících obsahují více sekcí a článků |
| Metadata stránky | Splněno | `title`, `description`, Open Graph, Twitter card, JSON-LD |
| Externí CSS | Splněno | `web/style.css` |
| Vlastní vizuální styl | Splněno | Tmavá metalová stylizace, vlastní font, galerie, karty |
| XML datová základna | Splněno | `data/festival.xml` |
| Validace přes XSD | Splněno | `data/festival.xsd` |
| Transformace XML do JSON přes XSLT | Splněno | `7xAPI/transformation/festival-info.xslt` |
| JSON výstupy | Splněno | `7xAPI/json/festival.json` |
| OpenAPI popis API | Splněno | `API/openapi.yaml` |
| Napojení HTML na XML data | Splněno | `program.html` načítá `festival.xml`; na stránkách jsou vazby na XML endpoint |
| Minimálně 3 dny programu | Splněno | 14. 8. 2026 až 16. 8. 2026 |
| Minimálně 2 místa konání | Splněno | 2 scény v XML datech |
| Minimálně 60 účinkujících | Splněno | 60 performerů v XML datech |
| Minimálně 60 programových položek | Splněno | 60 eventů v XML datech |

# 4. Metodika projektu

Projekt byl řešen inkrementálně. Nejprve vznikl základní koncept festivalu a návrh datového modelu. Poté se souběžně rozvíjela obsahová, prezentační a datová vrstva:

1. Byl určen námět projektu, cílový styl a struktura festivalu.
2. Vznikl XML datový zdroj jako centrální místo pravdy pro informace o festivalu.
3. Nad datovým zdrojem byla doplněna XSD validace, aby bylo možné kontrolovat správnost struktury a vazeb.
4. Následně byly vytvořeny HTML stránky a společné CSS.
5. Po dokončení webové vrstvy byly doplněny XSLT transformace do JSON a navazující OpenAPI specifikace.
6. Na závěr proběhla kontrola požadavků a doplnění dokumentace.

Z metodického hlediska šlo o kombinaci ručního návrhu, iterativních úprav a využití AI asistence pro rychlejší generování návrhů, kontrolu požadavků a postupné zpřesňování struktury.

# 5. Postup tvorby

| Fáze | Popis |
|---|---|
| 1. Návrh tématu | Bylo zvoleno téma fiktivního metalového festivalu v Praze. |
| 2. První specifikace | Vznikl soubor `specification.md` a pracovní materiály ve složce `projekt/`. |
| 3. Datový model | Byl vytvořen `festival.xml` se sekcemi `info`, `venues`, `performers` a `events`. |
| 4. Webová část | Postupně vznikly stránky `index.html`, `program.html`, `performers.html` a `info.html`. |
| 5. Stylování | Byl doplněn externí CSS soubor a sjednocen vzhled stránek. |
| 6. Metadata a sémantika | Do stránek byly doplněny metadata, Open Graph a JSON-LD. |
| 7. Validace dat | K XML byl vytvořen XSD soubor s vlastními omezeními. |
| 8. Transformace | Vznikla sada XSLT transformací a skript `7xAPI/transform.ps1`. |
| 9. API vrstva | Byly vygenerovány JSON výstupy a připravena OpenAPI specifikace. |
| 10. Finalizace | Byla vytvořena finální odevzdávací verze ve složce `web/` a doplněna dokumentace. |

# 6. Které nástroje byly využity, verze

| Nástroj | Verze | Využití |
|---|---|---|
| GPT | 5-2 codex, 5-3 codex, 5-4 | průběžné úpravy HTML, CSS, kontrola požadavků a dokumentace |
| Gemini | verze nebyla v podkladech zaznamenána | prvotní generování základních podkladů do složky `projekt/` |
| Git | 2.53.0.windows.1 | verzování projektu |
| Windows PowerShell | 5.1.26100.7920 | práce se skripty, transformace, správa souborů |
| ripgrep | 15.1.0 | rychlé vyhledávání v projektu |
| Markdown | bez pevné verze | technická dokumentace a specifikace |
| XML / XSD / XSLT / JSON / OpenAPI | standardy bez jedné lokální verze | datová a API vrstva projektu |

Poznámka: u AI nástrojů lze uvést jen ty verze, které jsou skutečně doložené v podkladech projektu. U Gemini nebyla konkrétní verze v dostupných souborech zapsaná.

# 7. Ukázky hlavních promptů

Níže jsou uvedeny reprezentativní prompty odpovídající skutečnému postupu práce popsanému v projektu:

## Prompt 1: Návrh tématu a datového základu

```text
Vytvoř návrh projektu pro předmět Značkovací jazyky na téma metalový festival.
Navrhni fiktivní festival v Praze, jeho základní identitu, tři dny programu,
alespoň dvě scény, minimálně 60 účinkujících a datový XML základ, ze kterého
později půjde vytvořit web i API vrstva.
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
Ověř sémantické HTML, povinné elementy, metadata, externí CSS, XML, XSD,
XSLT transformace, JSON výstupy a vazbu mezi webem a daty.
U každého bodu napiš důkaz z konkrétních souborů.
```

## Prompt 5: Datová a API vrstva

```text
Rozšiř XML model festivalu tak, aby šel použít pro API.
Přidej XSD validaci, vytvoř XSLT transformace pro list i detail endpointy,
vygeneruj JSON výstupy a připrav OpenAPI 3.1 specifikaci.
```

## Prompt 6: Dokumentace

```text
Vytvoř novou projektovou dokumentaci v češtině.
Zachovej původní dokumentaci beze změny a připrav nový soubor, který bude obsahovat
titulní stranu, obsah, stručný popis festivalu, tabulku všech požadavků,
odkaz na místo a místa řešení, metodiku projektu, postup tvorby,
seznam použitých nástrojů včetně verzí a ukázky hlavních promptů.
```

---

Tato nová dokumentace doplňuje původní `DOCUMENTATION.md` a ponechává ji beze změny.
