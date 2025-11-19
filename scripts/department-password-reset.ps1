# Bulk Password Reset for Department
# Resets passwords for all users in a specified OU

# Import Active Directory module
Import-Module ActiveDirectory

# Specify the OU to reset passwords for
$targetOU = "OU=Sales,OU=SkateShop,DC=skate,DC=shop"

# Output file for password list
$outputFile = "C:\ADUsers\PasswordResets.csv"

# Function to generate random password
function Generate-Password {
    $length = 10
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$"
    $password = ""
    for ($i = 0; $i -lt $length; $i++) {
        $password += $chars[(Get-Random -Maximum $chars.Length)]
    }
    return $password
}

# Get all users in the OU
$users = Get-ADUser -Filter * -SearchBase $targetOU

# Create array to store results
$results = @()

foreach ($user in $users) {
    # Generate new password
    $newPassword = Generate-Password
    $securePassword = ConvertTo-SecureString $newPassword -AsPlainText -Force
    
    try {
        # Reset the password
        Set-ADAccountPassword -Identity $user.SamAccountName -NewPassword $securePassword -Reset
        Set-ADUser -Identity $user.SamAccountName -ChangePasswordAtLogon $true
        
        # Store result
        $results += [PSCustomObject]@{
            Username = $user.SamAccountName
            Name = $user.Name
            NewPassword = $newPassword
            Status = "Success"
        }
        
        Write-Host "Reset password for: $($user.SamAccountName)" -ForegroundColor Green
    }
    catch {
        $results += [PSCustomObject]@{
            Username = $user.SamAccountName
            Name = $user.Name
            NewPassword = "N/A"
            Status = "Failed - $($_.Exception.Message)"
        }
        Write-Host "Failed to reset password for: $($user.SamAccountName) - Error: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Export to CSV
$results | Export-Csv -Path $outputFile -NoTypeInformation

Write-Host "`nPassword reset complete! Results saved to: $outputFile" -ForegroundColor Cyan