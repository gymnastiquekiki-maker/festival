# Iron Forge Prague 2026

Tahle slozka je srovnana tak, aby byly aktivni casti projektu oddelene od starsich pracovnich kopii.

Aktivni casti projektu:
- `web/` - finalni web pro odevzdani
- `data/` - XML a XSD datova vrstva
- `7xAPI/` - XSLT transformace, JSON vystupy a JSON Schema
- `API/` - OpenAPI specifikace

Dalsi slozky:
- `archive/legacy-root-copy/` - puvodni pracovni kopie HTML/CSS/XML assetu z korene
- `projekt/` - starsi navrhove podklady
- `fotky/` - zdrojove obrazky a inspiracni materialy
- `cv/` - vedlejsi cvicny obsah

Dulezite soubory:
- `DOCUMENTATION.md` - puvodni rozsahlejsi dokumentace
- `DOCUMENTATION_NEW.md` - nova projektova dokumentace
- `specification.md` - kratka specifikace zadani

Doporuceny start:
```powershell
cd .\web
python -m http.server 8000
```

Potom otevrit `http://localhost:8000/index.html`.
