# OpenBSDFirewall

## Files
| FILE | PURPOSE |
| --- | --- |
|`/etc/dhcpd.conf`                    | DHCP SERVER CONFIG                                                       |
|`/etc/hostname.vr0`                  | WAN VIA DHCP ON vr0                                                      |
|`/etc/hostname.vr1`                  | LAN W/STATIC IP ON vr1                                                   |
|`/etc/motd`                          | DEFAULT IS PROBABLY NOT GOOD                                             |
|`/etc/pf.conf`                       | THE FIREWALL                                                             |
|`/etc/pf_tables/ASSHOLES.txt`        | TABLE FOR ASSHOLE EXCLUSION                                              |
|`/etc/pf_tables/fullbogons-ipv4.txt` | TABLE FOR BOGON EXCLUSION                                                |
|`/etc/pf_tables/refreshBogons.sh`    | SET UP A CRON JOB TO RUN THIS SCRIPT FOR BOGON UPDATES                   |
|`/etc/resolv.conf`                   | DNS RESOLUTION: AUTO-UPDATED ON DHCP LEASE                               |
|`/etc/sysctl.conf`                   | ENABLE ROUTING                                                           |
|`/etc/mygate`                        | STATIC GATEWAY IP IN THIS FILE; CAN OMIT IF USING DHCP FOR WAN INTERFACE |


## pf Commands
| COMMAND | ACTION |
| --- | --- |
| `pfctl -e`                                    | ENABLE FIREWALL |
| `pfctl -d`                                    | DISABLE FIREWALL |
| `pfctl -f  /etc/pf.conf`                      | Load the pf.conf file |
| `pfctl -nf /etc/pf.conf`                      | Parse the file, but don't load it |
| `pfctl -sr`                                   | Show the current ruleset |
| `pfctl -ss`                                   | Show the current state table |
| `pfctl -si`                                   | Show filter stats and counters |
| `pfctl -sa`                                   | Show EVERYTHING it can show |
| `pfctl -sT`                                   | Shows a list of loaded tables |
| `pfctl -t <table> -T show`                    | SHOW TABLE CONTENTS |
| `pfctl -t <table> -T replace -f /table.txt`   | REPLACE TABLE CONTENTS WITH FILE |

## General Commands
| COMMAND | ACTION |
| --- | --- |
| `sh /etc/netstart` | RESTART/RELOAD NET INTERFACES |
| `route show` | SHOW ROUTES |
| `rcctl [stop/start] dhcpd` | START/STOP DHCP SERVER |

## Questions?
[Pf firewalling questions, contact us at https://eggplant.pro/contact.php.](https://eggplant.pro/contact.php)

## Biblio
"The Book of Pf", Peter N.M. Hansteen
ISBN: 978-1-59327-589-1
No Starch Press

"Absolute OpenBSD", Michael W. Lucas
ISBN: 978-1-59327-476-4
No Starch Press

OpenBSD Online Docs
* https://www.openbsd.org/faq/
* http://man.openbsd.org/cgi-bin/man.cgi
