# OpenBSDFirewall

## Unbound

**!NOTE** To enable unbound (caching DNS resolver), you will first have to create a root key:

```sh
# change to root key directory
cd /var/unbound/db

# update root key
unbound-anchor -a ./root.key

# correct filesystem perms/owner for the root key
chown _unbound:_unbound ./root.key
chmod 644 ./root.key

# restart unbound
rcctl restart unbound
```

## Files

| FILE                            | PURPOSE                                                                  |
| ----                            | -------                                                                  |
| `/etc/pf_tables/ASSHOLES.txt`   | table for internet asshole exclusion                                     |
| `/etc/dhcp6leased.conf`         | DHCPv6 client config                                                     |
| `/etc/dhcpd.conf`               | DHCP server config                                                       |
| `/etc/hostname.vr0`             | WAN (to internet modem) via DHCP on vr0                                  |
| `/etc/hostname.vr1`             | LAN (to local network) w/static IP on vr1                                |
| `/etc/motd`                     | default is probably not good                                             |
| `/etc/mygate`                   | static gateway IP in this file; can omit if using DHCP for WAN interface |
| `/etc/pf.conf`                  | the firewall                                                             |
| `/etc/rad.conf`                 | configures IPv6 route advertisement service to LAN                       |
| `/etc/rc.conf.local`            | enables/configures system start-up services                              |
| `/etc/resolv.conf`              | DNS resolution: auto-updated on DHCP lease                               |
| `/etc/sysctl.conf`              | system runtime parameters to enable routing                              |
| `/var/unbound/etc/unbound.conf` | configuration for the `unbound` caching DNS resolver                     |
| `/var/unbound/db/root.hints`    | root name server information used to initialize DNS resolver             |

## pf Commands

| COMMAND                                     | ACTION                               |
| -------                                     | ------                               |
| `pfctl -e`                                  | enable firewall                      |
| `pfctl -d`                                  | disable firewall                     |
| `pfctl -f  /etc/pf.conf`                    | Load the pf.conf file                |
| `pfctl -nf /etc/pf.conf`                    | parse the file, but don't load it    |
| `pfctl -sr`                                 | show the current ruleset             |
| `pfctl -ss`                                 | show the current state table         |
| `pfctl -si`                                 | show filter stats and counters       |
| `pfctl -sa`                                 | show EVERYTHING it can show          |
| `pfctl -sT`                                 | shows a list of loaded tables        |
| `pfctl -t <table> -T show`                  | show table contents                  |
| `pfctl -t <table> -T replace -f /table.txt` | replace table contents with file     |
| `systat`                                    | system stats (including net)         |
| `pftop`                                     | `top` for network (external package) |

## General Commands

| COMMAND                      | ACTION                          |
| -------                      | ------                          |
| `sh /etc/netstart`           | restart/reload net interfaces   |
| `route show`                 | show routes                     |
| `rcctl [stop/start] dhcpd`   | start/stop DHCP server          |
| `rcctl [stop/start] unbound` | start/stop caching DNS resolver |

## Biblio

> "The Book of Pf", Peter N.M. Hansteen
> ISBN: 978-1-59327-589-1
> No Starch Press

> "Absolute OpenBSD", Michael W. Lucas
> ISBN: 978-1-59327-476-4
> No Starch Press

## OpenBSD Online Docs

- https://www.openbsd.org/faq/
- http://man.openbsd.org/cgi-bin/man.cgi

## Miscellaneous Links

### IPv6 PREFIX DELEGATION

- https://sha256.net/dhcpv6-pd-first-steps.html
- https://eradman.com/posts/ipv6-strategy.html
- https://mpolden.no/blog/posts/2024-10-11-openbsd-dhcp6leased-and-altibox.html

### TOTAL FIREWALL CONFIG

- https://code.jeremyevans.net/2024-11-03-adding-ipv6-to-my-home-network.html
- https://lipidity.com/openbsd/router/
