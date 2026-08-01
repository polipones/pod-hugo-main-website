---
# Will be displayed at top of the page as main heading
title: Síť
# Has to be in format <parent-site/current-site>, e.g. services/network (notice missing slash at the beginning)
url: vyhody/sit
aliases:
  - /sluzby/sit
slug: sit
weight: 2
---

## Jak se připojit k internetu

#### Budeš potřebovat

- občanku nebo ISIC
- platnou ubytovací smlouvu nebo platnou kolejenku
- číslo svého pokoje
- zařízení, která chceš registrovat pro přístup k síti

#### Další postup

1. S potřebnými doklady a zařízeními navštiv televizora. Jejich aktuální seznam najdeš v [kontaktech]({{< ref "/contacts/index.md" >}}). Návštěvu si naplánuj na rozumnou denní dobu.
2. U televizora vyplníš přihlášku do klubu. Po její kontrole tě zaregistruje v Hydře, případně ti poskytne síťový kabel a aktivuje internet na deset dní. Během této doby musíš zaplatit členský příspěvek. Televizor ti také sdělí ID, které slouží jako variabilní symbol při platbách a k identifikaci při řešení problémů. K aktivaci výhod se musíš prokázat platnou ubytovací smlouvou nebo kolejenkou.

### Bezdrátové připojení (Wi‑Fi)

Wi‑Fi je dostupná na všech blocích, ve sportovišti a v okolí menzy.

Zaregistrovat můžeš nejvýše tři bezdrátová zařízení, po jednom v každé kategorii (notebook, telefon a tablet). O odůvodněnou výjimku můžeš požádat správce sítě.

Postup je stejný jako při registraci kabelového připojení: navštiv televizora a vezmi s sebou zařízení, které chceš používat.

Kolejní Wi‑Fi síť se jmenuje „Pod-O-Lee“ a pracuje v pásmech 2,4 a 5 GHz. Přihlašuješ se klubovým e-mailem, který najdeš v Hydře (například j.novak1@pod.cvut.cz), a síťovým heslem. Síťové heslo se liší od hesla do Hydry a můžeš ho nastavit na stránce <https://hydra.pod.cvut.cz/services/network>.

{{<figure src="images/services/network/hydra_wifi_password.png" alt="Nastavení hesla k Wi-Fi v Hydře" imgop="rt_fit">}}

#### Problém s připojením – náhodná MAC adresa

Každý výrobce tuto funkci označuje jinak. Pokud je zapnutá, zařízení se nemusí připojit, protože síť porovnává jeho MAC adresu s adresou uloženou v Hydře. Pro síť Pod-O-Lee proto nastav pevnou MAC adresu zařízení.

Pokud to nepomůže, kontaktuj televizora na svém nebo sousedním bloku. Aktuální seznam najdeš v [kontaktech]({{< ref "/contacts/index.md" >}}).

#### Zabezpečení

Používáme WPA2-Enterprise a 802.1X EAP. Ověření certifikátu našeho RADIUS serveru a domény radius.pod.cvut.cz je nutné, pokud chceš mít jistotu, že ses připojil skutečně k naší síti, a ne k podvrženému přístupovému bodu.

Používáme certifikáty od CESNETu, našeho poskytovatele připojení k akademické síti ČVUT. Certifikáty jsou podepsány společností USERTrust a většina systémů jim proto automaticky důvěřuje. Další informace najdeš na stránce [Certifikáty CESNET](https://pki.cesnet.cz/cs/ch-tcs-ssl-ca-4-crt-crl.html). Certifikát obvykle není nutné stahovat ručně; s nastavením ti případně pomůže televizor.

#### Nastavení zařízení

##### Windows

Náhodná MAC adresa by měla být vypnutá. Potom stačí vybrat síť a připojit se klubovým e-mailem a síťovým heslem nastaveným v [Hydře](https://hydra.pod.cvut.cz/).

##### Android

Při prvním pokusu o připojení do Pod-O-Lee sítě budeš vyzván k přihlášení. Spolu s tvým přihlašovacím jménem a heslem pro síť nastav následující údaje:

- EAP method (Metoda EAP): PEAP (pokud tuto volbu nevidíš, rozklikni Advanced options - Pokročilé možnosti)
- Phase-2 authentication (Ověření Phase 2): MSCHAPV2 (u starších Androidů je možné zvolit None - Žádné)
- CA certificate (Certifikát CA): Use system certificates (Použít certifikáty systému), je nutné zvolit ověřování certifikátu, pokud chceš, aby tvoje připojení bylo bezpečné
- Domain (Doména): radius.pod.cvut.cz
- Identity (Identita): tvůj klubový e-mail, např. p.novak@pod.cvut.cz
- Password (Heslo): síťové heslo nastavené v [Hydře](https://hydra.pod.cvut.cz/)

{{<figure src="images/services/network/android_tutorial.jpg" alt="Android tutorial" imgop="rt_fit">}}

##### iOS

Než se přihlásíš, otevři informace o Wi‑Fi síti „Pod-O-Lee“ a v nastavení soukromé adresy vyber možnost používat adresu zařízení.

Poté se přihlas klubovým e-mailem a síťovým heslem nastaveným v [Hydře](https://hydra.pod.cvut.cz/). Systém tě vyzve k potvrzení důvěry v certifikát RADIUS serveru.

##### Linux

V Linuxu záleží na konkrétní distribuci, ale parametry jsou stejné jako v Androidu. Certifikáty bývají uloženy v adresáři `/etc/ca-certificates/extracted/`, například v souboru `/etc/ca-certificates/extracted/ca-bundle.trust.crt`.

### Připojení přes kabel (Ethernet)

Není potřeba dělat další kroky, stačí jen zapojit kabel do registrovaného zařízení.
Každý člen může mít připojen pouze jeden počítač na kabelu, případné další musí povolit správce sítě.

## Přihlášení k odběru e-mailů

Každý nově registrovaný člen je automaticky přihlášen do konference kolej-info@pod.cvut.cz. Vedoucí kolejí tam posílá důležité informace, například o revizích, odstávkách a kontrolách, a zástupci klubu oznamují akce, volby a další novinky.

Hodí se také odebírat blokovou konferenci info-x@pod.cvut.cz, kde `x` nahraď písmenem svého bloku. Oznamují se tam například volby správce nebo blokové akce.

Konference jsou moderované, což omezuje nevyžádanou poštu. Pokud přes ně chceš rozeslat důležitou informaci, napiš na <admins@pod.cvut.cz>.

Tyto konference je možné přihlásit i odhlásit v Hydře: <https://hydra.pod.cvut.cz/mailing>.

{{<figure src="images/services/network/hydra_mailing.png" alt="E-mailové konference v Hydře" imgop="rt_fit">}}

## Více o naší síti

Z bezpečnostních důvodů nezveřejňujeme všechny podrobnosti o fungování interní sítě. Pomoc s jejím rozvojem ale vítáme. Pokud se chceš zapojit a získat praxi, napiš na <admin@pod.cvut.cz>.

### Co všechno je "síť"

Téměř vše, co na kolejích souvisí s počítači, spravuje ve volném čase skupina studentů. Výjimkou jsou systémy a počítače SÚZ ČVUT, například v kancelářích, skladu, údržbě a menze.

#### Fyzická infrastruktura

- Momentálně je síť vystavěna na prvcích firmy Cisco a Huawei. Konkrétně to jsou L3 přepínače od Cisco (C3560, C4500) a Huawei přepínače (stack S5720 a S6720).
- Optické spoje propojující jednotlivé bloky (redundance je zajištěná křížovou a kruhovou fyzickou topologií), metalické spoje (připojení AP) a strukturovaná kabeláž (připojení jednotlivých pokojů do serverovny na bloku).
- Bezdrátová konektivita je zajištěna AP od firmy Ruckus, konkrétně modely R510.
- Drtivá většina serverů běží na OS Debian.

{{<figure_gallery>}}
    {{<figure src="images/services/network/rack-1.jpg" alt="Rack 1" imgop="rt_fit">}}
    {{<figure src="images/services/network/rack-2.jpg" alt="Rack 2" imgop="rt_fit">}}
{{</figure_gallery>}}

#### Logická infrastruktura

- Hlavní (core) služby: DHCP ([isc-dhcp](https://www.isc.org/dhcp/)), DNS ([knot-dns](https://www.knot-dns.cz/), [knot-resolver](https://www.knot-resolver.cz/)), RADIUS ([freeradius](https://freeradius.org/)).
  - Spravujeme doménu pod.cvut.cz, rozsah IPv4 147.32.88.0/21 a rozsah IPv6 2001:718:2:800::/56.
- Vlastní "hostingové" služby
  - Webové aplikace, stránky a služby: PHP ([Laravel](https://laravel.com/)), Python ([Django](https://www.djangoproject.com/)), JavaScript ([Node.js](https://nodejs.org/en/), [Angular](https://angular.io/)), Nginx i Apache, PostgreSQL, MySQL, Redis a RabbitMQ
  - Mailové služby
    - Mailové schránky @pod.cvut.cz, @mezibloky.pod.cvut.cz ([mailcow-dockerized](https://mailcow.github.io/mailcow-dockerized-docs/))
    - E-mailové aliasy pro všechny členy klubu z/na adresy @pod.cvut.cz
    - E-mailové konference ([Mailman 3](https://list.org/))
  - Vlastní informační systém - [Hydra](https://hydra.pod.cvut.cz)
    - Systém navržený ve stylu mikroslužeb
    - Backend: Python (Django) s HTTP API
    - Frontend: Bootstrap 3 (AdminLTE) a JavaScript; cílem je přepsat frontend pomocí moderního frameworku, pomoc vítána – [kontakt na správce systémů]({{< ref "/contacts/index.md#síťaři" >}})
  - Konkrétní webové stránky/aplikace
    - Oficiální webové stránky klubu ([Hugo](https://gohugo.io/)) - [pod.cvut.cz](https://pod.cvut.cz)
    - Cloudové úložiště pro aktivní členy klubu ([Nextcloud](https://nextcloud.com/)) - [cloud.pod.cvut.cz](https://cloud.pod.cvut.cz)
    - Webmail pro aktivní členy klubu - [webmail.pod.cvut.cz](https://webmail.pod.cvut.cz)
- Kartový systém (momentálně od firmy IMA, hledáme náhradu za moderní řešení)
- Kamerový systém postavený na kamerách od firmy Hikvision

## Pravidla používání počítačové sítě

Každý uživatel počítačové sítě má svá práva a povinnosti, které upravují interní předpisy. Používáním akademické sítě se zavazuješ dodržovat pravidla klubu, Studentské unie ČVUT, ČVUT a CESNETu.

### Jak je to v praxi

Tato část poskytuje pouze stručný přehled pravidel používání počítačové sítě. Není úplná a nemusí být aktuální.
Pro přesné znění pravidel si přečti interní předpis vztahující se k tomuto tématu v sekci [Dokumenty]({{< ref "/documents#interní-předpisy" >}}).

- Síť nesmíš používat pro komerční účely.
- Síť nesmíš využívat pro nelegální účely.
  - Patří sem například napadání sítí a serverů nebo stahování a šíření nelegálního obsahu.
- Pokud dostaneme hlášení, že je tvoje zařízení napadené malwarem, odpojíme ho od sítě, dokud neprokážeš, že je bezpečné.
- V síti můžeš používat pouze zařízení, které je evidované v našem systému.
  - S tím souvisí i to, že nesmíš poskytovat přístup do sítě jiným osobám
  - Z tohoto důvodu nesmíš ani rozšiřovat tuto síť (například pomocí vlastního routeru).

Síť je monitorována, takže porušení pravidel lze odhalit. Sankce se odvíjejí od závažnosti přestupku a mohou zahrnovat i zákaz přístupu k síti.

S konkrétním požadavkem se obrať na televizora na svém nebo sousedním bloku, případně na někoho ze síťařů. Aktuální seznam najdeš v [kontaktech]({{< ref "/contacts/index.md" >}}).
