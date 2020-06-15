#Global Strings
([string]$GamePath = 'D:\Steam\steamapps\common\APB Reloaded')

# Main menu, allowing user selection
function Show-Main-Menu
{
     param (
           [string]$Title = 'APB Config Tool'
     )
     cls
     Write-Host "================ $Title ================"

     Write-Host "Please Read the quick start guide if first time user."
    
     Write-Host "1: Press '1' to run Quick Config creator."
     Write-Host "2: Press '2' to apply config."
     Write-Host "3: Press '3' to backup current game directory."
     Write-Host "4: Press '4' to restore current backup game directory."
     Write-Host "5: Press '5' to read quick start guide."
     Write-Host "Q: Press 'Q' to quit."
}

#Functions go here

Function QuickCFG {
     param (
           [string]$ConfigMenuTitle = 'Quick Configuration Menu'
     )
#     cls
     Write-Host "================ $ConfigMenuTitle ================"

     Write-Host "Select what options you want to include in your config."
     Write-Host "If you need to reset the configuration process select the Reset option."
    
     Write-Host "1: Press '1' to select [NEW] Graphics. $NewGraphicsSelected"
     Write-Host "2: Press '2' to select [OLD] Graphics. $OldGraphicsSelected"
     Write-Host "3: Press '3' to select [OLD] Mission Names Only - Flaws Version $OldMissionNames"
     Write-Host "4: Press '4' to select Always Sprint + Hold Crouch. $AlwaysSprint"
     Write-Host "5: Press '5' to select Flaws Localization (UI) $Localization"
     Write-Host "6: Press '6' to select Loading + Login Screen $LoadingLogin"
     Write-Host "7: Press '7' to select Mission Stages (Description)$MissionStages"
     Write-Host "8: Press '8' to select Remove Ambient Sounds. $AmbientSounds"
     Write-Host "9: Press '9' to select Remove VivoxVoiceService $VivoxVoiceService"
     Write-Host "R: Press 'R' to reset ."
     Write-Host "E: Press 'E' to exit."
do
{
     $ConfigMenuInput = Read-Host "Please make a selection"
     switch ($ConfigMenuInput)
     {
           '1' {
                ([string]$NewGraphicsSelected = 'Selected')
                Copy-Item -Path '.\Configs\NEW Graphics\APBGame' -Destination '.\Application Directory\' -Recurse -Force
                cls
                QuickCFG
           } '2' {
                ([string]$OldGraphicsSelected = 'Selected')
                Copy-Item -Path '.\Configs\OLD Graphics\APBGame' -Destination '.\Application Directory\' -Recurse -Force
                cls
                QuickCFG
           } '3' {
                ([string]$OldMissionNames = 'Selected')
                Copy-Item -Path '.\Configs\OLD Mission Names Only - Flaws Version\APBGame' -Destination '.\Application Directory\' -Recurse -Force
                cls
                QuickCFG
           } '4' {
                ([string]$AlwaysSprint = 'Selected')
                cls
                Copy-Item -Path '.\Configs\Always Sprint + Hold Crouch\APBGame' -Destination '.\Application Directory\' -Recurse -Force
                QuickCFG
           } '5' {
                ([string]$Localization = 'Selected')
                Copy-Item -Path '.\Configs\Flaws Localization\APBGame' -Destination '.\Application Directory\' -Recurse -Force
                cls
                QuickCFG
           } '6' {
                ([string]$LoadingLogin = 'Selected')
                Copy-Item -Path '.\Configs\Loading + Login Screen\APBGame' -Destination '.\Application Directory\' -Recurse -Force
                cls
                QuickCFG
           } '7' {
                ([string]$MissionStages = 'Selected')
                cls
                Copy-Item -Path '.\Configs\Mission Stages\APBGame' -Destination '.\Application Directory\' -Recurse -Force
                QuickCFG
           } '8' {
                ([string]$AmbientSounds = 'Selected')
                Copy-Item -Path '.\Configs\Remove Ambient Sounds\APBGame' -Destination '.\Application Directory\' -Recurse -Force
                cls
                QuickCFG
           } '9' {
                ([string]$VivoxVoiceService = 'Selected')
                Copy-Item -Path '.\Configs\Remove VivoxVoiceService\Binaries' -Destination '.\Application Directory\' -Recurse -Force
                cls
                QuickCFG
           } 'r' {
                Remove-Item -Recurse -Path '.\Application Directory\*' 
                ([string]$NewGraphicsSelected = '')
                ([string]$OldGraphicsSelected = '')
                ([string]$OldMissionNames = '')
                ([string]$AlwaysSprint = '')
                ([string]$Localization = '')
                ([string]$LoadingLogin = '')
                ([string]$MissionStages = '')
                ([string]$AmbientSounds = '')
                ([string]$VivoxVoiceService = '')
                ([string]$NewGraphicsSelected = '')
                ([string]$NewGraphicsSelected = '')
                ([string]$NewGraphicsSelected = '')
                ([string]$NewGraphicsSelected = '')
                cls
                QuickCFG
           } 'e' {
                ([string]$ConfigMenuInput = 'e')
           } 
     }
}
until ($ConfigMenuInput -eq 'e')}
Function ApplyCFG {Copy-Item -Recurse -Force -Path '.\Application Directory\*' -Destination $GamePath}
Function BackupCurrentGame {Copy-Item -Recurse -Force -Path $GamePath -Destination '.\Backup Dir'}
Function RestoreCurrentGameBackup {
Write-Host "Are you sure you want to restore the current backup? This will delete your current game directory and replace it with the backup. If the backup does not exist you will be left without a game directory."
pause
pause
pause
pause
Remove-Item -Path $GamePath -Recurse
Copy-Item -Path '.\Backup Dir\APB Reloaded\' -Recurse -Destination $GamePath}
Function QuickStartGuide {Write-Host "QuickStartGuide"

Write-Host "Hello and Welcome to the Quickstart Guide."
Write-Host " "
Write-Host " "
Write-Host "Required Configuration"
Write-Host "Please change the GamePath under #Global Strings to your GamePath. "
Write-Host "Heres your 5 second explanation on how to use the Quick Config Creator."
Write-Host "Step 1 Know what config options you want to apply. You can find information on what specific config options do inside of the Configs directory."
Write-Host "Step 2 Select the Config options by pressing the number assosiated with the option and hitting enter. If you did it correctly it will show up with Selected after."
Write-Host "Step 3 In case you messed up selecting just select the Reset option it will reset your current settings waiting to be applied."
Write-Host "Step 4 If you feel like your done with creating your config just select the Exit option and press enter. All settings made are saved upon pressing enter to select them."
Write-Host "Step 5 Your done."
Write-Host " "
Write-Host " "
Write-Host "In case exiting the Quick Config Creator is buggy its fine to force exit the script. As long as you get up the Quick Config menu again before you exit the script theres no possibility of issues. Known to the Developer"
Write-Host " "
Write-Host " "
pause
Write-Host " "
Write-Host " "
Write-Host "How to apply the config stored in Application Directory."
Write-Host "Step 1 Select the Apply config option"
Write-Host "Step 2 Your done"
pause
Write-Host " "
Write-Host " "
Write-Host "How to Backup and Restore Game Directory"
Write-Host "Why do you want to do this? Well its simple on a fast system like the system of the developer of this script its faster to replace the game files with a backup than it is to repair them."
Write-Host "Its also way simpler to press two diffrent buttons and waiting a bit."
Write-Host "So how do i do this backup restore procedure."
Write-Host "Step 1 Run option 3 and wait until completion."
Write-Host "Step 2 your done with Backup"
Write-Host "Step 3 When your want to restore the backup just run option 4 and the backup will replace the current game directory and the old one will be deleted in the process."
pause
}
#Main menu loop
do
{
     Show-Main-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
                cls
                QuickCFG
           } '2' {
                ApplyCFG
           } '3' {
                cls
                BackupCurrentGame
           } '4' {
                cls
                RestoreCurrentGameBackup
           } '5' {
                cls
                QuickStartGuide
           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')
