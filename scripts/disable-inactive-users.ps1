# Disable Inactive Users
# Disables user accounts that haven't logged in for 30+ days

# Import Active Directory module
Import-Module ActiveDirectory

# Set how many days of inactivity before disabling
$inactiveDays = 30

# Calculate the date threshold
$dateThreshold = (Get-Date).AddDays(-$inactiveDays)

# Output file for report
$reportFile = "C:\ADUsers\InactiveUsers.csv"

# Get all enabled users and check their last logon
$inactiveUsers = Get-ADUser -Filter {Enabled -eq $true} -Properties LastLogonDate |
    Where-Object { $_.LastLogonDate -lt $dateThreshold -or $_.LastLogonDate -eq $null }

# Create report array
$report = @()

foreach ($user in $inactiveUsers) {
    try {
        # Disable the user account
        Disable-ADAccount -Identity $user.SamAccountName
        
        # Add to report
        $report += [PSCustomObject]@{
            Username = $user.SamAccountName
            Name = $user.Name
            LastLogon = $user.LastLogonDate
            Status = "Disabled"
        }
        
        Write-Host "Disabled: $($user.SamAccountName) - Last logon: $($user.LastLogonDate)" -ForegroundColor Yellow
    }
    catch {
        Write-Host "Error disabling $($user.SamAccountName): $_" -ForegroundColor Red
    }
}

# Export report
$report | Export-Csv -Path $reportFile -NoTypeInformation

# Display summary
Write-Host "`n===== Summary =====" -ForegroundColor Cyan
Write-Host "Inactive users disabled: $($report.Count)" -ForegroundColor Green
Write-Host "Report saved to: $reportFile" -ForegroundColor Cyan