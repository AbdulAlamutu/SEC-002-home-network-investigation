# SEC-002 — Sanitized Evidence Record

This is a written summary of observations. It is not a reproduction of command output. Device A and Device B are report aliases, not original device identifiers.

| ID | Source | Observation | Evidence availability |
|---|---|---|---|
| E01 | Windows ping, Device A | ICMP response reported | Investigator's handoff notes; original output unavailable |
| E02 | MAC manufacturer lookup, Device A | Chamberlain vendor reported | Investigator's handoff notes; original lookup unavailable |
| E03 | Windows ping, Device B | No ICMP response reported | Investigator's handoff notes; original output unavailable |
| E04 | Windows ARP, Device B | Address mapping reported | Investigator's handoff notes; original output unavailable |
| E05 | EXOS router inventory, Device B | Active status and TV icon | Recovered screenshot reviewed; private fields omitted here |
| E06 | MAC manufacturer lookup, Device B | Samsung Electronics vendor | Recovered screenshot reviewed; address prefix omitted here |
| E07 | Household context, Device B | Confirmation consistent with a Samsung TV | Investigator's handoff notes; personal details omitted |

## Evidence handling

- No exact local or public IP addresses are included.
- No full MAC addresses or manufacturer prefixes are included.
- No passwords, usernames, household names, Wi-Fi names, serial numbers, or original device identifiers are included.
- Raw screenshots are excluded because they contain private network information.
- Capture dates, packet counts, latency, TTL values, and exact device models are not invented.

## Conclusions supported

- Device A is likely associated with Chamberlain/myQ garage equipment based on reported vendor and investigation context.
- Device B is likely a Samsung Smart TV based on the vendor result, router context, and reported household confirmation.
- These observations do not establish compromise, malicious activity, or the security posture of either device.
