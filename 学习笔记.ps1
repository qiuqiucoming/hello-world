#在git上打开对应目录，当存在多个git库时，不用一一打开
start-process D:\softwares\Git\git-bash.exe -WorkingDirectory D:\Documents

#以特权用户权限开启powershell
Start-Process powershell -Verb runas

#启动cmd执行命令，但是注意argumentlist后面要加“/k”表示执行后不用关闭窗口
Start-Process -FilePath "$env:ComSpec" -ArgumentList "/k",  "dir d:\documents"
#或者用/c表示立即关闭，当然如果进程没有结束则不会关闭如
Start-Process -FilePath "$env:ComSpec" -ArgumentList "/c",  "D:\softwares\Git\git-bash.exe"

#用来查看这个object的所有属性,当然可以是某一个属性
Select-Object *

#用来查看这个对象的所有属性方法等等
Get-Member

#从此刻开始记录你的所有命令以及输出，当然可以指定你要输出的文件所在的文件夹
Start-Transcript
#停止记录
Stop-Transcript

#查看你的所有驱动盘
Get-PSDrive

#用来过滤你的对象
Where-Object
#在管道后面来表示对象的符号
$_
Get-PSDrive | Where-Object {$_.Free -gt 1}#举例，其中-gt表示greater than，该用例用来筛选出存储剩余空间大于1bit的驱动盘
#当然处理$_之外还可以有其他方式
Get-ChildItem | Where-Object -Property Name -Like -Value "*init*"

#和where-object一样，一般和通道结合，用来对每一个对象做同样的操作
ForEach-Object

#用来输出一些你想打印的东西，按照你想要的格式包括颜色
write-host -ForegroundColor

#一个很好用的小函数{0:N0}，可以控制输出的数字，例如输出百分制，或者小数后多少位等等
"{0:N2}" -f num

#一种特殊的循环方式,第一个括号运行一次，相当于for的初始化，第二个括号循环，循环次数就是通道的对象个数，
#第三个括号相当于结束，运行一次
Get-PSDrive | ForEach-Object {}{}{}

#下面两条语句的区别，一个是输出当前文件夹的属性,另一个是输出该文件夹的子文件及文件夹的属性
Get-Item
Get-ChildItem
Get-ChildItem -Attributes !directory

#对于拷贝命令注意-recurse这个选项的使用，不然可能会有文件根本就没有被拷贝，仅仅可能只拷贝了该目录
Copy-Item -Recurse

#字符串
#特别有意思很方便的方法contain和replace
Get-ChildItem | Where-Object {$_.Name.Contains("init")}
Get-ChildItem | Where-Object {$_.Name.Contains("init")} | ForEach-Object {$_.Name.Replace("init", "wow")}
#下面这个rename-item实现了同样的修改文件名的功能
Get-ChildItem | Where-Object {$_.Name.Contains("init")} | ForEach-Object {Rename-Item $_ -NewName $_.Name.Replace("init", "wow")}
#substring切割字符
$cow.Substring(3)
$cow.Substring(3,6)
$cow.TrimStart("shane")#举一反三

#write-host输出到文件
Write-Host "****" | Out-File log.txt
"***" | Out-File log.txt
Write-Error
Write-Warning

#读取输入
$var = Read-Host "what is your num?"

#获取与variable有关的命令
Get-Command -Noun variable