# Datova zakladna

- `data/festival.xml` je hlavni XML zdroj projektu.
- `data/festival.xsd` obsahuje vlastni omezeni (patterny, enumerace a rozsahy) oznacena komentari.

## Navazujici API cast

Transformace a API vystupy jsou oddeleny mimo slozku `data`:
- `7xAPI/transformation/` obsahuje 7 XSLT transformaci
- `7xAPI/json/` obsahuje 7 API JSON vystupu a detailni JSON soubory
- `7xAPI/json-schema/` obsahuje 7 JSON Schema souboru navazanych na endpointy
- `API/openapi.yaml` obsahuje OpenAPI 3.1 specifikaci

Spusteni transformace (PowerShell):
```
C:\Users\krist\OneDrive\druhak\Značkovací jazyky\7xAPI\transform.ps1
```
