#SingleInstance Force

; Path to the DLL, relative to the script
VDA_PATH := A_ScriptDir "\VirtualDesktopAccessor.dll"
hVirtualDesktopAccessor := DllCall("LoadLibrary", "Str", VDA_PATH, "Ptr")

GetDesktopCountProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "GetDesktopCount", "Ptr")
GoToDesktopNumberProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "GoToDesktopNumber", "Ptr")
GetCurrentDesktopNumberProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "GetCurrentDesktopNumber", "Ptr")
IsWindowOnCurrentVirtualDesktopProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "IsWindowOnCurrentVirtualDesktop", "Ptr")
IsWindowOnDesktopNumberProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "IsWindowOnDesktopNumber", "Ptr")
MoveWindowToDesktopNumberProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "MoveWindowToDesktopNumber", "Ptr")
IsPinnedWindowProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "IsPinnedWindow", "Ptr")
GetDesktopNameProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "GetDesktopName", "Ptr")
SetDesktopNameProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "SetDesktopName", "Ptr")
CreateDesktopProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "CreateDesktop", "Ptr")
RemoveDesktopProc := DllCall("GetProcAddress", "Ptr", hVirtualDesktopAccessor, "AStr", "RemoveDesktop", "Ptr")


GoToDesktopNumber(num) {
    global GoToDesktopNumberProc
    DllCall(GoToDesktopNumberProc, "Int", num, "Int")
    return
}

MoveWindowToDesktop(window, desktopNumber) {
    global MoveWindowToDesktopNumberProc
    DllCall(MoveWindowToDesktopNumberProc, "Ptr", window, "Int", desktopNumber, "Int")
}

MoveCurrentWindowToDesktop(desktopNumber) {
    global MoveWindowToDesktopNumberProc
    WinGet, activeWindow, ID, A
    moveWindowToDesktop(activeWindow, desktopNumber)
}

GetWindow(name) {
    SetTitleMatchMode, 2
    DetectHiddenWindows On
    WinGet, window, ID, %name%
    return %window%
}

; Jump to desktops with alt+num
!1:: GoToDesktopNumber(0)
!2:: GoToDesktopNumber(1)
!3:: GoToDesktopNumber(2)
!4:: GoToDesktopNumber(3)
!5:: GoToDesktopNumber(4)
!6:: GoToDesktopNumber(5)
!7:: GoToDesktopNumber(6)
!8:: GoToDesktopNumber(7)
!9:: GoToDesktopNumber(8)
!0:: GoToDesktopNumber(9)

; Move the current window to the given desktop with ctrl+shift+num
^+1:: MoveCurrentWindowToDesktop(0)
^+2:: MoveCurrentWindowToDesktop(1)
^+3:: MoveCurrentWindowToDesktop(2)
^+4:: MoveCurrentWindowToDesktop(3)
^+5:: MoveCurrentWindowToDesktop(4)
^+6:: MoveCurrentWindowToDesktop(5)
^+7:: MoveCurrentWindowToDesktop(6)
^+8:: MoveCurrentWindowToDesktop(7)
^+9:: MoveCurrentWindowToDesktop(8)
^+0:: MoveCurrentWindowToDesktop(9)

; Move relevant windows to their relevant desktops
#^+s::
MoveWindowToDesktop(GetWindow("Ferdium"), 2)
MoveWindowToDesktop(GetWindow("Signal"), 2)
MoveWindowToDesktop(GetWindow("Discord"), 2)
MoveWindowToDesktop(GetWindow("Spotify"), 3)
MoveWindowToDesktop(GetWindow("Steam"), 4)
MoveWindowToDesktop(GetWindow("Xbox"), 4)
