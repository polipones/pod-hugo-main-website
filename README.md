# Web Pod-O-Lee

Vícejazyčný statický web vytvořený pomocí [Huga](https://gohugo.io/).
Používá [téma POD](https://github.com/polipones/hugo-PaperMod-POD), odvozené od PaperModu a připojené jako Git submodul v `themes/POD`.

## Lokální spuštění

Příkazy spouštěj z kořenové složky repozitáře. Pro vývoj není potřeba spouštět Hydru ani Kubernetes; kontakty se stahují z veřejného API Hydry.

### Stažení projektu

Potřebuješ Git a přístup k repozitáři na GitLabu (pro následující SSH adresu také nastavený SSH klíč).

```bash
git clone --recurse-submodules git@gitlab.pod.cvut.cz:weby/main-website.git
cd main-website
```

Pokud už máš repozitář naklonovaný nebo se po aktualizaci změnila verze tématu:

```bash
git submodule update --init --recursive
```

Nepoužívej `git submodule add`: téma je už zapsané v `.gitmodules`. Inicializace stáhne verzi připnutou v repozitáři.

### Varianta A: Docker Compose

Potřebuješ běžící Docker Engine nebo Docker Desktop a příkaz `docker compose`.
Hugo, Python a nástroje pro stažení kontaktů jsou součástí obrazu, na hostiteli je instalovat nemusíš.
Konfigurace používá Hugo **0.164.0** a imgproxy **v3.27**.

Obrazy se stahují z `registry01.in.podolee.cz`. Pokud registry vrací `401 Unauthorized` nebo `denied`, ověř přístup a přihlas se účtem s oprávněním číst obrazy:

```bash
docker login registry01.in.podolee.cz
```

Bez přístupu k registry použij variantu B níže.

```bash
docker compose up --build
```

- Web: <http://localhost:1313/>; anglická verze: <http://localhost:1313/en/>; ruská verze: <http://localhost:1313/ru/>.
- Obrázky přes imgproxy: `http://localhost:8080` (port je přístupný jen z lokálního počítače).
- Změny souborů se průběžně promítají do webu díky připojené složce projektu.
- Při startu `web` spouští `scripts/run_server.sh`, který nejprve zkusí obnovit kontakty a potom spustí Hugo.
- Výchozí náhled nezobrazuje koncepty (`draft: true`), budoucí ani expirované příspěvky.

Ukončení: `Ctrl+C`, potom odstranění kontejnerů a sítě:

```bash
docker compose down
```

Logy při potížích:

```bash
docker compose logs --tail=100 web imgproxy
```

### Varianta B: Hugo přímo na počítači

Tato varianta nevyžaduje přístup k Docker registry. Následující příkazy jsou pro Bash na Linuxu nebo ve WSL; na jiných systémech musí být dostupné také použité unixové nástroje.

Nainstaluj:

- [Hugo 0.164.0](https://github.com/gohugoio/hugo/releases/tag/v0.164.0), stejně jako v Dockerfilech; stačí standardní varianta, Extended není nutná.
- Bash, `wget`, `jq` a `readlink` s podporou `-f` pro stažení kontaktů.
- Python 3.10 nebo novější pro kontrolu interních odkazů; skript používá jen standardní knihovnu.

Ověř instalaci a stáhni kontakty:

```bash
hugo version
python3 --version
bash scripts/fetch_contacts.sh
jq -e '.code == 200 and (.data | type == "object")' data/contacts.json > /dev/null
```

Skript pro kontakty používá syntaxi Bashe, proto jej na hostiteli spouštěj přes `bash`, ne přes `sh`.
Potom spusť náhled s veřejným produkčním imgproxy:

```bash
HUGO_PARAMS_IMGPROXYURL=https://img.podolee.cz \
  hugo server --disableFastRender --navigateToChanged
```

Web je na <http://localhost:1313/> a ukončíš jej pomocí `Ctrl+C`.
Proměnná mění pouze adresu služby pro obrázky, nikoli prostředí nebo obsah webu. Vzdálené obrázky vyžadují připojení k internetu.
Pro náhled konceptů přidej `--buildDrafts` (případně `--buildFuture` pro budoucí příspěvky).

Pokud máš přístup k Docker registry a chceš lokální imgproxy, spusť jej samostatně a u Huga proměnnou vynech:

```bash
docker compose up -d imgproxy
hugo server --disableFastRender --navigateToChanged
```

### Kontakty a připojení k síti

`scripts/fetch_contacts.sh` čte `https://hydra.pod.cvut.cz/api/v2/users/roles` a ukládá odpověď do `data/contacts.json`.
Tento soubor není verzovaný a je potřeba i pro sestavení stránek s kontakty. Nativní spuštění Huga ani validační skript jej samy nestahují.

- Před prvním sestavením musí proběhnout úspěšné stažení; zkontroluj výpis `Fetching succesful` a strukturu JSON příkazem výše.
- Pro obnovení dat zastav nativní server, spusť znovu `bash scripts/fetch_contacts.sh` a server znovu zapni. U Compose obnovu vyvolá restart služby `web`.
- Při výpadku Hydry můžeš pro nativní vývoj použít již existující platný soubor a krok stažení vynechat. Bez něj nejde o plně offline postup.
- Kontakty ani jiné osobní exporty necommituj. Stejně tak necommituj generované `public/`, `resources/_gen/` nebo `.hugo_build.lock`.

## Kontrola před odesláním změn

Automatická kontrola je v `scripts/validate_site.sh`. Nejprve sestaví web s chybou při každém varování Huga a potom pomocí `scripts/check_internal_links.py` ověří interní odkazy, obrázky, další odkazované soubory a fragmenty (`#kotva`). Externí HTTP adresy neověřuje; jejich dostupnost a vzhled stránek zkontroluj v prohlížeči.

Po přípravě kontaktů spusť kontrolu pro obě nasazovaná prostředí. V Compose nejprve sestav obraz služby `web` pomocí `docker compose build web`, pokud ještě není sestavený.

Přes Docker Compose:

```bash
docker compose run --rm --no-deps web sh scripts/validate_site.sh
docker compose run --rm --no-deps -e HUGO_ENV=develop web sh scripts/validate_site.sh
```

Tyto příkazy nahrazují běžný start služby: nestahují kontakty ani nespouštějí server nebo imgproxy. Kontakty musí být předem v `data/contacts.json` (například po úspěšném startu Compose).

Přímo na počítači:

```bash
sh scripts/validate_site.sh
HUGO_ENV=develop sh scripts/validate_site.sh
```

Bez argumentu používá skript dočasnou složku, kterou po skončení odstraní. Výchozí prostředí je `production`.
Pro uchování výsledku můžeš zadat výstupní složku:

```bash
sh scripts/validate_site.sh public
```

**Pozor:** zadaná složka se před sestavením čistí (`--cleanDestinationDir`); nepoužívej složku se zdrojovými soubory.
Úspěšná kontrola končí zprávou `all internal references resolve.`
I po ní ručně prohlédni upravené stránky, navigaci, obrázky a dotčené jazykové verze.

## Struktura projektu a prostředí

| Cesta | Účel |
| --- | --- |
| `content/` | Stránky a příspěvky v Markdownu; obrázky konkrétní stránky patří do její složky. |
| `archetypes/` | Šablony pro vytváření stránek, kategorií a příspěvků. |
| `layouts/` | Vlastní šablony a shortcody; mají přednost před tématem. |
| `assets/css/extended/` | Vlastní CSS. |
| `static/` | Sdílené soubory kopírované do výstupu beze změny. |
| `themes/POD/` | Připnutý submodul tématu; úpravy webu přednostně dělej v tomto repozitáři. |
| `config/_default/` | Společná konfigurace, jazyky a navigace. |
| `config/develop/` | Nastavení stagingu. |
| `config/production/` | Nastavení produkce. |
| `scripts/` | Stažení kontaktů, lokální server a validace sestaveného webu. |
| `helm-chart/` | Kubernetes nasazení webu a imgproxy. |

`hugo server` standardně používá prostředí **`development`**, nikoli **`develop`**.
Lokální náhled proto používá společnou konfiguraci s lokálním imgproxy, pokud jeho adresu nepřepíšeš proměnnou výše.
`develop` je explicitně pojmenované prostředí stagingu; běžné `hugo` bez serveru používá `production`.

## Úpravy obsahu

Příkazy níže vyžadují lokálně dostupné Hugo. Při práci jen s Dockerem nahraď `hugo` za `docker compose run --rm --no-deps web hugo`.
Používej nové, dosud neexistující cesty; ukázky zde vytvářejí stránku `example-room` a kategorii `example-category`.

### Vytvoření stránky

Výchozí šablona je [archetypes/default.md](archetypes/default.md); parametr `--kind single` není potřeba.

```bash
hugo new services/example-room/index.md
hugo new services/example-room/index.en.md
```

### Vytvoření kategorie příspěvků

Použij [archetypes/post_category.md](archetypes/post_category.md). Kategorie má soubor **`_index.md`** s podtržítkem.

```bash
hugo new --kind post_category posts/example-category/_index.md
hugo new --kind post_category posts/example-category/_index.en.md
```

Zanořenou kategorii vytvoříš stejným příkazem s delší cestou, například `posts/sport/water-sports/_index.md`.

### Vytvoření příspěvku

Použij [archetypes/post.md](archetypes/post.md):

```bash
hugo new --kind post posts/example-category/example-post/index.md
hugo new --kind post posts/example-category/example-post/index.en.md
```

### Jazyky, obrázky a publikování

- Čeština používá `index.md` nebo `_index.md`, angličtina příponu `.en.md`, ruština `.ru.md`.
- Překlady jedné stránky musí být ve stejné složce se stejným slugem, aby je Hugo propojilo.
- Adresáře pojmenovávej malými písmeny se spojovníky. Obrázky konkrétní stránky patří vedle jejího Markdown souboru nebo do podsložky, sdílené soubory do `static/`.
- Vytvořený soubor doplň na místech označených `TODO`; zejména nastav titulek, případnou výslednou adresu `url` a u příspěvků datum. Výsledná URL nemusí odpovídat cestě zdrojového souboru.
- Stránky a příspěvky vznikají s `draft: true`. Až jsou připravené, změň jej na `false` nebo řádek odstraň. U výchozí šablony také odstraň pomocný shortcode `linktraslations` označený k odstranění.
- Pokud přidáváš, přesouváš nebo rušíš položku navigace, uprav také menu příslušného jazyka v `config/_default/config.yml` a spusť validaci obou prostředí.

## Nasazení

GitLab CI v [.gitlab-ci.yml](.gitlab-ci.yml) automaticky sestavuje a nasazuje:

| Větev | Prostředí Huga | Web |
| --- | --- | --- |
| `develop` | `develop` | <https://new.podolee.cz> |
| `main` | `production` | <https://podolee.cz> |

`Dockerfile.remote` inicializuje submoduly, stahuje kontakty a spouští stejný validační skript. Výsledné statické soubory servíruje nginx; GitLab CI nasazuje obraz pomocí Helm chartu. Pro lokální vývoj tyto nasazovací kroky nejsou potřeba.

## Řešení častých problémů

| Projev | Co zkontrolovat |
| --- | --- |
| Chybějící téma nebo šablony | Spusť `git submodule update --init --recursive`. |
| `401 Unauthorized` / `denied` při stahování obrazu | Přístup k `registry01.in.podolee.cz` a `docker login`; případně použij nativní variantu. |
| Chyba při zpracování kontaktů nebo prázdné kontakty | Dostupnost API Hydry a platný `data/contacts.json`; spusť stažení přes Bash a ověř JSON. |
| Načte se web, ale chybí vzdálené obrázky | Běžící imgproxy na portu 8080, případně proměnná `HUGO_PARAMS_IMGPROXYURL`; zkontroluj také přístup k úložišti obrázků. |
| Nová stránka není vidět | `draft`, datum příspěvku, případné `publishDate`/`expiryDate` a nastavená výsledná URL. |
| Port 1313 nebo 8080 je obsazený | Ukonči jiný lokální server/kontejner. Při změně portu imgproxy musíš upravit také `params.imgproxyUrl`. |
| Lokální a nasazený web se liší | Zkontroluj rozdíl mezi prostředími `development`, `develop` a `production` a spusť obě validace. |

## Kontakt na autora

**Jan Picka** – <j.picka@pod.cvut.cz> (<j.picka97@gmail.com>)
