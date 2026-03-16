🏗️ Architecture & Design
NetAuto-Pilot is an enterprise-grade automation framework designed to synchronize security posture across multi-vendor network environments. The system focuses on the critical integration between Fortinet Edge Firewalls and Aruba Access Switching, ensuring that security policies are consistent from the perimeter to the access layer.

This project utilizes a Modular Abstraction Layer to decouple vendor-specific logic from the core orchestration engine, following industry best practices for scalable infrastructure code.

📁 Project Structure
The repository is organized into specialized directories to maintain a clean separation of concerns:

Core/: Contains the main orchestrator (PulseCheck.ps1) which manages the execution flow.

Modules/: Stores vendor-specific toolkits (FortiDrive.psm1 and ArubaDrive.psm1) for specialized device interaction.

Inventory/: Houses the hosts.csv file, serving as the "Source of Truth" for network assets.

Policies/: Contains configuration baselines and logic definitions.

Logs/: Automatically stores time-stamped audit trails for compliance and troubleshooting.

🛠️ Technical Implementation
Language: PowerShell

Design Pattern: Modular Function Abstraction

Automation Strategy: Multi-vendor conditional branching and state verification.

Data Handling: CSV-to-Object transformation using PSCustomObjects.

Audit Logging: Persistent filesystem stream auditing with unique timestamps.

🚀 Execution Instructions
To execute the security sync engine, follow these sequential landmarks:

Open your terminal and navigate to the project root.

Move into the core directory:
cd Core

Execute the orchestrator:
.\PulseCheck.ps1

Verify the results in the terminal and check the Logs/ directory for the generated audit report.