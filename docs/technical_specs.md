Security Logic Specification
This document outlines the operational logic of the NetAuto-Pilot framework and how it enforces security across the Fortinet and Aruba ecosystems.

Logic Flow & Orchestration
The engine follows a "Linear Verification" model. It identifies the device role from the inventory and applies the corresponding security audit module.

Identity Verification: The Core Engine reads the hosts.csv to map IP addresses to specific Vendors (Fortinet/Aruba).

Contextual Handshake:

FortiOS Logic: Focuses on Northbound Traffic. It verifies that the firewall policy count matches the expected baseline.

ArubaOS-CX Logic: Focuses on Southbound Traffic. It audits physical port states to ensure no unauthorized "Shadow Ports" are active.

Synchronization: The engine ensures that the Access Layer (Aruba) is behaving according to the rules set by the Perimeter (Fortinet).

Module Deep-Dive
FortiDrive Module
Purpose: Perimeter Security Audit.

Key Function: Get-FortiSecurityStatus.

Logic: Scans policy tables to return ThreatLevel and PolicyCount objects.

ArubaDrive Module
Purpose: Layer 2 Port Hardening.

Key Function: Get-ArubaPortAudit.

Logic: Performs a state-check on the 24-port/48-port switch fabric to detect SecurityRisk anomalies.

Compliance & Auditability
Every execution is recorded with a Millisecond-Precise Timestamp.

Log Integrity: Logs are written in an "Append-Only" format to prevent historical data from being overwritten.

Standardization: Audit entries use a standardized [HH:mm:ss] RESULT format, making them compatible with modern SIEM (Security Information and Event Management) tools.