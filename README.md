# Dnsmasq to Unbound

[![CI](https://github.com/chall37/dnsmasq-to-unbound/actions/workflows/ci.yml/badge.svg)](https://github.com/chall37/dnsmasq-to-unbound/actions/workflows/ci.yml)
[![CodeQL](https://github.com/chall37/dnsmasq-to-unbound/actions/workflows/codeql.yml/badge.svg)](https://github.com/chall37/dnsmasq-to-unbound/actions/workflows/codeql.yml)
[![License](https://img.shields.io/badge/License-BSD_2--Clause-blue.svg)](https://opensource.org/licenses/BSD-2-Clause)

OPNsense plugin that registers dnsmasq DHCP leases and static hosts in Unbound DNS.

## Features

- Watches dnsmasq lease file and static hosts for changes
- Registers A and PTR records in Unbound via `unbound-control`
- Supports multiple domains via dnsmasq's IP-range-to-domain mapping
- Deduplicates records (static entries take precedence over leases)
- Automatic cleanup of stale records
- Periodic reconciliation to handle Unbound restarts

## Requirements

- OPNsense with Unbound DNS resolver enabled
- dnsmasq plugin installed and configured with DHCP

## Installation

```
pkg install os-dnsmasq-to-unbound
```

## Configuration

Navigate to **Services > Dnsmasq to Unbound** in the OPNsense web UI.

| Option | Description |
|--------|-------------|
| Enable | Enable/disable the DNS registration service |
| Watch Leases | Register DNS entries for DHCP leases |
| Watch Static | Register DNS entries for static host mappings |
| Domain Filter | Limit registration to specific domains (comma-separated) |

The plugin reads domain configuration from dnsmasq:
- Global domain: `domain=lan` in dnsmasq.conf
- Range-specific: `domain=guest,192.168.20.1,192.168.20.254`

## Troubleshooting

Check service status:
```
configctl dnsmasqtounbound status
configctl dnsmasqtounbound listrecords
```

Check logs:
```
grep dnsmasq_watcher /var/log/system/latest.log
```

## License

BSD 2-Clause
