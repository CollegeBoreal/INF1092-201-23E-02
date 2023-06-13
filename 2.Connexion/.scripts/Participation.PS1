#Local Host Computer 
#$RequestingServer = $env:COMPUTERNAME

#Server List From Text File
#$ServerList = Get-Content 'C:\temp\servicetest\servers.txt'

#Server List In Script 
$ServerList = '10.13.237.26','10.13.237.27'

#Local Server Admin Account
[STRING] $LocalUser = "Brice" #Obviously Change Account
[STRING] $LocalPassword = "B0r34l$" #Obviously Change Password
$LocalSecurePassword = $LocalPassword | ConvertTo-SecureString -AsPlainText -Force
$LocalCredentials = New-Object System.Management.Automation.PSCredential -ArgumentList $LocalUser, $LocalSecurePassword

#If running on multiple computers / servers etc. - - See Lines 5 and 8
ForEach($ComputerName in $ServerList) {
    
    #Update Windows Something Locally - See Line 2
    #$LocalSession = New-PSSession -Computername $RequestingServer -Credential $LocalCredentials
    
    #$LocalSession = New-PSSession -Computername $ComputerName -Credential $LocalCredentials  -Authentication Negotiate -Verbose
    #Update Windows Something Remotely - See Lines 5 and 8
    $LocalSession = New-PSSession -Computername $ComputerName -Credential $LocalCredentials
        Invoke-Command -Session $LocalSession -ScriptBlock {
        
        #Some commands need the computername currently using localhost...
        $GPUpdateServer = $Using:ComputerName
        #$GPUpdateServer = $Using:RequestingServer
        
        # enter code of what you plan to do... 
        Invoke-GPUpdate -Computer $GPUpdateServer -RandomDelayInMinutes 0
        }
        
} End of ForEach Statement

