
# This must be the first line in the script
Using Module '.\Core\Library\jsonParser\jsonParser.psm1'

$Game = New-Object jsonParser
$Game.setFilename("game")

# ======================================================


function Show {
    [cmdletbinding()]
    param(
        [parameter(Mandatory = $false)]
        [string] $Optional
    )

    switch($Optional) {
        'Running-Config' {
            Write-Host("Running Config")
        }

        'Engine-Config' {
            Write-Host("Engine Config")
        }

        'Security-Config' {
            Write-Host("Security Config")
        }

        'Communication-Config' {
            Write-Host("Communication Config")
        }

        'Navigation-Config' {
            Write-Host("Navigation Config")
        }

        'Weapon-Config' {
            Write-Host("Weapong config")
        }

        <#
            Resources Objects
        #>
        'Power-Config' {
            Write-Host("Power Config")
        }
        
        'LifeSupport-Config' {
        }





        <#
            Internal Objects
        #>
        'EngineeringTeam-Config' {}
        'ScienceTeam-Config' {}
        'BridgeTeam-Config' {}
        'SecurityTeam-Config'{}
        'ExplorerTeam-Config' {}
        'MiningTeam-Config' {}
        'MedicalTeam-Config' {}
        'Commander-Config' {}


        <#
            External Objects
        #>
        'Scanner-Config' {}

        <#
            Additional Objects
        #>
    }
}

$Configuration_Shield = New-Object -TypeName PSObject -Property @{
    AirlockShield = $false
    AirlockShieldStrength = 100

    ShipShield = $false
    ShipShieldStrength = 100

    ConfinementShield = $false
    ConfinementShieldStrenth = 100

    ShieldBudget = 100
}

$Configuration_Engine = New-Object -TypeName PSObject -Property @{
    IonPropulsionEngine = $false
    IonPropulsionEngineStrength = 100

    ImpulseEngine = $false
    ImpulseEngineStrength = 100


}
<#
    CHANCES of shit hitting the fan
        
        - Decompression of Sectors (Random 1 in a million) - Between 950k to 1mil 
        - Hit by an asteroid (Random 1 in 5 million) - 4.5m to 5m
        - attack by alian crusade or something (Random 
#>

<#
    Random Events
#>

$DecompressionRandom = Get-Random -Minimum 1 -Maximum 1000000
$AsteroidHitRandom   = Get-Random -Minimum 1 -Maximum 5000000
$AlienAttackRandom   = Get-Random -Minimum 1 -Maximum 10000000
$BlackholeRandom     = Get-Random -Minimum 1 -Maximum 50000000 
$SolarFlareRandom    = Get-Random -Minimum 1 -Maximum 10000000


<# 
    How should the loop be designed?

    1. Check for game win/lose condition - What are they?
        - Do if any
    2. Check for planned occurences / Random Occurences (Planned prioritised)
        - Do if any
    3. Check for change in config (By Player)
        - Do if any
    4. Check for change in config (By Game) - Take into account what the player has done
        - Do if any
    5. Update Window, status
#>
<#
    10 Turns = 1.Day
#>

$Global:GameTurns = 1           # First Turn
$Global:GameDays = 1            # Day 1
$Global:GameLengthDays = 100    # Days

function New-Turn {
    [cmdletbinding()]
    param()

    # Print out Day statement
    Write-Host("Turn $($Global:GameTurns) - Day $($Global:GameDays)")

    # Increment GameTurns by 1 
    $Global:GameTurns += 1

    # Check turn if we have gotten to a new day  
    if ($Global:GameTurns % 10 -eq 0) {
        $Global:GameDays += 1       
    }
}

# This should be inside the gameloop
while ($Global:GameDays -ne $Global:GameLengthDays) {
    New-Turn
    Read-Host("Press Enter")    
}

# All configuration files should be in json
# Configuration files - Initial Object Creation



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

Get-VisualDisplayProgress -Process "Initializing Command Module" -EndText "Complete" -EndColor "Green"
Get-VisualDisplayProgress -Process "Initializing TelNac" -EndText "Complete" -EndColor "Green"
Get-VisualDisplayProgress -Process "Transffering Command and Control" -EndText "Complete" -EndColor "Green"

Write-Host("")
Write-Host("Congratulations Commander, the ship is now yours!")



