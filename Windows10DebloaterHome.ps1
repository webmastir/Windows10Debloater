#This utility removes all of the Windows 10 bloatware that is preinstalled. Use the # to comment
#out a bloatware app that you would like to keep.

Function Start-Debloat {
    
    #Start of W4RH4AWK's License (https://github.com/W4RH4WK)  
     
    $apps = @(
    
        "Microsoft.3DBuilder"
        "Microsoft.Microsoft3DViewer"
        "Microsoft.Appconnector"
        "Microsoft.BingFinance"
        "Microsoft.BingNews"
        "Microsoft.BingSports"
        "Microsoft.BingWeather"
        "Microsoft.WindowsCamera"
        #"Microsoft.FreshPaint"
        "Microsoft.Getstarted"
        "Microsoft.MicrosoftOfficeHub"
        "Microsoft.MicrosoftSolitaireCollection"
        "Microsoft.MicrosoftStickyNotes"
        "Microsoft.Office.OneNote"
        "Microsoft.OneConnect"
        "Microsoft.People"
        "Microsoft.SkypeApp"
        "Microsoft.StorePurchaseApp"
        #"Microsoft.Windows.Photos"
        "Microsoft.WindowsAlarms"
        #"Microsoft.WindowsCalculator"
        "Microsoft.WindowsCamera"
        "Microsoft.Windows.Cortana"
        "Microsoft.WindowsMaps"
        "Microsoft.WindowsPhone"
        "Microsoft.WindowsSoundRecorder"
        #"Microsoft.WindowsStore"
        "Microsoft.XboxApp"
        "Microsoft.XboxGameOverlay"
        "Microsoft.XboxSpeechToTextOverlay"
        "Microsoft.XboxIdentityProvider"
        "Microsoft.XboxGameXCallableUI"
        "Microsoft.ZuneMusic"
        "Microsoft.ZuneVideo"
        "microsoft.windowscommunicationsapps"
        "Microsoft.Wallet"
        "Microsoft.MinecraftUWP"
        "Microsoft.NetworkSpeedTest"
        "Microsoft.PPIProjection"
        "Microsoft.MicrosoftEdge"
        "Microsoft.MicrosoftPowerBIForWindows"
        "AdobeSystemsIncorporated.AdobePhotoshopExpress"
        "Microsoft.CommsPhone"
        "Microsoft.ConnectivityStore"
        "Microsoft.Messaging"
        "Microsoft.Office.Sway"
        "Microsoft.OneConnect"
        "Microsoft.WindowsFeedbackHub"
        "Microsoft.BingFoodAndDrink"
        "Microsoft.BingTravel"
        "Microsoft.BingHealthAndFitness"
        "Microsoft.WindowsReadingList"
        "CortanaListenUIApp"
        "Microsoft.MicrosoftSolitaiteCollection"
        "CortanaListenUIApp_10.0.15063.0_neutral__cw5n1h2txyewy"
        "9E2F88E3.Twitter"
        "PandoraMediaInc.29680B314EFC2"
        "Flipboard.Flipboard"
        "ShazamEntertainmentLtd.Shazam"
        "king.com.CandyCrushSaga"
        "king.com.CandyCrushSodaSaga"
        "king.com.*"
        "ClearChannelRadioDigital.iHeartRadio"
        "4DF9E0F8.Netflix"
        "6Wunderkinder.Wunderlist"
        "Drawboard.DrawboardPDF"
        "2FE3CB00.PicsArt-PhotoStudio"
        "D52A8D61.FarmVille2CountryEscape"
        "TuneIn.TuneInRadio"
        "GAMELOFTSA.Asphalt8Airborne"
        "TheNewYorkTimes.NYTCrossword"
        "DB6EA5DB.CyberLinkMediaSuiteEssentials"
        "Facebook.Facebook"
        "flaregamesGmbH.RoyalRevolt2"
        "Playtika.CaesarsSlotsFreeCasino"
        "46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y"
        "ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
        "AdobeSystemsIncorporated.AdobePhotoshopExpress_1.3.2.4_x64__ynb6jyjzte8ga"
        "ActiproSoftwareLLC.562882FEEB491"
    )
    
    ForEach ($app in $apps) {
        Write-Output "Trying to remove $app"
    
        Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage
    
        Get-AppXProvisionedPackage -Online |
            Where-Object DisplayName -EQ $app |
            Remove-AppxProvisionedPackage -Online 
    } 
}

#"THE BEER-WARE LICENSE" (Revision 42):

#As long as you retain this notice you can do whatever you want with this
#stuff. If we meet some day, and you think this stuff is worth it, you can
#buy us a beer in return.

#This project is distributed in the hope that it will be useful, but WITHOUT
#ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#FITNESS FOR A PARTICULAR PURPOSE.
    
#END OF LICENSE 

    
Function Backup-Keys {

    New-Item -ItemType Directory -Path C:\ -Name Windows10Debloater     
    New-Item -ItemType Directory -Path C:\Windows10Debloater\ -Name Windows.AppServiceKeys      
    New-Item -ItemType Directory -Path C:\Windows10Debloater\ -Name Windows.BackgroundTasks
    New-Item -ItemType Directory -Path C:\Windows10Debloater\ -Name Windows.File
    New-Item -ItemType Directory -Path C:\Windows10Debloater\ -Name Windows.Launch
    New-Item -ItemType Directory -Path C:\Windows10Debloater\ -Name Windows.PreInstalledConfigTask
    New-Item -ItemType Directory -Path C:\Windows10Debloater\ -Name Windows.Protocol
    New-Item -ItemType Directory -Path C:\Windows10Debloater\ -Name Windows.ShareTarget

    Sleep 1

        #Creates a backup of the registry keys in 'Remove-Keys'
        New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
    
        $Backup = @(
            #Background Tasks
            REG EXPORT "HKEY_CLASSES_ROOT\Extensions\ContractId\Windows.BackgroundTasks\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0" "C:\Windows10Debloater\Windows.BackgroundTasks\ActiproBackground.reg"
            REG EXPORT "HKEY_CLASSES_ROOT\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe" "C:\Windows10Debloater\Windows.BackgroundTasks\MSOfficeHubBackground.reg"
            REG EXPORT "HKEY_CLASSES_ROOT\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy" "C:\Windows10Debloater\Windows.BackgroundTasks\PPIBackground.reg"
            REG EXPORT "HKEY_CLASSES_ROOT\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy" "C:\Windows10Debloater\Windows.BackgroundTasks\XboxBackground.reg"
    
            #Windows File
            REG EXPORT "HKEY_CLASSES_ROOT\Extensions\ContractId\Windows.File\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0" "C:\Windows10Debloater\Windows.File\ActiproFile.reg"
    
            REG EXPORT "HKEY_CLASSES_ROOT\Extensions\ContractId\Windows.Launch\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y" "C:\Windows10Debloater\Windows.Launch\EclipseLaunch.reg"
            REG EXPORT "HKEY_CLASSES_ROOT\Extensions\ContractId\Windows.Launch\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0" "C:\Windows10Debloater\Windows.Launch\ActiproLaunch.reg"
            REG EXPORT "HKEY_CLASSES_ROOT\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy" "C:\Windows10Debloater\Windows.Launch\PPILaunch.reg"
            REG EXPORT "HKEY_CLASSES_ROOT\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy" "C:\Windows10Debloater\Windows.Launch\XboxLaunch.reg"
        
            #Windows Protocol Keys
            REG EXPORT "HKEY_CLASSES_ROOT\Extensions\ContractId\Windows.Protocol\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0" "C:\Windows10Debloater\Windows.Protocol\ActiproProtocol.reg"
            REG EXPORT "HKEY_CLASSES_ROOT\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy" "C:\Windows10Debloater\Windows.Protocol\PPIProtocol.reg"
            REG EXPORT "HKEY_CLASSES_ROOT\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy" "C:\Windows10Debloater\Windows.Protocol\XboxProtocol.reg"
       
            #Windows Share Target
            REG EXPORT "HKEY_CLASSES_ROOT\Extensions\ContractId\Windows.ShareTarget\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0" "C:\Windows10Debloater\Windows.ShareTarget\ActiproShare.reg"
        )

        ForEach ($Item in $Backup) {
            Write-Output "Backing up $Backup from registry to C:\Windows10Debloater\ Directory"
        }
}

Function Remove-Keys {

        #Creates a "drive" to access the HKCR (HKEY_CLASSES_ROOT)
        New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
    
        $Keys = @(
    
            #Remove Background Tasks
            "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y"
            "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
            "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe"
            "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
            "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
    
            #Windows File
            "HKCR:\Extensions\ContractId\Windows.File\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
    
            #Registry keys to delete if they aren't uninstalled by RemoveAppXPackage/RemoveAppXProvisionedPackage
            "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y"
            "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
            "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
            "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
    
            #Scheduled Tasks to delete
            "HKCR:\Extensions\ContractId\Windows.PreInstalledConfigTask\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe"
    
            #Windows Protocol Keys
            "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
            "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
            "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
       
            #Windows Share Target
            "HKCR:\Extensions\ContractId\Windows.ShareTarget\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
        )
    
        ForEach ($Key in $Keys) {
            Write-Output "Removing $Key from registry"
            Remove-Item $Key -Recurse
        }
}
    
Function Protect-Privacy {

    New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
    Sleep 2
    
    #Disables Windows Feedback Experience
    If (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo') {
        $Advertising = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo'
        Set-ItemProperty $Advertising -Name Enabled -Value 0
    }
    
    #Stops Cortana from being used as part of your Windows Search Function
    If ('HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search') {
        #Disables Cortana
        $Search = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search'
        Set-ItemProperty $Search -Name AllowCortana -Value 0
    }
    
    If (!('HKCU:\Software\Microsoft\Siuf\Rules\PeriodInNanoSeconds')) { 
        $Period = 'HKCU:\Software\Microsoft\Siuf\Rules\PeriodInNanoSeconds'
        New-Item $Period
        Set-ItemProperty -Name PeriodInNanoSeconds -Value 0
    }
           
    Write-Output "Adding Registry key to prevent bloatware apps from returning"
           
    #Prevents bloatware applications from returning
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content\")) {
        $registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content"
        Mkdir $registryPath
        New-ItemProperty $registryPath -Name DisableWindowsConsumerFeatures -Value 1
    }
           
    Sleep 1
           
    Write-Output "Stopping Edge from taking over as the default .PDF viewer"
           
    If ('HKCR:\.pdf') {
        #This is the .pdf file association string
        $PDF = 'HKCR:\.pdf'
        New-ItemProperty $PDF -Name NoOpenWith
        New-ItemProperty $PDF -Name NoStaticDefaultVerb
    }
           
    Sleep 1
           
    If ('HKCR:\.pdf\OpenWithProgids') {
        #This is the .pdf file association string
        $Progids = 'HKCR:\.pdf\OpenWithProgids'
        New-ItemProperty $Progids -Name NoOpenWith
        New-ItemProperty $Progids -Name NoStaticDefaultVerb
    }
}
Function Revert-Changes {        

    Get-AppxPackage -AllUsers | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
    
    If (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo') {
        $Advertising = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo'
        Set-ItemProperty $Advertising -Name Enabled -Value 1
    }
    
    #Stops Cortana from being used as part of your Windows Search Function
    If ('HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search') {
        #Disables Cortana
        $Search = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search'
        Set-ItemProperty $Search -Name AllowCortana -Value 1
    }
       
    Write-Output "Adding Registry key to prevent bloatware apps from returning"
       
    #Prevents bloatware applications from returning
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content\")) {
        $registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content"
        Mkdir $registryPath
        New-ItemProperty $registryPath -Name DisableWindowsConsumerFeatures -Value 1
    }
       
    Sleep 1
       
    Write-Output "Stopping Edge from taking over as the default .PDF viewer"
       
    If ('HKCR:\.pdf') {
        #This is the .pdf file association string
        $PDF = 'HKCR:\.pdf'
        New-ItemProperty $PDF -Name NoOpenWith
        New-ItemProperty $PDF -Name NoStaticDefaultVerb
    }
       
    Sleep 1
       
    If ('HKCR:\.pdf\OpenWithProgids') {
        #This is the .pdf file association string
        $Progids = 'HKCR:\.pdf\OpenWithProgids'
        New-ItemProperty $Progids -Name NoOpenWith
        New-ItemProperty $Progids -Name NoStaticDefaultVerb
    }
        
    $env:Path = "C:\Windows10Debloater\Windows.BackgroundTasks\ActiproBackground.reg"
    Start-Process $env:Path
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')
    Sleep 1
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')

    $env:Path = "C:\Windows10Debloater\Windows.BackgroundTasks\PPIBackground.reg"
    Start-Process $env:Path
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')
    Sleep 1
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')

    $env:Path = "C:\Windows10Debloater\Windows.BackgroundTasks\XboxBackground.reg"
    Start-Process $env:Path
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')
    Sleep 1
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')

    $env:Path = "C:\Windows10Debloater\Windows.File\ActiproFile.reg"
    Start-Process $env:Path
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')
    Sleep 1
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')

    $env:Path = "C:\Windows10Debloater\Windows.Launch\ActiproLaunch.reg"
    Start-Process $env:Path
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')
    Sleep 1
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')

    $env:Path = "C:\Windows10Debloater\Windows.Launch\EclipseLaunch.reg"
    Start-Process $env:Path
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')
    Sleep 1
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')

    $env:Path = "C:\Windows10Debloater\Windows.Launch\PPILaunch.reg"
    Start-Process $env:Path
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')
    Sleep 1
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')

    $env:Path = "C:\Windows10Debloater\Windows.Launch\XboxLaunch.reg"
    Start-Process $env:Path
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')
    Sleep 1
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')

    $env:Path = "C:\Windows10Debloater\Windows.Protocol\ActiproProtocol.reg"
    Start-Process $env:Path
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')
    Sleep 1
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')

    $env:Path = "C:\Windows10Debloater\Windows.Protocol\PPIProtocol.reg"
    Start-Process $env:Path
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')
    Sleep 1
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')

    $env:Path = "C:\Windows10Debloater\Windows.Protocol\XboxProtocol.reg"
    Start-Process $env:Path
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')
    Sleep 1
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')

    $env:Path = "C:\Windows10Debloater\Windows.ShareTarget\ActiproShare.reg"
    Start-Process $env:Path
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')
    Sleep 1
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('UAC')
    Sleep 1
    $wshell.SendKeys('~')

}
    
Write-Output "Do you want to enable System Restore Functionality? (!RECOMMENDED!)" 
$Readhost = Read-Host " ( Yes / No ) " 
Switch ($ReadHost) { 
    Yes {
        Write-Output "Enabling System Restore Functionality" ; $PublishSettings = $true
        Enable-ComputerRestore -Drive "C:\"
    } 
    No {Write-Output "Skipping..."; $PublishSettings = $false} 
}
    
Write-Output "Do you want to create a System Restore Checkpoint? (!RECOMMENDED!)" 
$Readhost = Read-Host " ( Yes / No ) " 
Switch ($ReadHost) { 
    Yes {
        Write-Output "Creating a system restore checkpoint...." ; $PublishSettings = $true
        Checkpoint-Computer -Description "Windows 10 Debloat" -RestorePointType "APPLICATION_UNINSTALL"
    } 
    No {Write-Output "Skipping..."; $PublishSettings = $false} 
}
    
#Asks if you want to continue the script or if you want to stop it
Write-Output "Do you want to continue this script?"
$ReadHost = Read-Host " ( Yes / No ) "
Switch ($ReadHost) {
    Yes {Write-Output "Continuing..."; $PublishSettings = $true}
    No {
        Write-Output "Exiting script."; $PublishSettings = $false
        Sleep 1
        Exit
    }
}
    
Write-Output "The following options will allow you to either Debloat Windows 10, or to revert changes made after Debloating Windows 10.
    Choose 'Debloat' to Debloat Windows 10 or choose 'Revert' to revert changes." 
$Readhost = Read-Host " ( Debloat / Revert ) " 
Switch ($ReadHost) {
    #This will debloat Windows 10
    Debloat {
        Write-Output "Starting Debloat. Uninstalling bloatware, backing up registry keys and then removing the registry keys."; $PublishSettings = $true
        Start-Debloat
        Backup-Keys
        Remove-Keys
    }

    Revert {
        Write-Output "Reverting changes..."; $PublishSettings = $false
        Revert-Changes}
}
    
Write-Output "Do you want to change some privacy settings?"
$Readhost = Read-Host " ( Yes / No ) "
Switch ($ReadHost) {
    Yes {
        Write-Output "Changing some system settings"; $PublishSettings = $true
        Protect-Privacy
    }
    No {Write-Output "Skipping..."; $PublishSettings = $false}
}

Write-Output "Do you want to view the license?"
$Readhost = Read-Host " ( Yes / No ) "
Switch ($ReadHost) {
    Yes {
        Start-Process C:\Windows10Debloater\license.txt ; $PublishSettings = $true
    }
    No {Write-Output "Skipping..."; $PublishSettings = $false}
}

Write-Output "Script has finished. Exiting."
Sleep 2
Exit