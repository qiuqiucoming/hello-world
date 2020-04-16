#数组和foreach的使用
$Array = @()

$Process = Get-Process

foreach($proc in $Process) {
    if ($proc.WS/1mb -gt 100) {
        $Array += New-Object psobject -Property @{'processName' = $proc.name; 'workingSet' = $proc.ws}
    }
}
$Array | select 'processName','workingSet' | Export-Csv D:\Documents\powershell\file.csv -no
$Array | select 'processName','workingSet' | Export-Csv D:\Documents\powershell\file2.csv

$csvmport = @()

$csvmport = Import-Csv .\file.csv

foreach($dog in $csvmport) {Write-Host "process name:" $dog.processName "working set:" $dog.workingSet}

 $csvmport | Format-Table -AutoSize

 $csvmport[1].processName

 #if语句的使用
 #-eq equals
 #-lt less than
 #-gt grater than
 #-le less than or equal to
 #-ge greater than or equal to
$var = 1
if ($var -eq 1) 
    {Write-Host "the value is 1"} 
elseif ($var -eq 2)
    {Write-Host "the value is 2"}

#error是一个数组
if ($Error) {Write-Host "error is" $Error}
$Error.Clear()


#switch语句
$var = Read-Host "what is your num?"
switch(1, 2) {
    0 {"the value is 0"}
    1 {"the value is 1"; break}
    2 {"the value is 2"}
    default {"this is not a int value"}
}

$processes = Get-Process
foreach ($process in $processes) {
    switch ($process.ProcessName) {
        chrome {Write-Host "found chrome" -ForegroundColor Red}
        YourPhone {Write-Host "found phone" -ForegroundColor yellow}
    }
}

#美元符号的使用 
#注意在双引号和单引号中美元符号的区别
$cow = "wowow"
Write-Host "the variable is " $cow
Write-Host "the variable is $cow"
Write-Host 'the variable is $cow'