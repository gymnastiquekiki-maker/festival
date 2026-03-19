# Datova zakladna

- `data/festival.xml` je kopie zdrojoveho XML z korene projektu.
- XML bylo rozsirené o `description`, `tickets` a `links`, aby slo vygenerovat endpoint `GET /api/festival` se skutecnymi daty pro popis, vstupenky a odkazy.
- `data/festival.xsd` obsahuje vlastni omezeni (patterny, enumerace a rozsahy) oznacena komentari.

## Transformace XML -> XSLT -> JSON

Spusteni transformace (PowerShell):
```
C:\Users\krist\OneDrive\druhak\Značkovací jazyky\data\transform.ps1
```

Vystupy:
- `data/json/festival.json`
- `data/json/venues.json`
- `data/json/venues/{id}.json`
- `data/json/performers.json`
- `data/json/performers/{id}.json`
- `data/json/events.json`
- `data/json/events/{id}.json`

Poznamka: JSON struktury odpovidaji API datum definovanym v `data/openapi.yaml`.
