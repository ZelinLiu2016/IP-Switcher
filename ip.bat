@echo off
set NAME="本地连接"  
set ADDR=59.78.26.246
set MASK=255.255.255.0
set GATEWAY=59.78.26.254
set DNS1=202.120.2.101
set DNS2=202.120.2.100

echo Please Choose:
echo 1 Static IP
echo 2 Dynamic IP
echo 3 Exit!
echo Choose and Press Enter:
set /p operate=
if %operate%==1 goto 1
if %operate%==2 goto 2
if %operate%==3 goto 3

:1
echo Setting IP Address, Pleas Wait......
echo IP Address = %ADDR%
echo Mask = %MASK%
echo Gateway = %GATEWAY%
netsh interface ipv4 set address name=%NAME% source=static addr=%ADDR% mask=%MASK% gateway=%GATEWAY% gwmetric=0 >nul
echo DNS = %DNS1%
netsh interface ipv4 set dns name=%NAME% source=static addr=%DNS1% register=PRIMARY >nul
echo BackUp DNS = %DNS2%
netsh interface ipv4 add dns name=%NAME% addr=%DNS2% index=2 >nul
echo Done!
pause
goto 3

:2
echo Setting IP Address, Please Wait......
echo Getting IP From DHCP......
netsh interface ip set address "本地连接" dhcp
echo Getting DNS from DHCP......
netsh interface ip set dns "本地连接" dhcp
echo Done!
pause
goto 3

:3
exit