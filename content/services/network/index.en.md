---
# Will be displayed at top of the page as main heading
title: Network
# Has to be in format <parent-site/current-site>, e.g. services/network (notice missing slash at the beginning)
url: services/network
slug: network
weight: 2
---

## How to connect to the Internet

#### You will need:

- citizen ID or ISIC
- valid accommodation agreement or accommodation card
- room number
- all devices you want to connect to our network

#### Next steps

1. Now you need to go to the televizor (a person handling registrations and problems dealing with internet connection). List of the televizors is available here: [List of televizors in contacts]({{< ref "/contacts/index.en.md" >}}).
2. Televizor will register and create account on our system Hydra. You will then receive an email with password which you can change. The ID from this account will serve as the variable symbol (VS) for payment. He will give you short explanation about the rules of the academical net. You will receive free internet for 10 days. In a span of these 10 days you should pay for it, otherwise it will stop working until you pay. You also have to present valid accommodation agreement or accommodation card for valid membership.

#### Device settings

##### Windows

Randomized mac address should already be disabled. So just select the network and connect using the club email and network password set in [Hydra](https://hydra.pod.cvut.cz/).

##### Android

The first time you try to connect to the Pod-O-Lee network you will be prompted to log in. Along with your network login and password, set the following information:

- EAP method: PEAP (if you don't see this option, click Advanced options)
- Phase-2 authentication: MSCHAPV2 (for older Androids, you can select None)
- CA certificate: Use system certificates, you must select certificate authentication if you want your connection to be secure
- Domain: radius.pod.cvut.cz
- Identity: your club email, e.g. p.novak@pod.cvut.cz
- Password: network password set in [Hydra](https://hydra.pod.cvut.cz/)

{{<figure src="images/services/network/android_tutorial.jpg" alt="Android tutorial" imgop="rt_fit">}}

##### iOS

Before you try to log in, click on the wifi network information called "Pod-O-Lee" to see the mac address/phone address settings. There you will have a choice where you have to select "Use phone address".

You can then log in using your club email and the network password set in [Hydra](https://hydra.pod.cvut.cz/). You will then be asked if you trust the radius certificate, click trust there. After that there should be no problem with connecting to the network.

##### Linux

In linux it depends on the distribution, but the settings are the same as android. Certificates are usually stored in this location: '/etc/ca-certificates/extracted/', you will usually find the file '/etc/ca-certificates/extracted/ca-bundle.trust.crt' there.


### Connection to the net via cable (Ethernet)

No other steps are needed. Just put the cable in already registered device. You can only connect one device on cable. If you want more than one device, you need to write email to televizor.

### WiFi

Currently working on all blocks, in Pod-O-Gym and around our Menza (canteen)

It is possible to register up to three devices one for every category. Categories are PC, smartphone, tablet etc. It is possible to ask Network Administrator for an exception if you have good reason.

Registration process is same as the registration for a cable.

#### Password for WiFi

To set password used for WiFi connection, follow these steps:

1. Open [https://hydra.pod.cvut.cz/services/network](https://hydra.pod.cvut.cz/services/network). Use your username and generated password to log in (you can find it in the email you received after registration with televizor).
2. Find red button with “Set new password” label and username above (This is your WiFi password, different from the one from email)

{{<figure src="images/services/network/hydra_wifi_password.png" alt="WiFi password setup Hydra" imgop="rt_fit">}}

Try to log in with the username (case-sensitive!) and the newly set password. If it doesn’t work, wait for cca 10 minutes and try again.

#### Connection troubleshooting - Randomized MAC address

Every manufacturer names this function differently, try to search for something similar. If enabled, device cannot be connected to our network, because we are verifying known devices based on MAC addresses. So disable this function if you want to connect to our network.

If you don't know how, contact admin of your or any other block: [{{< ref "/contacts/index.md" >}}]({{< ref "/contacts/index.md" >}}).

## Email conferences

Every newly registered member is automatically registered to recieve emails from kolej-info@pod.cvut.cz. It is email conference, where campus manager notifies about important information (like revisions of appliances, outages, etc.) or active members of Pod-O-Lee (admins) notify about other important activities, network outages, elections, etc.

You also should subscribe to your block email conference, info-x@pod.cvut.cz, where x is letter of your block. Block admins notify here about block oriented stuff, like meetings, block outages, etc.

These conferences are moderated, if you want to send some important information, let us now at admins@pod.cvut.cz. This also blocks any unwanted mail.

You can subscribe and unsubscribe these conferences in your Hydra account: https://hydra.pod.cvut.cz/mailing.

{{<figure src="images/services/network/hydra_mailing.png" alt="Email conferences in Hydra" imgop="rt_fit">}}

## Computer network rules

Each user of a computer network has rights and obligations. Everything is defined in the internal rules on the rules of the computer network usage rules. 
By using the academic network you agree to follow the rules defined not only in our statutes, but also the rules of the SU, CTU and CESNET.

### How it is in practice

This section is only intended to give an overview of the rules of computer networking, it is not complete and may not be up to date!
For the exact wording of the rules, please read the internal regulation related to this topic in [Documents]({{< ref "/documents#interní-předpisy" >}}).

- You must not use the network for commercial purposes.
- You must not use the network for illegal purposes.
  - For example: hacking networks and servers, downloading and distributing illegal stuff (torrents are the most common analogy).
- If we receive a report that your device is infected with a virus, we will disconnect your device from the network until you prove to us that the device is virus-free.
- You can only use a device on the network that is registered in our system.
  - Related to this is that you must not give access to the network to others.
  - For this reason, you must not extend the network (for example, by using your own router).

The network is monitored and therefore violations of these rules can be detected. Violations are then dealt with and punished not only on the basis of severity. These penalties may, for example, be a ban. 

If you have a specific request, contact the TV on your case on the next block or one of the networkers: [{{< ref "/contacts/index.md" >}}]({{< ref "/contacts/index.md" >}}).