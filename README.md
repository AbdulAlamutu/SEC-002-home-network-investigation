# SEC-002 — Home Network Asset Investigation

## Overview

Investigated two unfamiliar entries in a home network inventory using Windows connectivity checks, ARP information, an EXOS router device inventory, MAC manufacturer lookups, and household confirmation. Correlating these sources supported two likely identifications: Chamberlain/myQ garage equipment and a Samsung Smart TV.

This case study demonstrates basic asset identification, evidence correlation, and cautious interpretation of network observations. It does not establish an exact device model or assess whether either device is secure.

## Scope and tools

- Environment: home network under the investigator's control.
- Scope: two devices, labeled **Device A** and **Device B** for this public report.
- Tools: Windows `ping`, Windows `arp`, EXOS router inventory, and MAC manufacturer lookup.
- Additional context: household confirmation for Device B.

## Investigation process

1. Reviewed two unfamiliar entries in the router inventory.
2. Used Windows ping to check whether each address responded to ICMP echo requests.
3. Reviewed ARP information for local address-to-MAC context.
4. Compared MAC manufacturer results with router labels, status, and icons.
5. Used household context to assess the likely identity of Device B.
6. Documented the observations separately from the interpretation and removed private network details from this public report.

Command patterns used in the investigation:

```text
ping <device-local-IP>
arp -a
```

The angle-bracket value is a placeholder; no original address is included.

## Findings

| Evidence | Device A | Device B |
|---|---|---|
| Windows ping | Responded, according to investigation notes | Did not respond, according to investigation notes |
| Windows ARP | No specific result retained in this report | Entry observed, according to investigation notes |
| MAC manufacturer lookup | Chamberlain, according to investigation notes | Samsung Electronics, supported by recovered screenshot |
| Router context | Initially unfamiliar entry | Active status and TV icon, supported by recovered screenshot |
| Household context | Garage-equipment interpretation recorded in investigation notes | Household confirmation consistent with a Samsung TV |
| Likely identity | Chamberlain/myQ garage equipment | Samsung Smart TV |

**Device A:** The reported Chamberlain manufacturer result and investigation context support a likely association with Chamberlain/myQ garage equipment. A ping reply supports ICMP responsiveness at the time of testing; it does not prove the device's product type or exact model. This identification remains provisional.

**Device B:** The Samsung manufacturer result, router TV icon and active status, and reported household confirmation collectively support identification as a likely Samsung Smart TV. The lack of a ping response does not by itself establish that the device was offline or suspicious.

## Interpretation and limitations

- A MAC manufacturer result is a vendor clue, not proof of a product type, model, or owner.
- Router names and icons provide context but are not definitive identification evidence.
- An ARP entry records an address mapping; it is not independent proof of current reachability and may persist after activity.
- Ping tests ICMP responsiveness. Nonresponse can have several explanations, including filtering, power state, or connectivity changes; the cause was not established here.
- Router status and connectivity checks may reflect different moments. Precise capture times were not available for this report.
- Only the Samsung router row and vendor lookup screenshots were recovered for direct review. Other findings are attributed to the investigator's notes supplied during the project handoff.
- No vulnerability scan, compromise assessment, or threat-detection conclusion is documented in this case study.

## Outcome

The investigation reduced uncertainty around two unfamiliar inventory entries by combining several sources of context. Both entries were assigned likely device identities, with the limits of those conclusions documented. Exact-model verification remains outside the completed scope.

## Skills demonstrated

Basic network troubleshooting, asset inventory review, MAC vendor interpretation, evidence correlation, uncertainty documentation, and privacy-conscious reporting.

## Public evidence

See [the sanitized evidence record](evidence/observations.md). This record is a written summary, not raw command output or an original screenshot. Private addresses, full MAC addresses, credentials, account and household names, and unique device identifiers are omitted. Original screenshots are not included in this publication package.
