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

Pak stačí nově vytvoření soubor upravit na místech vyznačených pomocí *#TODO*.

## Kontakt na autora

**Jan Picka** - j.picka@pod.cvut.cz (j.picka97@gmail.com)
