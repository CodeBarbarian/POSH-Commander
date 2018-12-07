Function Get-WaitingMessage() {
    Write-Host("
    ======================================================
    Waiting for startup signal to begin processing data
    ======================================================
    ")
}


function Get-VisualDisplayProgress {
    [cmdletbinding()]
    param (
        [parameter(mandatory=$true)]
        [String] $Process,
        [parameter(mandatory=$true)]
        [String] $EndText,
        [parameter(mandatory=$true)]
        [String] $EndColor,
        [parameter(mandatory=$false)]
        [Int] $Speed = 100
    )

    # Preparing
    $MaxCharacters = 50
    $Finished = $False
    $Inject = "="
    $Count = 0
    $Speed = 50

    Write-Host("$($Process)")
    Write-Host("[") -NoNewline
    
    while (-not $Finished) {
        Start-Sleep -Milliseconds $Speed
    
        Write-Host("$($Inject)") -NoNewline

        if ($Count -ge $MaxCharacters) {
            $Finished = $True
        }

        $Count += 1
    }

    Write-Host("] ") -NoNewline
    Write-Host("[$($EndText)]") -ForegroundColor $EndColor
}






$ConfigFile = "c:\users\Morten\desktop\POSH-COMMANDER\config.json"
While ($True) {
    Clear-Host
    Get-WaitingMessage

    $Contents = Get-Content -Path $ConfigFile | ConvertFrom-Json
    
    if ($Contents.signal -eq "true") {
        break
    }
    Start-Sleep -Seconds 5
    

    
} 

Get-VisualDisplayProgress -Process "Initializing Command Module" -EndText "Complete" -EndColor "Green"
Get-VisualDisplayProgress -Process "Initializing TelNac" -EndText "Complete" -EndColor "Green"
Get-VisualDisplayProgress -Process "Transffering Command and Control" -EndText "Complete" -EndColor "Green"

Write-Host("")
Write-Host("Congratulations Commander, the ship is now yours!")