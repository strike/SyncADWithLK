﻿<#
    .DESCRIPTION
       

    .AUTHOR    Zubarev Alexander aka Strike (av_zubarev@guu.ru)
    .COMPANY   State University of Management aka GUU

    .LINK
       http://...
#>

$LocalDir = $MyInvocation.MyCommand.Definition | split-path -parent
. $LocalDir\Import-AllRun.ps1


Log-Set -Service "SetADPatch" -Url $C.dashing.url -Token $C.dashing.token 
Log-Begin

# yesterday
$Date = (Get-Date).AddDays(-1).ToString($C.patch.filedataformat)
$FileName = "$($C.patch.folder)\$Date.adpatch"
$Lines = Get-Content $FileName


foreach ($Line in $Lines) {
    Log("$($Lines.IndexOf($Line)+1) of $($Lines.count): $Line")        
    Invoke-Expression $Line
}

Log-End
