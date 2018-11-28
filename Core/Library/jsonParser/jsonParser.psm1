class jsonParser { 

    [String] $ConfigFileDirectory = "..\..\Config"
    [Object] $FileContents = @()
    [String] $Filename

    <#
        Relative filename, why? Because it should know where to look for configuration files.
        But should this class only be used for this game, or should I make it usable for like everything..?
        That is the question though????
        
        This is the constructor though.
    #>
    jsonParser () {

    }

    setFilename([string] $Filename) {
        $this.Filename = $Filename
    }

    [String] getFilename() {
        return $this.Filename
    }

    [String] getFilePath() {
        return (Join-Path $this.ConfigFileDirectory "$($this.getFileName()).json")
    }

    [PSObject] readFile() {
        $Content = Get-Content -Path $this.getFilePath() | ConvertFrom-Json
        return $Content
    }

    writeFile([PSObject] $Contents) {

        $Contents = $Contents | ConvertTo-Json
        Add-Content -Path $this.getFilePath() -Value $Contents
    }
}