# 🤖 NetAuto-Pilot: Multi-Vendor Security Sync Engine

## Project Specifications

| Attribute | Value |
|---|---|
| **System Language** | PowerShell 7.x |
| **Core Engine** | Modular Abstraction Layer (MAL) |
| **Primary Focus** | Multi-Vendor Security Orchestration |
| **Operational Status** | Active / Enterprise Framework |
| **Network Layer** | Layer 2 (Access) & Layer 4 (Perimeter) |

---

## Overview

**NetAuto-Pilot** is an enterprise-grade automation framework designed for **Network Engineers and Security Administrators**.

It bridges the configuration gap between **Fortinet Edge Firewalls** and **Aruba Access Switches**.

By automating the **Security Handshake** between these two vendors, the system ensures that **perimeter security policies are consistently enforced all the way down to the physical switch port**.

---

## Technical Methodology (The Theory)

The engine operates using a **Modular Abstraction strategy**.

Rather than relying on a single rigid script, **NetAuto-Pilot separates vendor-specific commands into modular drivers**, enabling a scalable and vendor-agnostic orchestration flow.

### Logic Flow

#### 1. Inventory Ingestion
The engine parses a central `hosts.csv` file to identify:
- Device role
- Vendor
- Target nodes

#### 2. Contextual Logic

**Fortinet Module**
- Interrogates the firewall policy table  
- Verifies security posture and threat levels

**Aruba Module**
- Performs a switch port state check  
- Identifies **Shadow Ports** (active unauthorized ports)

#### 3. Audit Persistence
Every action is piped through a **custom logging subsystem**, generating a **timestamped append-only audit trail** for compliance and SOC review.

---

## Features

- **Multi-Vendor Drivers**  
  Specialized `.psm1` modules for **FortiOS** and **ArubaOS-CX**

- **Inventory Orchestration**  
  CSV-driven management capable of auditing **100+ nodes in a single execution**

- **Automated Audit Trails**  
  Generates **millisecond-precise logs** for compliance and forensic review

- **Object-Oriented Design**  
  Uses `PSCustomObject` structures to maintain **data integrity during vendor transitions**

---

## Demonstration

> NetAuto-Pilot performing a synchronized audit across Fortinet and Aruba nodes while generating a localized compliance report.

---

## Installation & Usage

> **Note:** PowerShell execution policy must allow script execution.

```powershell
# Set execution policy if required
Set-ExecutionPolicy RemoteSigned

# Clone the repository
git clone https://github.com/IsiphileM/NetAuto-Pilot.git
cd NetAuto-Pilot

# Navigate to the Core Engine
cd Core

# Execute the Orchestrator
.\PulseCheck.ps1
