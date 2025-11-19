# Automatic user allocation from Text File
# Creates AD users from a text file and assigns them to departments


# Import Active Directory module
Import-Module ActiveDirectory


# Define the path to the text file
$usersFile = "C:\ADUsers\users"


$OUs = @(
    "OU=Sales,OU=SkateShop,DC=skate,DC=shop"
    "OU=Management,OU=SkateShop,DC=skate,DC=shop"
    "OU=IT,OU=SkateShop,DC=skate,DC=shop"
    "OU=Inventory,OU=SkateShop,DC=skate,DC=shop"

)


# Default password for new users
$defaultPassword = ConvertTo-SecureString "Password1!" -AsPlainText -Force


# Read the file
$users = Get-Content $usersFile


# Cycle through the OU's
$ouIndex = 0

foreach ($user in $users) {
    # Split the names
    $nameParts = $user.Trim() -split '\s+'
    $firstName = $nameParts[0]
    $lastName = $nameParts[-1]

    # Generate usernames (first initial + last name)
    $username = ($firstName.Substring(0,1) + $lastName).ToLower()

    # Select OU
    $targetOU = $OUs[$ouIndex % $OUs.Count]

    try {
        # Create the user
        New-ADUser -Name "$firstName $lastName" `
                   -GivenName $firstName `
                   -Surname $lastName `
                   -SamAccountName $username `
                   -UserPrincipalName "$username@skate.shop" `
                   -Path $targetOU `
                   -AccountPassword $defaultPassword `
                   -Enabled $true `
                   -ChangePasswordAtLogon $true

        Write-Host "Created User: $username in $targetOU" -ForegroundColor Green
    }
    catch {
        Write-Host "Error creating user $username : $_" -ForegroundColor Red
    }

    $ouIndex++
}


Write-Host "`nUser creation complete!" -ForegroundColor Cyan
