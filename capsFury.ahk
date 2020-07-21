;
;
;		DESCRIPTION
;
;
;(As a laptop user, this also allows me to disable my trackpad most of the time so I can rest my hands more comfortably.)
;
;Once you hit Caps Lock, here's what the following keys will transform to:
;
;i: Up Arrow
;k: Down Arrow
;j: Right Arrow
;l: Left Arrow
;(Shift and Control both work with the arrow keys also.)
;
;Alt + i: Page Up
;Alt + k: Page Down
;Alt + j: Home
;Alt + l: End
;(Again, Shift and Control will also work as additional modifiers.)
;
;Windows + j: Alt + Left
;Windows + l: Alt + Right
;(To replace the lost ability of using Alt + Left/Right as shortcuts for Back/Forward.)
;
;h: Enter
;u: Tab
;o: Backspace
;p: Delete
;[: Escape
;m: Copy
;,: Paste
;.: Cut
;
;y: AppsKey
;Shift + o: Alt + Left
;Shift + p: Alt + Right
;/: Windows key
;(Again, Alt and Control work as modifiers.)
;
;For the right hand/cursor controls:
;a: Left Click
;q: Right Click
;z: Middle Click
;
;e: Cursor Up
;d: Cursor Down
;s: Cursor Left
;f: Cursor Right
;w: Cursor Up-Left
;r: Cursor Up-Right
;x: Cursor Down-Left
;v: Cursor Down-Right
;
;t: Mouse Wheel Up
;g: Mouse Wheel Down
;
;(For jumping the cursor around even faster: currently calibrated for 1920x1080.)
;
;Shift + w: Move cursor to 300, 150
;Shift + e: Move cursor to 975, 150
;Shift + r: Move cursor to 1600, 150
;Shift + s: Move cursor to 300, 540
;Shift + d: Move cursor to 975, 540
;Shift + f: Move cursor to 1600, 540
;Shift + x: Move cursor to 300, 900

;Shift + c: Move cursor to 975, 900
;Shift + v: Move cursor to 1445, 900
;
;As my code is cobbled together, I'd appreciate any feedback on how to improve it.
;
;In particular, there is one strange phenomenon: when I have CapsLock on and use the re-mapped arrow keys (j,k,l,i), the CapsLock light blinks. This happens on external keyboards also.When I use the cursor control keys (a,s,d,f,e), the light doesn't blink. It also doesn't blink if I'm using Caps Lock without this script running.
;
;Another thing I'd like to include is the ability to scroll the mouse wheel right with the keyboard, but MouseClick, WheelLeft/Right doesn't seem to work.
;
;Enjoy never moving your hands from your keyboard again!








;The next section is adapted from JKL Mouse: http://www.jklmouse.com/
;For some reason, it only works when I break it up into two sections.
;The other section for the mouse is at the end.

CoordMode, Mouse, Screen
#SingleInstance force
SetRegView, 64
regKeySettings := "Software\JKLmouse"
accelerate := RegReadValue( "Accelerate", 1 )
keysLeft := RegReadValue( "KeysLeft", "ESDF" )

; Remove forced delay between triggered mouse events.
; TODO: experiment with this when accelerated
SetMouseDelay, -1
; Hotkey repeat count for acceleration
repeat := 0

Hotkey, e, MouseUp
Hotkey, e UP, StopAcceleration, On
Hotkey, w, MouseUpLeft
Hotkey, w UP, StopAcceleration, On
Hotkey, r, MouseUpRight
Hotkey, r UP, StopAcceleration, On
Hotkey, s, MouseLeft
Hotkey, s UP, StopAcceleration, On
Hotkey, d, MouseDown
Hotkey, d UP, StopAcceleration, On
Hotkey, f, MouseRight
Hotkey, f UP, StopAcceleration, On
Hotkey, x, MouseDownLeft
Hotkey, x UP, StopAcceleration, On
Hotkey, v, MouseDownRight
Hotkey, v UP, StopAcceleration, On

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%

;Here are the toggle for Caps Lock State - I put in a second one (Alt + /) that I can activate with just my right hand.
;I toggle the CapsLockState also so that the light on CapsLock will indicate when it is on or off.

CapsLock::
 if (toggle=1) {
  toggle=0
  SetCapsLockState, Off
 }
 else {
  toggle=1
  SetCapsLockState, On
 }
Return

!/::
 if (toggle=1) {
  toggle=0
  SetCapsLockState, Off
 }
 else {
  toggle=1
  SetCapsLockState, On
 }
Return


#If (toggle=1)
i::Send,{Up}
+i::Send,+{Up}
^i::Send,^{Up}
+^i::Send,^+{Up}
k::Send,{Down}
+k::Send,+{Down}
^k::Send,^{Down}
+^k::Send,+^{Down}
l::Send,{Right}
+l::Send,+{Right}
^l::Send,^{Right}
+^l::Send,+^{Right}
j::Send,{Left}
+j::Send,+{Left}
^j::Send,^{Left}
+^j::Send,+^{Left}

#l::Send,!{Right}
#j::Send,!{Left}

!i::Send,{PgUp}
!+i::Send,+{PgUp}
!^i::Send,^{PgUp}
!+^i::Send,^+{PgUp}
!k::Send,{PgDn}
!+k::Send,+{PgDn}
!^k::Send,^{PgDn}
!+^k::Send,+^{PgDn}
!l::Send,{End}
!+l::Send,+{End}
!^l::Send,^{End}
!+^l::Send,+^{End}
!j::Send,{Home}
!+j::Send,+{Home}
!^j::Send,^{Home}
!+^j::Send,+^{Home}


m::^c
,::^v
.::^x


o::Send,{BackSpace}
^o::Send,^{BackSpace}
!o::Send,!{BackSpace}
p::Send,{Delete}
^p::Send,^{Delete}
!p::Send,!{Delete}
h::Send,{Enter}
!h::Send,!{Enter}
^h::Send,^{Enter}
u::Send,{Tab}
+u::Send,+{Tab}
^u::Send,^{Tab}
!u::Send,!{Tab}
+^u::Send,+^{Tab}
+!u::Send,+!{Tab}
y::AppsKey
+o::Send,!{Left}
+p::Send,!{Right}
[::Send,{Esc}
/::LWin

;The rest of the mouse code.

a::
   if (not GetKeyState("LButton", "P"))
    Click down
return
a UP::Click up
q::MouseClick, right 
g::MouseClick, WheelDown 
t::MouseClick, WheelUp 
z::MouseClick, middle
^t::MouseClick, WheelLeft
^g::MouseClick, WheelRight

+w::MouseMove, 300, 150
+e::MouseMove, 975, 150
+r::MouseMove, 1600, 150
+s::MouseMove, 300, 540
+d::MouseMove, 975, 540
+f::MouseMove, 1600, 540
+x::MouseMove, 300, 900
+c::MouseMove, 975, 900
+v::MouseMove, 1445, 900

; Read a string value from our settings registry key, or return otherwise if not present
RegReadValue( name, otherwise ) {
global regKeySettings
value := ""
RegRead, value, HKCU, %regKeySettings%, %name%
if( ErrorLevel )
return %otherwise%
return %value%
}

; Write a dword value to our settings registry key
RegWriteDword( name, value ) {
RegWriteValue( name, value, "REG_DWORD" )
}
; Write a string value to our settings registry key
RegWriteString( name, value ) {
RegWriteValue( name, value, "REG_SZ" )
}
; Write a value of a specific type to our settings registry key
RegWriteValue( name, value, type ) {
global regKeySettings
RegWrite, %type%, HKCU, %regKeySettings%, %name%, %value%
}


; Move the mouse the specifed x and y distances, both scaled by the
; mouse acceleration factor calculated from the key repeat count.
Move( x, y ) {
global accelerate, repeat
++repeat
factor := accelerate ? Floor( ( repeat + 3 ) / 2 ) : 1
x := x * factor
y := y * factor
MouseMove, x, y, 0, R
}
;ArrayJoin( sep, ary ) {
; for index, value in ary
; MsgBox % index
; ;str .= value . sep
; MsgBox % str
; return SubStr( str, 1, -StrLen(sep) )
;}
ToggleAccelerate() {
global accelerate
accelerate := ! accelerate
RegWriteDword( "Accelerate", accelerate )
action := accelerate ? "Check" : "Uncheck"
Menu, Tray, %action%, Acceleration
}
; Handle the keydown for each of the mouse movement directions
; TODO: Maybe a way to simplify this?
MouseUp:
Move( 0, -3 )
return
MouseDown:
Move( 0, 3 )
return
MouseLeft:
Move( -3, 0 )
return
MouseRight:
Move( 3, 0 )
return
MouseUpLeft:
Move( -3, -3 )
return
MouseUpRight:
Move( 3, -3 )
return
MouseDownLeft:
Move( -3, 3 )
return
MouseDownRight:
Move( 3, 3 )
return
; Handle the keyup for all hotkeys
StopAcceleration:
repeat = 0
return
