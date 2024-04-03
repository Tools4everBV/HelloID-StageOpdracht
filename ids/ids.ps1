Function new-user{
Param(
    [parameter(Mandatory)]
    $employeeId,
    [parameter(Mandatory)]
    $firstname,
    [parameter(Mandatory)]
    $lastname,
    [parameter(Mandatory)]
    $email,
    [parameter(Mandatory)]
    $active
)
$user = [PSCustomObject]@{
    employeeId = $employeeId
    firstname = $firstname
    lastname = $lastname
    email = $email
    active= $active
}
Invoke-RestMethod -Uri http://localhost:5006/api/Users -body($user | ConvertTo-Json) -ContentType "application/json" -Method "Post"
}
New-user -employeeId ... -firstname ... -lastname ... -email ... -active $true

Function get-user-id{
    Param($id)
    Invoke-RestMethod http://localhost:5006/api/Users/$id
}

function delete-user-id {
    param ($id)
    Invoke-RestMethod http://localhost:5006/api/Users/$id -method Delete
     }

function delete-users {
    $ids= @(2800..10000)
    foreach($id in $ids){delete-user-id -id $id}
}
function create-users{
$users = Import-csv C:\temp\users.csv
foreach($user in $users ){
    new-user -employeeId $user.employeeId -firstname $user.firstName -lastname $user.lastName -email $user.email -active $true
}
}
