# HelloID-StageOpdracht

Volledige code zie: https://github.com/Tools4everBV/HelloID-StageOpdracht/blob/main/ids/ids.ps1

- [HelloID-StageOpdracht](#helloid-stageopdracht)
  - [Dag 1](#dag-1)
    - [Introductie PowerShell.](#introductie-powershell)
      - [Wat is PowerShell?](#wat-is-powershell)
      - [Werken met de PowerShell console.](#werken-met-de-powershell-console)
    - [PowerShell syntax](#powershell-syntax)
      - [Variabelen](#variabelen)
      - [Foreach](#foreach)
      - [If](#if)
      - [Array collectie](#array-collectie)
      - [Code commentaar syntax](#code-commentaar-syntax)
  - [Dag 2](#dag-2)
    - [Werken met VSCode](#werken-met-vscode)
    - [Functies](#functies)
    - [Via PowerShell een webpagina openen](#via-powershell-een-webpagina-openen)
    - [Wat is een GUI en wat is een API?](#wat-is-een-gui-en-wat-is-een-api)
      - [Een gebruiker ophalen](#een-gebruiker-ophalen)
      - [Een gebruiker aanmaken](#een-gebruiker-aanmaken)
    - [Functies maken](#functies-maken)
  - [Dag 3](#dag-3)
    - [Gebruikers en folders aanmaken](#gebruikers-en-folders-aanmaken)
    - [Gebruikers en folders verwijderen](#gebruikers-en-folders-verwijderen)
    - [Introductie classes](#introductie-classes)


## Dag 1

### Introductie PowerShell. 

#### Wat is PowerShell?

#### Werken met de PowerShell console.

| PowerShell Command | Alias         | Online Help                                                                                   |
|--------------------|--------------|-----------------------------------------------------------------------------------------------|
| Get-ChildItem      | `gci`, `dir` | [Get-ChildItem](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem)  |
| New-Item           | `ni`         | [New-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-item)             |
| Remove-Item        | `ri`, `rm`   | [Remove-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item)      |
| Get-Process        | `gps`        | [Get-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-process)      |
| Import-Csv         |              | [Import-Csv](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/import-csv)          |
| Get-Content        | `gc`         | [Get-Content](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-content)      |

### PowerShell syntax

#### Variabelen

```powershell
$firstName = "John"
$lastName = "Doe"
$age = 30

Write-Host "First Name: $firstName"
Write-Host "Last Name: $lastName"
Write-Host "Age: $age"

$age = 31

Write-Host "Updated Age: $age"
```

#### Foreach

```powershell
foreach ($file in Get-ChildItem -Path C:\temp) {
    Write-Output $file.FullName
}
```

#### If

```powershell
if ($file.Extension -eq ".txt") {
    Write-Output "Found a text file: $($file.FullName)"
}
```

#### Array collectie

```powershell

$numbers = @(1, 2, 3, 4, 5)

Write-Output "First element: $($numbers[0])"
Write-Output "Second element: $($numbers[1])"
Write-Output "Third element: $($numbers[2])"

$numbers += 6

Write-Output "All elements of the array:"
foreach ($number in $numbers) {
    Write-Output $number
}
```

#### Code commentaar syntax

```powershell
# Dit is een stukje code commentaar. Deze beginnen altijd met een '#' hekje.
```

## Dag 2

### Werken met [VSCode](https://code.visualstudio.com)

### Functies

```powershell
function Groet {
    param (
        [string]$Naam
    )
    
    Write-Host "Hallo, $Naam!"
}

# Uitvoeren: Groet -Naam 'John'
# Resultaat: "Hallo John!"
```

### Via PowerShell een webpagina openen

```powershell
$response = Invoke-RestMethod -Uri "https://www.example.com"
$response.Content
```

### Wat is een GUI en wat is een API?

#### Een gebruiker ophalen

```powershell
Invoke-RestMethod http://localhost:5006/api/Users/1
```

#### Een gebruiker aanmaken 

```powershell
$user = [PSCustomObject]@{
    employeeId = $employeeId
    firstname = $firstname
    lastname = $lastname
    email = $email
    active= $active
}
Invoke-RestMethod -Uri http://localhost:5006/api/Users -body($user | ConvertTo-Json) -ContentType "application/json" -Method "Post"
```

### Functies maken

- GetUser
- NewUser
- DeleteUser
- CreateUsers
- DeleteUsers

## Dag 3

### Gebruikers en folders aanmaken

### Gebruikers en folders verwijderen

### Introductie classes

```powershell
class Person {
    [string]$employeeId
    [string]$firstName
    [string]$lastName
    [string]$email

    [void]Create(){
        $user  = [PSCustomObject]@{
            employeeId = $this.employeeId
            firstName  = $this.firstName
            lastname   = $this.lastname
            email      = $this.email
            active     = $active
        }
        Invoke-RestMethod -Uri http://localhost:5006/api/Users -body($user | ConvertTo-Json) -ContentType "application/json" -Method "Post"
    }   
}
```
