@echo off
goto menu1
 
:menu1
@echo.
@echo.
@echo                ========================================
@echo.
@echo                             1.������������
@echo                             2.����vEthernet
@echo                             3.������������
@echo                             4.������������D-link
@echo                             5.�ֶ�����������
@echo.
@echo                ========================================
@echo.
@echo                        Ĭ��������������[ֱ�ӻس�]
@echo.                               
@echo                        ��ѡ��[1��2��3��4��5]

set num=1
set /p num=

IF %num%==1 (
set inter=WLAN
goto menu2)

IF %num%==2 (
set inter=vEthernet
goto menu2)

IF %num%==3 (
set inter=��̫��
goto menu2)

IF %num%==4 (
set inter=Wi-Fi 2
goto menu2)

IF %num%==5 (
@echo ������������
set /p inter=
goto menu2)

IF %nmu% NEQ 5 goto err1

exit

:err1
cls
goto menu1
exit
 


:menu2
@echo.
@echo.
@echo                ========================================
@echo.
@echo                          1. �Զ���ȡip��ַ
@echo                          2. �޸�ipΪ192.168.0.128
@echo                          3. �ֶ�����ip��ַ
@echo.
@echo                ========================================
@echo. 
@echo                      Ĭ���޸�ipΪ�Զ���ȡ[ֱ�ӻس�]
@echo.
@echo                      ��ѡ��[1��2��3]
 
set selc=1
set /p selc=

 
@echo ��������...
 
IF %selc%==1 goto DHCP
IF %selc%==2 goto ipstatic 
IF %selc%==3 goto ipsetting
IF %selc% NEQ 2 goto err2
exit
 
 
:err2
cls
goto menu2
exit
 
 
 
:DHCP
@echo.
@echo �Զ���ȡip��ַ
netsh int ip set add name="%inter%" source=dhcp
@echo �Զ���ȡDNS������
netsh int ip set dns name="%inter%" source=dhcp
@echo �Զ���ȡip��ַ�������
@echo.
@echo.
@pause
exit
 
 
 
:ipstatic
@echo ����Ϊ192.168.0.128
netsh int ip set add "%inter%" static 192.168.0.128 255.255.255.0 192.168.0.2 1
@echo ��������DNS��������8.8.8.8
netsh int ip set dns name="%inter%" source=static 8.8.8.8
netsh int ip add dns name="%inter%" 114.114.114.114 index=2
@echo ��̬ip�������
@echo.
@echo.
@pause
exit
 
 
:ipsetting
@echo �������ù̶�ip,���Ժ򡭡�
@echo.
@echo ������ip��ַ��
set /p ip=
@echo.
@echo.
@echo ���������أ�
set /p gw=
@echo.
netsh interface ip set address "%inter%" static %ip% 255.255.255.0 %gw% 1

@echo ��������ѡDNS��
set /p DNS1=
@echo.
@echo.
@echo �����뱸��DNS��
set /p DNS2=

netsh interface ip set dns name="%inter%" source=static %DNS1%
netsh int ip add dns name="%inter%" %DNS2% index=2
 
@echo ip��ַ�������
@echo.
@echo.
@pause
exit