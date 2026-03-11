# Datová základna

- `data/festival.xml` je kopie zdrojového XML z kořene projektu (bez úprav obsahu).
- `data/festival.xsd` obsahuje vlastní omezení (pattern/rozsahy) označená komentáři.

## Transformace XML → XSLT → JSON

Spuštění transformace (PowerShell):
```
C:\Users\krist\OneDrive\druhak\Značkovací jazyky\data\transform.ps1
```

Výstupy:
- `data/json/info.json`
- `data/json/venues.json`
- `data/json/performers.json`
- `data/json/events.json`

Poznámka: JSON struktury odpovídají API datům ve `festival.xml` (info, venues, performers, events).
