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

Návod na připojení naleznete: [https://wiki.pod.cvut.cz/sluzby/sit/wifi](https://wiki.pod.cvut.cz/sluzby/sit/wifi).

### Připojení přes kabel (Ethernet)

Není potřeba dělat další kroky, stačí jen zapojit kabel do registrovaného zařízení.
Každý člen může mít připojen pouze jeden počítač na kabelu, případné další musí povolit představenstvo klubu.

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
