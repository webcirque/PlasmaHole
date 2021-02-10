# PlasmaHole
## Description
Scheduled request sending tool. Can be used to replay requests, or to test out self-maintained firewalls.

## Licensing
PlasmaHole is licensed under WTFPL.

## Current Usage
PlasmaHole is used by us to mimic probing requests sent from active probing devices. We use it to test out our own Cloudflare firewall and our server-side firewalls.

## Versions
### Bash version
This version is targeted to POSIX systems which have Bash and cURL installed. Supports Mac OS, Linux, BSD and Android via Termux.

By ultilizing both Bash and cURL, this version is drastically simpler and easier to control on a lower level. However, it is too simple that it cannot be adaptive and more convincing to the server.

### WebExtensions version
This version is targeted to both Chromium and Firefox based browsers which allows to install extensions. Supports Windows, Mac OS, Linux and BSD.

By using JavaScript and ultilizing WebExtensions and Chrome Extensions standards, this version can be more flexible. However, it seems not to have a lower level control.

## Configurations
