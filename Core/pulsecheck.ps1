<#
.SYNOPSIS
    NetAuto-Pilot: Multi-Vendor Security Orchestration Engine.
.DESCRIPTION
    This is the main orchestrator that synchronizes security posture between 
    Fortinet Edge Firewalls and Aruba Access Switches.
#>

# --- 1. IMPORT VENDOR MODULES ---
# This pulls in the specialized toolsets from your Modules folder
Import-Module "..\Modules\FortiDrive.psm1"
Import-Module "..\Modules\ArubaDrive.psm1"

# --- 2. LOGGING ENGINE ---
# This function creates a professional audit trail in the Logs folder
function Write-AegisLog {
    param([string]$Message)
    
    # Ensures the Logs folder exists before trying to write to it
    $LogDir = "..\Logs"
    if (!(Test-Path $LogDir)) { New-Item -ItemType Directory -Path $LogDir | Out-Null }

    $LogPath = "$LogDir\Audit_$(Get-Date -Format 'yyyyMMdd').log"
    $TimeStamp = Get-Date -Format "HH:mm:ss"
    "[$TimeStamp] $Message" | Out-File -FilePath $LogPath -Append
}

# --- 3. INITIALIZATION ---
# Load the network inventory (the list of devices to check)
try {
    $Inventory = Import-Csv "..\Inventory\hosts.csv" -ErrorAction Stop
}
catch {
    Write-Host "[!] ERROR: Could not find Inventory/hosts.csv" -ForegroundColor Red
    return
}

Write-Host "`n>>> [ AEGIS-AUTO: MULTI-VENDOR SYNC INITIALIZED ] <<<" -ForegroundColor Cyan -BackgroundColor Black
Write-AegisLog -Message "--- Engine Started: Multi-Vendor Audit Initialized ---"

# --- 4. THE EXECUTION ENGINE ---
# Loop through every device found in the CSV file
foreach ($Device in $Inventory) {
    
    $StatusMsg = "Auditing $($Device.Vendor) Node at $($Device.IP) [Role: $($Device.Role)]"
    Write-Host "`n[*] $StatusMsg" -ForegroundColor Yellow
    Write-AegisLog -Message $StatusMsg

    # Check the vendor and call the correct module function
    if ($Device.Vendor -eq "Fortinet") {
        # Calls the function inside FortiDrive.psm1
        $Report = Get-FortiSecurityStatus -IP $Device.IP
        Write-Host " >> Security Posture: $($Report.ThreatLevel)" -ForegroundColor Green
        Write-Host " >> Policy Count: $($Report.PolicyCount)"
        Write-AegisLog -Message "RESULT: Policy Count $($Report.PolicyCount) verified. Threat Level: $($Report.ThreatLevel)"
    } 
    elseif ($Device.Vendor -eq "Aruba") {
        # Calls the function inside ArubaDrive.psm1
        $Report = Get-ArubaPortAudit -IP $Device.IP
        Write-Host " >> Hardware ID: $($Report.SwitchID)"
        Write-Host " >> Security Risk: $($Report.SecurityRisk)" -ForegroundColor Green
        Write-AegisLog -Message "RESULT: Switch ID $($Report.SwitchID) audited. Risk: $($Report.SecurityRisk)"
    }
    else {
        Write-Host " [!] Warning: Unknown Vendor '$($Device.Vendor)' for IP $($Device.IP)" -ForegroundColor DarkYellow
    }
}

# --- 5. FINISH ---
Write-Host "`n>>> [ SYNC COMPLETE: REPORT GENERATED IN LOGS FOLDER ] <<<`n" -ForegroundColor Cyan
Write-AegisLog -Message "--- Engine Finished: Audit Successfully Logged ---"