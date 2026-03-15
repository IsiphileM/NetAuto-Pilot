# NetAuto-Pilot 🚀
A Multi-Vendor Network Automation Tool for Fortinet & Aruba.

## 📋 Specifications
- **Language:** PowerShell 7+
- **Modules:** PowerFGT, PowerArubaCX
- **Targets:** FortiOS (Firewall), ArubaOS-CX (Switching)

## 🧠 Logic Flow
The script uses a centralized `config.json` to authenticate across different hardware vendors, pulling real-time telemetry data into a single management view.

## 🛠️ Installation
1. Install the modules: `Install-Module PowerFGT, PowerArubaCX`
2. Update `config.json` with your device IPs and API keys.
3. Run `.\scripts\PulseCheck.ps1`.