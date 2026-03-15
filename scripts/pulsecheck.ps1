# 1. Load the settings
$Config = Get-Content -Raw -Path "..\config.json" | ConvertFrom-Json

Write-Host "`n--- [ NetAuto-Pilot: Starting Health Check ] ---" -ForegroundColor Yellow -BackgroundColor Black

# --- SECTION: FORTINET ---
Write-Host "[*] Accessing FortiGate at $($Config.FortiGate.IP)..." -ForegroundColor Cyan

try {
    # This is the real command (it will fail if no firewall is connected)
    # $FGT_Status = Get-FGTSystemStatus -Address $Config.FortiGate.IP -APIKey $Config.FortiGate.APIKey -ErrorAction Stop
    
    # FOR DEMO: We "Mock" the data so the script works for your portfolio
    $FGT_Version = "v7.4.2,build2571"
    $FGT_CPU = Get-Random -Minimum 5 -Maximum 15
    
    Write-Host " >> Status: CONNECTED" -ForegroundColor Green
    Write-Host " >> Firmware: $FGT_Version"
    Write-Host " >> CPU Load: $FGT_CPU%"
}
catch {
    Write-Host " [!] Error: Could not reach FortiGate. Check API Key." -ForegroundColor Red
}

# --- SECTION: ARUBA ---
Write-Host "`n[*] Accessing Aruba Switch at $($Config.Aruba.IP)..." -ForegroundColor Green

try {
    # FOR DEMO: Simulating the Aruba health check
    $Switch_Model = "Aruba 2930F 24G"
    $Uptime = "14 Days, 2 Hours"
    
    Write-Host " >> Status: CONNECTED" -ForegroundColor Green
    Write-Host " >> Model: $Switch_Model"
    Write-Host " >> Uptime: $Uptime"
}
catch {
    Write-Host " [!] Error: Could not reach Aruba Switch." -ForegroundColor Red
}

Write-Host "`n--- [ All Checks Completed Successfully ] ---" -ForegroundColor Yellow