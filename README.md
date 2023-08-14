# Web Pod-O-Lee

Vytvořeno pomocí frameworku Hugo (https://gohugo.io/) a stylu upraveného z PaperMod (https://github.com/adityatelange/hugo-PaperMod/).

Finální verzi upraveného stylu je možné najít zde: https://github.com/polipones/hugo-PaperMod-POD.

## Lokální instalace

_Poznámka: Web je stále ve vývoji a je možné, že návod není kompletní._

1. Naklonovat repozitář webu

```bash
git clone git@gitlab.pod.cvut.cz:weby/main-website.git
```

2. Naklonovat styl

```bash
git submodule add https://github.com/polipones/hugo-PaperMod-POD.git themes/POD --depth=1
git submodule update --init --recursive
```

3. Nainstalovat Hugo: https://gohugo.io/getting-started/installing/
4. Nainstalovat Docker: https://docs.docker.com/engine/install/
5. Nainstalovat Docker Compose: https://docs.docker.com/compose/install/
6. Ve složce projektu spustit server

```bash
docker compose build
docker compose up
```

## Úpravy nasazeného webu

Pro provedení úprav na produkční serveru (na adrese https://pod.cvut.cz) je nutné lokální změny commitnout a pushnout na Gitlab větev _main_. Zbytek nasazení je automatický.

Je dobré testovat změny s puštěným lokálním serverem, aby se zamezilo zbytečným chybám při nasazení.

### Vytváření nové stránky

Hugo umí vytvořit novou stránku na základě šablony [archetypes/default.md](archetypes/default.md).

Pro českou verzi stránky:

```bash
hugo new --kind single <slozka>/<slug-stranky>/index.md
```

Konkrétní příklad:

```bash
hugo new --kind single services/music-room/index.md
```

Jazykové mutace:

```bash
hugo new --kind single <slozka>/<slug-stranky>/index.<zkratka-jazyka>.md
```

Konkrétní příklad:

```bash
hugo new --kind single services/music-room/index.en.md
```

Poznámky:

- obrázky, které patří na stránku dávejte do stejné složky (případně do podsložky) k Markdown souboru
  - např. pokud chceme fotku `room-photo.jpg` dát do přípěvku `services/music-room/index.md`, tak fotku umístíme do složky `services/music-room/room-photo.jpg`

Pak stačí nově vytvoření soubor upravit na místech vyznačených pomocí _#TODO_.

### Vytváření kategorie příspěvků

Velmi podobné vytváření stránek. Stačí akorát místo šablony `default` použít [archetypes/post_category.md](archetypes/post_category.md).

Pro českou verzi kategorie:

```bash
hugo new --kind post_category posts/<slug-kategorie>/_index.md
```

Konkrétní příklad:

```bash
hugo new --kind post_category posts/people/_index.md
```

Jazykové mutace:

```bash
hugo new --kind post_category posts/<slug-kategorie>/_index.<zkratka-jazyka>.md
```

Konkrétní příklad:

```bash
hugo new --kind post_category posts/people/_index.en.md
```

Pár důležitých poznámek:

- `slug-kategorie` musí být pro všechny jazykové mutace stejný, jinak stránky nebudou v rámci jazyků propojené odkazy.
- Pokud chceš vytvořit zanořenou kategorii, stačí příslušně upravit cestu. Např. chci vytvořit kategorii `water-sports` v již existující kategorii `sport`. Stačí tedy jako příkaz použít `hugo new --kind post_category posts/sport/water-sports/_index.md`.
- Je důležité, aby soubor ve výsledné složce kategorie měl na začátku podtržítko `_index.md`.

Pak stačí nově vytvoření soubor upravit na místech vyznačených pomocí _#TODO_.

### Vytváření příspěvků

Opět hodně podobné vytváření kategorií a stránek. Akorát je potřeba znovu vyměnit typ stránky na [archetypes/post.md](archetypes/post.md).

Pro českou verzi příspěvků:

```bash
hugo new --kind post posts/<slug-kategorie>/<slug-prispevku>/index.md
```

Konkrétní příklad:

```bash
hugo new --kind post posts/people/televizors/index.md
```

Jazykové mutace:

```bash
hugo new --kind post posts/<slug-kategorie>/<slug-prispevku>/index.<zkratka-jazyka>.md
```

Konkrétní příklad:

```bash
hugo new --kind post posts/people/televizors/index.en.md
```

Pár důležitých poznámek:

- `slug-prispevku` musí být pro všechny jazykové mutace stejný, jinak stránky nebudou v rámci jazyků propojené odkazy.
- `slug-prispevku` je opravdu složka, v níž se tvoří soubory `index` s přídavnou koncovkou podle jazykové mutace.
- obrázky, které patří k příspěvku dávejte do stejné složky (případně do podsložky) k Markdown souboru
  - např. pokud chceme fotku `room-photo.jpg` dát do přípěvku `posts/people/televizors/index.md`, tak fotku umístíme do složky `posts/people/televizors/room-photo.jpg`

## Kontakt na autora

**Jan Picka** - j.picka@pod.cvut.cz (j.picka97@gmail.com)
