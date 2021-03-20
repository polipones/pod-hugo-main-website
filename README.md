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

## Kontakt na autora
**Jan Picka** - j.picka@pod.cvut.cz (j.picka97@gmail.com)