# Next step - Get this into a JSON file
#>

$Engines  = @(
    New-Object -TypeName PSObject -Property @{Name="Engine #1"; Type="OK"}
    New-Object -TypeName PSObject -Property @{Name="Engine #2"; Type="Critical"}
    New-Object -TypeName PSObject -Property @{Name="Engine #3"; Type="Critical"}
    New-Object -TypeName PSObject -Property @{Name="Engine #4"; Type="Critical"}
)

$Navigation = @(
    New-Object -TypeName PSObject -Property @{Name="NAV #1 ->"; Type="Warning"}
)


Function BuildPanel {
    [cmdletbinding()]  
    param(
        [Array] $Name
    )

    $HowManySpaces = 1
    $SpaceBetween = 2

    # First Row
    foreach($Element in $Name) {
        $StringLength = $Element.Name.Length
        <#
            ==========================================
                Start tag
            ==========================================
        #>
        for ($I = 1; $I -le $SpaceBetween; $I++) {
            Write-Host(" ") -NoNewline
        }

        # Create the first top row
        for ($I = 0; $I -le $StringLength+$HowManySpaces+2; $I++) {
            Write-Host("-") -NoNewline
        }
        
        for ($I = 1; $I -le $SpaceBetween; $I++) {
            Write-Host(" ") -NoNewline
        }
    }

    # New Line
    Write-Host("")
    
    
    # Second Row
    foreach($Element in $Name) {
        # String Length
        $StringLength = $Element.Name.Length

        # Spaces
        for ($I = 1; $I -le $SpaceBetween; $I++) {
            Write-Host(" ") -NoNewline
        }
        
        # Separator
        Write-Host("|") -NoNewline
        
        for ($I = 1; $I -le $HowManySpaces; $I++) {
            Write-Host(" ") -NoNewline
        }
        
        # Write the Name
        Switch($Element.Type) {
            'OK' {
                Write-Host("$($Element.Name)") -NoNewline -ForegroundColor Green
            }

            'Warning' {
                Write-Host("$($Element.Name)") -NoNewline -ForegroundColor Yellow
            }

            'Critical' {
                Write-Host("$($Element.Name)") -NoNewline -ForegroundColor Red
            }
        }
            
        for ($I = 1; $I -le $HowManySpaces; $I++) {
            Write-Host(" ") -NoNewline
        }

        Write-Host("|") -NoNewline
        
        for ($I = 1; $I -le $SpaceBetween; $I++) {
            Write-Host(" ") -NoNewline
        }
    }
    
    Write-Host("")
    # Third Row
    foreach($Element in $Name) {
        $StringLength = $Element.Name.Length
        <#
            ==========================================
                Start tag
            ==========================================
        #>
        for ($I = 1; $I -le $SpaceBetween; $I++) {
            Write-Host(" ") -NoNewline
        }

        # Create the first top row
        for ($I = 0; $I -le $StringLength+$HowManySpaces+2; $I++) {
            Write-Host("-") -NoNewline
        }
        
        for ($I = 1; $I -le $SpaceBetween; $I++) {
            Write-Host(" ") -NoNewline
        }
    }

    Write-Host("")
}

BuildPanel -Name $Engines
BuildPanel -Name $Navigation
