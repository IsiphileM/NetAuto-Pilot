## 🛰 Network Topology

```mermaid
flowchart TB

%% Nodes
MGMT["🖥 Management PC<br/>PowerShell Automation Engine"]
FW["🔥 FortiGate 60F<br/>Security Gateway"]
SW["🔀 Aruba 2930F<br/>Access Switch"]

%% Primary Control Path
MGMT -- "REST API / HTTPS" --> FW
FW -- "Trunk / VLAN Trust" --> SW

%% Audit / Telemetry Path
MGMT -. "SSH / Telemetry" .-> SW
```

## Logic Flow
1. Script loads credentials from config.json.
2. Script sends a "Request" to Fortinet for CPU/RAM status.
3. Script sends a "Request" to Aruba for Port status.
4. Script displays a unified health report in the console.
