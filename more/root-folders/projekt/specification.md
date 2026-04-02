# Specifikace projektu: Iron Forge Prague 2026

## Identita festivalu

- **Název:** Iron Forge Prague 2026
- **Ročník:** 5. ročník
- **Lokalita:** Nákladové nádraží Žižkov, Praha
- **Datum:** 14. 8. 2026 – 16. 8. 2026 (3 dny)
- **Žánr:** metal (heavy, thrash, symfonický, extrémní)

## Charakter a cílové publikum

Festival je zaměřen na fanoušky metalové hudby a klade důraz na energii živých koncertů, pyrotechniku a komunitní atmosféru. Vizuální styl webu pracuje s industriální estetikou, ohněm a masivním zvukem.

## Struktura webu a obsah

1. **Úvod (index.html)**
   - Hero sekce, krátké představení festivalu a základní fakta.
   - Přehled scén (Steel Stage, Pyro Hall).
   - Galerie atmosféry.
   - Sekce vstupenek (jednodenní, třídenní, VIP).

2. **Program (program.html)**
   - Harmonogram rozdělený podle dnů (Pátek 14. 8., Sobota 15. 8., Neděle 16. 8.).
   - Dvě scény: Steel Stage a Pyro Hall.
   - Program je v HTML uveden staticky a zároveň se může dynamicky přegenerovat z XML API.

3. **Účinkující (performers.html)**
   - Seznam 60 kapel napříč subžánry metalu.
   - Detailní profily vybraných interpretů s fotografií a odkazem na poslech.

4. **Praktické informace (info.html)**
   - Místo konání a mapa areálu (Nákladové nádraží Žižkov).
   - Doprava, parkování, otevření bran (16:00).
   - Ubytování, bezpečnost, pravidla vstupu (18+), služby a pyrotechnika.

## Datové zdroje

- Web využívá festivalové XML API `festival.xml` (alternativně označeno jako `/api/festival`).
- Stránky obsahují `data-endpoint` odkazy na konkrétní části XML (info, venues, performers, events).

## Funkční prvky

- JSON-LD schema.org (MusicFestival + Event) pro SEO.
- Dynamické načítání programu z XML na stránce `program.html` s fallbackem na statický HTML obsah.
- Odkazy na vstupenky a externí mapu.
