<#
#>
function Copy-Files {
    [cmdletbinding()]
    param(
        [parameter(
            Mandatory         = $false,
            ValueFromPipeline = $true)]
        [String[]]$fileList,
        [parameter(mandatory=$true)]        
        [string]$path,
        [parameter(mandatory=$true)]
        [string]$destination        
    )
    Process {

        if($null -eq $fileList)
        {
            $a = Get-childitem -Path $path -Recurse -File
            $fileList = @()
            foreach ($file in $a) {
                $rp = [System.IO.Path]::GetRelativePath($path, $file)
                Write-Verbose $rp
                $fileList += $rp
            }
        }

        ForEach ($file in $fileList) {
            $fullSrcPath = Join-Path -Path $path -ChildPath $file
            $fullDestPath = Join-Path -Path $destination -ChildPath $file
    
            $destFolder = Split-Path -Path $fullDestPath
    
            if(-not (test-path -path $destFolder))
            {
                new-item -ItemType Directory $destFolder
            }
    
            Copy-Item -Path $fullSrcPath -Destination $fullDestPath    
        }
    }    
}

Write-Host "FlexiCopy loaded."