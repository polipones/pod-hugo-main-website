# Web Pod-O-Lee

Vytvořeno pomocí frameworku Hugo (https://gohugo.io/) a stylu upraveného z PaperMod (https://github.com/adityatelange/hugo-PaperMod/).

Finální verzi upraveného stylu je možné najít zde: https://github.com/polipones/pod_hugo_theme.

## Lokální instalace

_Poznámka: Web je stále ve vývoji a je možné, že návod není kompletní._

1. Naklonovat repozitář webu

```bash
git clone git@gitlab.pod.cvut.cz:weby/main-website.git
```

2. Naklonovat styl

```bash
git submodule add https://github.com/polipones/pod_hugo_theme.git themes/POD --depth=1
git submodule update --init --recursive
```

3. Nainstalovat Hugo: https://gohugo.io/getting-started/installing/
4. Ve složce projektu spustit server

```bash
npm run dev
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

Pak stačí nově vytvoření soubor upravit na místech vyznačených pomocí _#TODO_.

### Vytváření příspěvků

Opět hodně podobné vytváření kategorií a stránek. Akorát je potřeba znovu vyměnit typ stránky na [archetypes/post.md](archetypes/post.md).

Pro českou verzi příspěvků:

```bash
hugo new --kind post posts/<slug-kategorie>/<slug-prispevku>.md
```

Konkrétní příklad:

```bash
hugo new --kind post posts/people/televizors.md
```

Jazykové mutace:

```bash
hugo new --kind post posts/<slug-kategorie>/<slug-prispevku>.<zkratka-jazyka>.md
```

Konkrétní příklad:

```bash
hugo new --kind post posts/people/televizors.en.md
```

Pár důležitých poznámek:

- `slug-prispevku` musí být pro všechny jazykové mutace stejný, jinak stránky nebudou v rámci jazyků propojené odkazy.
- `slug-prispevku` musí být unikátní v dané složce.

## Kontakt na autora

**Jan Picka** - j.picka@pod.cvut.cz (j.picka97@gmail.com)
