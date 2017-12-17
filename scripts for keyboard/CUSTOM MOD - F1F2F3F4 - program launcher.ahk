#NoEnv  ; 
; #Warn  ; 
SendMode Input  ; 
SetWorkingDir %A_ScriptDir%  ; 
Menu, Tray, Icon, shell32.dll, 16 ;
#singleinstance force ;



;You will want to tailor this script to launch your own most commonly used applications.
;You can use Window Spy (it comes with autohotkey) to figure out the ahk_exe and ahk_class of your applications.




#IfWinActive 



F1::
IfWinNotExist, ahk_class Task Manager
    Run, taskmgr.exe
WinActivate ("ahk_exe taskmgr.exe")
Return



;F1 holds the "BACK" script.

if WinActive("ahk_class MozillaWindowClass")
	Send ^+{tab} ;CTRL SHIFT TAB is the shortcut for "go to previous tab"
if WinActive("ahk_class Chrome_WidgetWin_1")
	Send ^+{tab}
if WinActive("ahk_class Notepad++")
	Send ^+{tab}
if WinActive("ahk_exe Adobe Premiere Pro.exe")
	Send {F12} ;F12 is my shortcut in premiere for "go back"(in bins)
if WinActive("ahk_exe explorer.exe")
	Send !{left} ;ALT LEFT is the explorer shortcut to go "back" or "down" one folder level.
Return


F2::
IfWinNotExist, ahk_class CabinetWClass
	Run, explorer.exe
GroupAdd, taranexplorers, ahk_class CabinetWClass ;You have to make a new group for each application, don't use the same one for all of them!
if WinActive("ahk_exe explorer.exe")
	GroupActivate, taranexplorers, r
else
	WinActivate ahk_class CabinetWClass ;you have to use WinActivatebottom if you didn't create a window group.
Return


F3::
IfWinNotExist, ahk_class Chrome_WidgetWin_1
	Run, chrome.exe
if WinActive("ahk_class Chrome_WidgetWin_1")
	Send ^{tab}
else
	WinActivate ahk_class Chrome_WidgetWin_1
Return



F4::
IfWinNotExist, ahk_class Calculator
    Run, calc.exe
WinActive ("ahk_exe Calculator")
Return


