#NoEnv  ; 
; #Warn  ; 
SendMode Input  ; 
SetWorkingDir %A_ScriptDir%  ; 

Menu, Tray, Icon, shell32.dll, 44 ;

F6::
IfWinNotExist, ahk_class Music
	Run, D:\Music
GroupAdd, explorers, ahk_class Music ;
if WinActive("ahk_class D:\Music")
	WinActivate ahk_class Music ;
Return



F7::
IfWinNotExist, ahk_class Local Disk C
	Run, C:\
GroupAdd, explorers, ahk_class Local Disk C ;
if WinActive("ahk_class C:\")
	WinActivate ahk_class Local Disk C ;
Return



F8::
IfWinNotExist, ahk_class Local Disk D
	Run, D:\
GroupAdd, explorers, ahk_class Local Disk D ;
if WinActive("ahk_class D:\")
	WinActivate ahk_class Local Disk D ;
Return