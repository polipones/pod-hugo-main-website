---
# Will be displayed at top of the page as main heading
title: Síť
# Has to be in format <parent-site/current-site>, e.g. services/network (notice missing slash at the beginning)
url: sluzby/sit
slug: sit
weight: 2
---

## Jak se připojit k Internetu?

#### Budeš potřebovat

- občanku nebo ISIC
- platnou ubytovací smlouvu nebo platnou kolejenku
- číslo svého pokoje
- zařízení, která chceš registrovat pro přístup k síti

#### Další postup

1. Všechny tyhle věci vezmi a jdi za televizorem ([seznam televizorů v kontaktech]({{< ref "/contacts/index.md" >}})). Televizor je taky jen člověk, proto jeho návštěvu nenechávej na brzké ranní hodiny.
2. U televizora vyplníš přihlášku do klubu on jí zkontroluje a zařadí tě do naší databáze. Dostaneš od něj kabel a také ti aktivuje internet na 10 dní, které máš na zaplacení členského poplatku. Také ti sdělí tvé ID, které použiješ jako variabilní symbol při platbách a budeš se jím prokazovat při řešení problémů. Dále se mu musíš prokázat platnou ubytovací smlouvu nebo platnou kolejenkou, aby ti mohl aktivovat naše služby.

### Bezdrátové připojení (WiFi)

Aktuálně je Wifi dostupná na všech blocích, ve sportovišti a v okolí menzy.

Je možné zaregistrovat nejvíce tři bezdrátová zařízení, jedno pro každou kategorii (jeden notebook, mobil a tablet). O případnou výjimku je možné požádat Správce sítě (s přiloženým odůvodněním).

Postup při registraci je totožný s registrací kabelového připojení. Tj. navštiv svého televizora a vem s sebou zařízení, které chceš používat.

Název kolejní WiFi sítě (SSID) je "Pod-O-Lee" (operuje na frekvencích 2.4 GHz a 5 GHz ). Přihlášení probíhá pomocí klubového e-mailu (najdeš ho u sebe v Hydře, např. j.novak1@pod.cvut.cz) a síťového hesla. Síťové heslo je nezávislé (tj. není totožné) na heslu pro přihlášení do Hydry a je možné ho nastavit na <https://hydra.pod.cvut.cz/services/network> (viz obrázek níže).

{{<figure src="images/services/network/hydra_wifi_password.png" alt="WiFi password setup Hydra" imgop="rt_fit">}}

#### Problém s připojením - Randomizovaná MAC adresa

Tuto funkci si každý výrobce pojmenovává jinak, proto hledejte něco podobného. Pokud je tato funkce zapnutá, nepovede se vám toto zařízení připojit k naší síti, jelikož ověřujeme MAC adresu co máte v Hydře proti té, co má vaše zařízení. Pokud tedy vaše zařízení MAC adresu mění, nepůjde se vám připojit.

Pokud to nepomohlo, kontaktuj televizora na svém prípadně na vedlejším bloku: [{{< ref "/contacts/index.md" >}}]({{< ref "/contacts/index.md" >}}).

#### Zabezpečení

Používáme WPA2 Enterprise/802.1x EAP. Ověření certifikátu našeho RADIUS serveru a shody doménového jména (radius.pod.cvut.cz) je zcela nutné, pokud chcete mít jistotu, že jste opravdu připojeni do naší sítě a nikdo vaši komunikaci nezneužívá (např. vytvořením stejného SSID/jména Wifi, vlastního „fake“ RADIUS serveru → ale už jiného certifikátu). 

Využíváme certifikáty od CESNETu (našeho poskytovatele připojení k akademické síti ČVUT), které jsou mimo jiné podepsány společností USERTrust ([informace o certifikátech od CESNETu](https://pki.cesnet.cz/cs/ch-tcs-ssl-ca-4-crt-crl.html)) a tedy obecně přijímány jako bezpečné (jsou součástí většiny systémových repositářů). Z toho plyne, že není nutné certifikát dodatečně stahovat, aby mohlo ověření proběhnout. Televizor vám zařízení k WiFi připojí, takže se nemusíte bát, že věcem v tomto odstavci nerozumíte :).

#### Nastavení zařízení

##### Windows

Randomizovaná mac adresa by již měla být vypnutá. Stačí tedy jen vybrat síť a připojit se pomocí klubového e-mailu a síťového hesla nastaveného v [Hydře](https://hydra.pod.cvut.cz/).

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

Ještě, než se zkusíš přihlásit rozklikni informace o síti wifi s názvem "Pod-O-Lee", kde uvidíš nastavení mac adresy/adresy telefonu. Tam budeš mít na výběr, kde musíš vybrat "Použít adresu telefonu".

Poté se můžeš přihlásit pomocí tvého klubového e-mailu a síťového heslo nastaveného v [Hydře](https://hydra.pod.cvut.cz/). Budeš pak dotázán, zda důvěřuješ certifikátu radius, tam zaklidni důvěřovat. Poté by neměl být problém se připojit.

##### Linux

V linuxu záleží na distribuci, ale nastavení je stejné jako u androidu. Certifikáty jsou většinou uložené v této lokaci: "/etc/ca-certificates/extracted/", většinou tam nalezneš soubor "/etc/ca-certificates/extracted/ca-bundle.trust.crt".

### Připojení přes kabel (Ethernet)

Není potřeba dělat další kroky, stačí jen zapojit kabel do registrovaného zařízení.
Každý člen může mít připojen pouze jeden počítač na kabelu, případné další musí povolit správce sítě.

## Přihlášení odběru emailů

Každému nově registrovanému členovi se automaticky přihlásí konference kolej-info@pod.cvut.cz. Je to konference, kam vedoucí kolejí posílá důležité informace (revize, odstávky, kontroly, …) nebo zástupci kolejního klubu oznamují akce, volby, atd.

Dále se hodí být členem tvé blokové konference, info-x@pod.cvut.cz, kde x je písmenko tvého bloku. Sem se například ohlašují volby na správce bloku, blokové poznávačky, atd.

Tyto konference jsou moderované, pokud bys chtěl poslat nějakou důležitou informaci ty, dej nám vědět na admins@pod.cvut.cz. Zároveň to zaručuje, že do konferencí nechodí spam.

Tyto konference je možné přihlásit i odhlásit v Hydře: <https://hydra.pod.cvut.cz/mailing>.

{{<figure src="images/services/network/hydra_mailing.png" alt="Email conferences in Hydra" imgop="rt_fit">}}

## Více o naší síti

Z bezpečnostních důvodů nebudeme zveřejňovat detaily o tom, jak funguje naše interní síť do detailu. Vítáme ale pomoc při rozvoji počítačové sítě, pokud se chceš zapojit a získat nějakou praxi, neboj se napsat na mail <admin@pod.cvut.cz>.

### Co všechno je "síť"

Všechno, co má na našich kolejích nějakou souvislost s počítači spravujeme do nejmenšího detailu my, tedy skupina studentů, které to baví a dělají to ve svém volném čase. Jedinou výjimkou jsou počítače SÚZu, které si spravují sami (kanceláře, sklad na Fku, údržbáři, menza, ...).

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
  - Spravujeme doménu pod.cvut.cz, IPv4 rozsah 147.32.88.0/21 a IPv6 rozsah 2001:718:2:800:/56.
- Vlastní "hostingové" služby
  - Webové aplikace, stránky a služby: PHP ([Laravel](https://laravel.com/)), Python ([Django](https://www.djangoproject.com/)), Javascript ([NodeJS](https://nodejs.org/en/), [Angular](https://angular.io/)), Nginx i Apache, PostgreSQL, MySQL, Redis, RabbitMQ
  - Mailové služby
    - Mailové schránky @pod.cvut.cz, @mezibloky.pod.cvut.cz ([mailcow-dockerized](https://mailcow.github.io/mailcow-dockerized-docs/))
    - Emailové aliasy pro všechny členy klubu z/na @pod.cvut.cz adresy
    - Emailové konference ([Mailman 3](https://list.org/))
  - Vlastní informační systém - [Hydra](https://hydra.pod.cvut.cz)
    - Systém navržený ve stylu mikroslužeb
    - Backend: Python (Django) s HTTP API
    - Frontend: Bootstrap 3 (AdminLTE) + JS (cílem je přepsat frontend pomocí nějakého frameworku - help needed -> [Kontakt na správce systémů]({{< ref "/contacts/index.md#síťaři" >}}))
  - Konkrétní webové stránky/aplikace
    - Oficiální webové stránky klubu ([Hugo](https://gohugo.io/)) - [pod.cvut.cz](https://pod.cvut.cz)
    - Rezervační systém ve vývoji - [olymp.pod.cvut.cz](https://olymp.pod.cvut.cz)
    - Cloudové úložiště pro aktivní členy klubu ([Nextcloud](https://nextcloud.com/)) - [cloud.pod.cvut.cz](https://cloud.pod.cvut.cz)
    - Webmail pro aktivní členy klubu - [webmail.pod.cvut.cz](https://webmail.pod.cvut.cz)
- Kartový systém (momentálně od firmy IMA, hledáme náhradu za moderní řešení)
- Kamerový systém postavený na kamerách od firmy Hikvision

## Pravidla používání počítačové sítě

Každý uživatel počítačové sítě má svá práva a povinnosti. Vše je definované v interních předpisech o pravidlech používání počítačové sítě. 
Používáním akademické sítě se zavazuješ dodržovat pravidla definované nejen v našich stanovách, ale i pravidla Studentské Unie, ČVUT a CESNETu.

### Jak je to v praxi

Tato část slouží pouze jen pro přiblížení pravidel používání počítačové sítě, není úplná a nemusí být aktuální!
Pro přesné znění pravidel si přečti interní předpis vztahující se k tomuto tématu v sekci [Dokumenty]({{< ref "/documents#interní-předpisy" >}}).

- Síť nesmíš používat pro komerční účely.
- Síť nesmíš využívat pro nelegální účely.
  - Napříkad: Nabourávání se do sítí a serverů, stahování a šíření nelegálních věcí (nejčastější obdobou jsou torrenty).
- Zda dostaneme hlášení, že je tvoje zařízení infokované nějakým virem, odpojíme tvé zařízení od sítě, dokud nám neprokážeš, že je toto zařízení bez virů.
- V síti můžeš používat pouze zařízení, které je evidované v našem systému.
  - S tím souvisí i to, že nesmíš poskytovat přístup do sítě jiným osobám
  - Z tohoto důvodu nesmíš ani rozšiřovat tuto síť (například pomocí vlastního routeru).

Síť je monitorována a tudíž porušování těchto pravidel lze detekovat. Přestupky jsou pak řešeny a postihnuty nejen na základě závažnosti. Tyto postihy mohou například být ban. 

Jestli máš nějaké konkrétní požadavek, kontaktuj televizora na svém prípadně na vedlejším bloku nebo někoho ze síťařů: [{{< ref "/contacts/index.md" >}}]({{< ref "/contacts/index.md" >}}).
