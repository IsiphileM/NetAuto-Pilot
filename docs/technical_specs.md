# NetAuto-Pilot Technical Specifications

## Security Logic Specification

This document defines the internal operational logic of the **NetAuto-Pilot** framework and the mechanisms used to enforce security consistency across **Fortinet perimeter devices** and **Aruba access-layer switches**.

The framework is designed to provide **deterministic verification of network security posture** by correlating firewall policy enforcement with switch port state validation.

---

# 1. Architectural Overview

NetAuto-Pilot operates as a **centralized automation engine** executed from a management workstation running **PowerShell 7.x**.

The system is structured around a **Modular Abstraction Layer (MAL)** that separates orchestration logic from vendor-specific command implementations.

This architecture allows the framework to:

- Maintain vendor independence
- Support modular expansion to additional network platforms
- Preserve data integrity between modules
- Enable deterministic audit outputs

### Architectural Layers

| Layer | Responsibility |
|------|----------------|
| **Core Engine** | Device discovery, orchestration, execution flow |
| **Vendor Drivers** | Platform-specific interrogation logic |
| **Inventory Layer** | Centralized device registry |
| **Audit Layer** | Compliance logging and forensic traceability |

---

# 2. Security Enforcement Model

NetAuto-Pilot follows a **Linear Verification Model**.

Rather than executing simultaneous checks across the network, the engine processes devices sequentially according to their **network role**.

This provides deterministic verification and simplifies audit traceability.

### Enforcement Philosophy

1. **Perimeter Security Defines Policy**
2. **Access Layer Enforces Physical Compliance**
3. **Automation Confirms Alignment Between Both Layers**

This ensures that **policy defined at the firewall level propagates down to the physical network edge.**

---

# 3. Execution Workflow

The automation engine executes the following operational stages.

## Stage 1 - Inventory Ingestion

The engine reads the `hosts.csv` inventory file.

Each record defines:

- Device hostname
- Management IP address
- Vendor
- Device role

Example inventory structure:
