# Overview
FlexiCopy copy selective files from a path into the destination. The copy operation will follow the folder structure from the source path.
As contrast to *Copy-Item* built-in in Powershell (which recursively copy everthing), you can be selective for what files you want to copy.


# Install Step
1. Run **$Env:PSModulePath** to find out where is the powershell module path.
2. Copy **FlexiCopy** folder into one of the module path.
3. In Powershell console, run **import-module FlexiCopy** to load the module.

# Using FlexiCopy
Run Copy-Files -path \<sourceFolder\> -destination \<destinationFolder\> -fileList \<file list\>  
-path: Base directory of folder where you want to copy from.  
-destination: Base directory of folder where you want to copy to.  
-fileList: Files you want to copy. The file list can contain path relative to the *-path*.

# Example
Sample of file list to copy (file.txt)
```text
folder1\file1.txt
folder2\file2.txt
folder2\subfolder2a\file3.txt
```
```Powershell
Get-Content -Path file.txt | Copy-Files -path c:\source -destination c:\destination
```


# Reference
https://learn.microsoft.com/en-us/powershell/scripting/developer/module/how-to-write-a-powershell-script-module?view=powershell-7.2  
