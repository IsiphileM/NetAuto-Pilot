# NetAuto-Pilot: Script Logic

The `PulseCheck.ps1` script follows a "Linear Automation" path:

1. **Initialization:** Loads the `config.json` file into a PowerShell Object.
2. **Connectivity:** Tests the path to the FortiGate and Aruba management IPs.
3. **Extraction:** Uses API commands to pull CPU, Firmware, and Model data.
4. **Presentation:** Cleans the data and displays it in a color-coded CLI report.