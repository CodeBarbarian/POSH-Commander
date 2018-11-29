<#Write-Host("
-----------
| Monitor |
-----------
")

#>

$Elements = @(
    New-Object -TypeName PSObject -Property @{Name="Nagios"; Type="OK"}
    New-Object -TypeName PSObject -Property @{Name="Monitor"; Type="Critical"}
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
            
        }
            Write-Host("$($Element.Name)") -NoNewline -ForegroundColor Green
        
        
        
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
<#
$ObjectLength = $Elements.Length
foreach($Element in $Elements) {
    $Element.Name
}
#>

BuildPanel -Name $Elements