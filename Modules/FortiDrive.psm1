function Get-FortiSecurityStatus {
    param([string]$IP)
    
    # In a real world, this would use an API 'GET' request
    # For our Spectacular Portfolio, we simulate an Advanced Security Audit
    $AuditData = [PSCustomObject]@{
        Device      = "FortiGate-VM"
        IP          = $IP
        ThreatLevel = "Low"
        PolicyCount = 42
        LastBackup  = (Get-Date).AddDays(-1).ToString("yyyy-MM-dd")
    }
    
    return $AuditData
}