---
# Will be displayed at top of the page as main heading
title: Síť
# Has to be in format <parent-site/current-site>, e.g. services/network (notice missing slash at the beginning)
url: sluzby/sit
slug: sit
weight: 2
---

## Jak se připojit k Internetu?

1. Připrav občanku nebo ISIC. Zapamatuj si číslo pokoje. Vezmi s sebou všechna zařízení (kromě PC, tady stačí MAC adresa), která chceš registrovat pro přístup k síti.
2. Pokud na pokoji nemáš síťový kabel, je krátký, nebo se ti prostě nezdá, připrav si i odhad, jak dlouhý kabel budeš potřebovat a starý kabel vezmi sebou.
3. Jdi za televizorem, který je většinou na každém druhém patře bloku a má to napsané na dveřích. Televizor je taky jen člověk, proto jeho návštěvu nenechávej na brzké ranní hodiny.
4. U televizora vyplníš přihlášku do klubu on jí zkontroluje a zařadí tě do naší databáze. Dostaneš od něj kabel a také ti aktivuje internet na 10 dní, které máš na zaplacení členského poplatku. Také ti sdělí tvé ID, které použiješ jako variabilní symbol při platbách a budeš se jím prokazovat při řešení problémů.

### Bezdrátové připojení (WiFi)

Aktuálně je Wifi dostupná na všech blocích, ve sportovišti a v okolí menzy.

Je možné zaregistrovat nejvíce tři bezdrátová zařízení, jedno pro každou kategorii (jeden notebook, mobil a tablet). O případnou výjimku je možné požádat Správce sítě (s přiloženým odůvodněním).

Postup při registraci je totožný s registrací kabelového připojení. Tj. navštiv svého televizora a vem s sebou zařízení, které chceš používat.

Název kolejní WiFi sítě (SSID) je "Pod-O-Lee" (operuje na frekvencích 2.4 GHz a 5 GHz ). Přihlášení probíhá pomocí klubového e-mailu (najdeš v Hydře, je ve tvaru j.prijmeni[cislo]@pod.cvut.cz, např. j.novak1@pod.cvut.cz) a síťového hesla. Síťové heslo je nezávislé (tj. není totožné) na heslu pro přihlášení do Hydry a je možné ho nastavit na https://hydra.pod.cvut.cz/services/network (viz obrázek níže).

{{<figure src="hydra_wifi_password.png" alt="WiFi password setup Hydra">}}

#### Problém s připojením - Randomizovaná MAC adresa

Tuto funkci si každý výrobce pojmenovává jinak, proto hledejte něco podobného. Pokud je tato funkce zapnutá, nepovede se vám toto zařízení připojit k naší síti, jelikož ověřujeme MAC adresu co máte v Hydře proti té, co má vaše zařízení. Pokud tedy vaše zařízení MAC adresu mění, nepůjde se vám připojit.

Pokud to nepomohlo, kontaktuj televizora na svém prípadně na vedlejším bloku: https://pod.cvut.cz/kontakty/.

#### Zabezpečení

Používáme WPA2 Enterprise/802.1x EAP. Ověření certifikátu našeho RADIUS serveru a shody doménového jména (radius-a.pod.cvut.cz) je zcela nutné, pokud chcete mít jistotu, že jste opravdu připojeni do naší sítě a nikdo vaši komunikaci nezneužívá (např. vytvořením stejného SSID/jména Wifi, vlastního „fake“ RADIUS serveru → ale už jiného certifikátu). 

Využíváme certifikáty od Let's Encrypt, které jsou mimo jiné podepsány společností IdenTrust (DST Root CA X3) a tedy obecně přijímány jako bezpečné (jsou součástí většiny systémových repositářů). Z toho plyne, že není nutné certifikát dodatečně stahovat, aby mohlo ověření proběhnout. Televizor vám zařízení k WiFi připojí, takže se nemusíte bát, že věcem v tomto odstavci nerozumíte :).

### Připojení přes kabel (Ethernet)

Není potřeba dělat další kroky, stačí jen zapojit kabel do registrovaného zařízení.
Každý člen může mít připojen pouze jeden počítač na kabelu, případné další musí povolit představenstvo klubu.

## Přihlášení odběru emailů

Každému nově registrovanému členovi se automaticky přihlásí konference kolej-info@pod.cvut.cz. Je to konference, kam vedoucí kolejí (p. Makulová) posílá důležité informace (revize, odstávky, kontroly, …) nebo zástupci kolejního klubu oznamují akce, volby, atd.

Dále se hodí být členem tvé blokové konference, info-x@pod.cvut.cz, kde x je písmenko tvého bloku. Sem se například ohlašují volby na správce bloku, blokové poznávačky, atd.

Tyto konference jsou moderované, pokud bys chtěl poslat nějakou důležitou informaci ty, dej nám vědět na admins@pod.cvut.cz. Zároveň to zaručuje, že do konferencí nechodí spam.

Tyto konference je možné přihlásit i odhlásit v Hydře: https://hydra.pod.cvut.cz/mailing.

{{<figure src="hydra_mailing.png" alt="Email conferences in Hydra">}}

## Sledování televize na počítači

Projekt má za cíl zpřístupnit televizní vysílání uživatelům sítě Pod-O-Lee, nie je pevnou součastí služby. Jako zdroj používáme terestriální digitální televizní vysílání (DVB-T).

Digitální televizní signál přijímáme pomocí DVB-T karty umístěné do streamovacího serveru u jiných součástí SÚ. Jednotlivé programy jsou pak vysílány každý zvlášt jako multicastové streamy.

### Instalace

K sledování streamu je potřeba stáhnout a nainstalovat VLC player a nastavit jej tak, jak ukazuje následující:

{{<figure src="vlc_nastaveni-sap.jpg" alt="Nastaveni TV ve VLC">}}

### Sledování

Pokud je vše nastaveno správně není nic jednodušího než přes pár kliků začít sledovat TV.

{{<figure src="vlc_prohledavani-sap.jpg" alt="TV kanály ve VLC">}}

Načtení seznamu může trvat až 5 minut. Pokud máš firewall, musíš povolit nejen porty, na kterých běží streamy (UDP 1234), ale i IGMP (UDP 9875). Pokud se ti seznam stanic ani poté nezobrazí kontaktuj svého televizora.
