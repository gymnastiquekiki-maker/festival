# Projektová specifikace: Neon Forge Prague 2027

## Identita festivalu

| Položka | Hodnota |
|---|---|
| Název | Neon Forge Prague |
| Ročník | 1. ročník |
| Lokalita | Nákladové nádraží Žižkov, Praha |
| Datumový rozsah | 13. 08. 2027 - 15. 08. 2027 |
| Charakter festivalu | Třídenní městský festival tvrdé hudby, industriální scénografie, světelných instalací a nočních audiovizuálních vystoupení. |
| Hlavní žánry / témata | industrial metal, metalcore, post-metal, darkwave, synthwave, gothic metal, thrash metal, alternativní elektronika |

## Účel webu

Web slouží jako hlavní informační, prezentační a prodejní místo festivalu Neon Forge Prague. Má návštěvníkům rychle vysvětlit, o jaký typ akce jde, ukázat atmosféru festivalu, zpřístupnit program, pomoct s plánováním návštěvy a dovést je k výběru a nákupu vhodné vstupenky.

Hlavní cíle webu:

- představit identitu festivalu a jeho dramaturgii,
- zobrazit kompletní program podle dne, času a scény,
- umožnit procházet účinkující v seznamu i detailu,
- vysvětlit umístění scén a praktické informace k dopravě, vstupu a bezpečnosti,
- prodávat vstupenky a srozumitelně vysvětlit rozdíly mezi jednodenní, třídenní a VIP variantou,
- podporovat rozhodování návštěvníků pomocí propojení programu, doporučených dnů a vstupenek,
- umožnit návštěvníkovi sestavit vlastní orientační program.

Důležité akce uživatelů:

- najít vystoupení konkrétní kapely nebo projektu,
- filtrovat program podle dne, scény a žánru,
- otevřít detail účinkujícího,
- zjistit, kde se nachází konkrétní scéna,
- uložit programovou položku do osobního plánu,
- porovnat typy vstupenek podle ceny, rozsahu a výhod,
- vybrat konkrétní vstupenku a přejít k nákupu nebo rezervaci,
- přejít na informace o dopravě a pravidlech areálu.

## Cílové skupiny

| Cílová skupina | Potřeby | Očekávání | Potřebné informace / funkce |
|---|---|---|---|
| Fanoušci tvrdé hudby | Rychle najít oblíbené interprety a časy vystoupení. | Přehledný line-up, žánry, scény a odkazy na detail. | Program, seznam účinkujících, detail interpreta, vlastní plán. |
| Návštěvníci z jiných měst | Naplánovat příjezd, ubytování a orientaci v Praze. | Jasné praktické informace bez dlouhého hledání. | Lokalita, doprava, mapa areálu, pravidla vstupu, doporučené časy příjezdu. |
| Noví návštěvníci festivalu | Pochopit charakter akce, vybrat vhodný den a koupit odpovídající vstupenku. | Srozumitelný úvod, atmosféra, ceny, základní doporučení a jednoduchá cesta k nákupu. | Úvodní stránka, popis festivalu, zvýrazněné programové tipy, vstupenky, FAQ. |
| Zájemci o vstupenky | Porovnat ceny a rozhodnout se mezi jednodenní, třídenní a VIP variantou. | Jasné balíčky, viditelné ceny, výhody a výrazné nákupní tlačítko. | Přehled vstupenek, ceny, dostupnost, výhody, nákup nebo rezervace. |
| Média a partneři | Získat ověřené informace o festivalu a účinkujících. | Strukturované údaje, kontakty a tiskové podklady. | Identita festivalu, press sekce, kontakty, stručné medailony účinkujících. |
| Produkční tým | Kontrolovat konzistenci programu, scén a dat. | Jednoznačné vazby mezi programem, místy a interprety. | Datová základna, ID účinkujících, ID scén, harmonogram. |

## Informační architektura

### Sitemap

- Úvod
- Program
- Programová položka - detail
- Účinkující
- Účinkující - detail
- Místa / scény
- Praktické informace
- Vstupenky
- Můj program
- FAQ
- Kontakt / press

### Hlavní navigace

Hlavní navigace bude obsahovat odkazy:

- Úvod
- Program
- Účinkující
- Scény
- Praktické informace
- Vstupenky

Sekundární nebo kontextové části:

- Můj program
- FAQ
- Kontakt / press

### Vztahy mezi hlavními částmi webu

Program je centrální obsahová část webu. Každá programová položka odkazuje na jednoho účinkujícího a jednu scénu. Detail účinkujícího zobrazuje jeho základní informace, žánry a výpis všech jeho vystoupení. Detail scény ukazuje popis místa a všechny programové položky, které se na ní odehrávají. Sekce Vstupenky je hlavní konverzní část webu a je propojena s úvodní stránkou, programem i praktickými informacemi, aby si uživatel mohl vybrat vhodný typ vstupu podle programu, ceny a očekávaného komfortu. Praktické informace doplňují návštěvnický kontext a odkazují na mapu areálu, dopravu a pravidla vstupu.

### Účel jednotlivých částí

| Část webu | Účel |
|---|---|
| Úvod | Rychlé představení festivalu, datum, lokalita, atmosféra, hlavní výzva k nákupu vstupenek. |
| Program | Přehled všech vystoupení podle dne, času, scény a žánru. |
| Programová položka - detail | Detail konkrétního vystoupení včetně času, scény, interpreta a možnosti uložit do vlastního programu. |
| Účinkující | Seznam všech interpretů s možností filtrování podle žánru, země nebo dne vystoupení. |
| Účinkující - detail | Medailon interpreta, žánry, země, popis a napojené programové položky. |
| Místa / scény | Přehled festivalových scén, jejich kapacity, umístění a dramaturgického zaměření. |
| Praktické informace | Doprava, vstup, bezpečnost, platby, přístupnost, pravidla areálu a doporučení pro návštěvníky. |
| Vstupenky | Prodejní část webu: typy vstupenek, ceny, dostupnost, výhody, doporučení vhodné varianty a výrazná akce pro nákup nebo rezervaci. |
| Můj program | Interaktivní část pro uložení vybraných vystoupení a kontrolu časových kolizí. |
| FAQ | Odpovědi na nejčastější otázky před návštěvou festivalu. |
| Kontakt / press | Kontakty pro návštěvníky, média, partnery a produkci. |

## Uživatelské scénáře

### Scénář 1: Fanoušek plánuje večerní program

- **Typ uživatele:** Fanoušek metalcore a industrial metalu.
- **Cíl:** Zjistit, kdo vystupuje v pátek večer, a uložit si vybraná vystoupení do vlastního programu.
- **Výchozí situace:** Uživatel přijde na web den před festivalem a ví, že chce navštívit hlavně večerní koncerty.
- **Očekávaný výsledek:** Uživatel otevře Program, vyfiltruje pátek a večerní časy, zobrazí si obě scény, vybere několik položek a uloží je do části Můj program.

### Scénář 2: Návštěvník hledá detail konkrétního interpreta

- **Typ uživatele:** Návštěvník, který zná název jedné kapely z plakátu.
- **Cíl:** Najít detail interpreta, čas vystoupení a scénu.
- **Výchozí situace:** Uživatel má v mobilu otevřený web a zadá název kapely do vyhledávání v sekci Účinkující.
- **Očekávaný výsledek:** Web zobrazí kartu interpreta, uživatel otevře detail a zjistí datum, čas, scénu, žánry a krátký popis vystoupení.

### Scénář 3: Návštěvník řeší příjezd a orientaci v areálu

- **Typ uživatele:** Návštěvník z jiného města.
- **Cíl:** Zjistit, jak se dostat na festival, kde jsou scény a kdy má dorazit.
- **Výchozí situace:** Uživatel má koupenou třídenní vstupenku, ale v areálu Nákladového nádraží Žižkov ještě nebyl.
- **Očekávaný výsledek:** Uživatel otevře Praktické informace a Scény, najde mapu areálu, doporučené spojení MHD, pravidla vstupu a popis obou scén.

### Scénář 4: Nový návštěvník vybírá a kupuje denní vstupenku

- **Typ uživatele:** Nový návštěvník festivalu.
- **Cíl:** Rozhodnout se, který den mu programově nejvíce vyhovuje, a koupit jednodenní vstupenku.
- **Výchozí situace:** Uživatel zná jen žánr, který ho zajímá, ale nezná většinu interpretů.
- **Očekávaný výsledek:** Uživatel porovná program podle dnů a žánrů, otevře několik detailů účinkujících, přejde do sekce Vstupenky, vybere jednodenní variantu pro konkrétní den a pokračuje k nákupu nebo rezervaci.

## Datová základna

Datová základna je uložena v souboru `data.json`. Obsahuje entity:

- `festival` - základní identita festivalu,
- `ticketTypes` - typy vstupenek, ceny a hlavní výhody,
- `venues` - dvě festivalové scény,
- `performers` - 60 účinkujících,
- `program` - 60 programových položek.

Vazby jsou řešeny přes jednoznačné identifikátory:

- `program[].performerId` odkazuje na `performers[].id`,
- `program[].venueId` odkazuje na `venues[].id`.

Každá programová položka má přesně jednoho interpreta a jednu scénu. Program pokrývá 3 festivalové dny, vždy 20 položek za den, celkem tedy 60 položek.
