<#
    This is the core configuration for the game, I am guessing this will be quite big after a while
#>
$GameObjectConfiguration = New-Object -TypeName PSObject -Property @{
    Core = @{
        MaxDays = 1000
    }

    Events = @{
        Asteroid    = @{
            Enabled      = $True
            RandomChance = 5000000 
        }
        Aliens      = @{
            Enabled      = $True
            RandomChance = 10000000
        }
        Blackhole   = @{
            Enabled      = $True
            RandomChance = 500000000
        }
        SolarFlare  = @{
            Enabled      = $True
            RandomChance = 1000000000
        }
    }
}