;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Autohotkey Capslock Remapping Script 
; - Deactivates capslock for normal (accidental) use.
; - Access the following functions when pressing Capslock: 
    
    ;Navigation Keys :-

    ;	Up             - k
    ;	Down           - j 
    ;	Left           - h
    ;	Right          - l
    ;	Home           - n
    ;	End            - ;
    ;	Enter          - m


    ;Esc                - CapsLock only

    ;CapsLock           - Space

    ;BackSpace 	        - Alt + h

    
    ;Text Editing :-

    ;	Select All 		- a
    ;	Copy			- c
    ; 	Cut 			- x
    ;	Paste 			- v



#Persistent
SetCapsLockState, AlwaysOff

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; If window title has GVIM

SetTitleMatchMode, 2
#IfWinActive GVIM


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Escape Key
; Capslock only, Send Escape

;CapsLock::Send, {ESC}

; Author: fwompner gmail com
#InstallKeybdHook
SetCapsLockState, alwaysoff
Capslock::
Send {LControl Down}
KeyWait, CapsLock
Send {LControl Up}
if ( A_PriorKey = "CapsLock" )
{
    Send {Esc}
}
return









#IfWinNotActive GVIM


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Navigation Keys 
; Capslock + hjkl (left, down, up, right)

Capslock & h:: 
GetKeyState, state, Alt
if state = D
Send, {BackSpace}
else {
	Send, {Left}
}
Return 


Capslock & j::Send {Blind}{Down DownTemp}
Capslock & j up::Send {Blind}{Down Up}

Capslock & k::Send {Blind}{Up DownTemp}
Capslock & k up::Send {Blind}{Up Up}

Capslock & l::Send {Blind}{Right DownTemp}
Capslock & l up::Send {Blind}{Right Up}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Home and End keys
; Capslock + n (home, end)

Capslock & n::SendInput {Blind}{Home Down}
Capslock & n up::SendInput {Blind}{Home Up}

Capslock & `;::SendInput {Blind}{End Down}
Capslock & `; up::SendInput {Blind}{End Up}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Toggle CapsLock
; CapsLock + Space :: Toggles CapsLock 

Capslock & Space::
If GetKeyState("CapsLock", "T") = 1
    SetCapsLockState, AlwaysOff
Else 
    SetCapsLockState, AlwaysOn
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Escape Key
; Capslock only, Send Escape

CapsLock::Send, {ESC}
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Select All, Cut , Copy and Paste
; Capslock + axcv

Capslock & a::SendInput {Ctrl Down}{a Down}
Capslock & a up::SendInput {Ctrl Up}{a Up}

Capslock & x::SendInput {Ctrl Down}{x Down}
Capslock & x up::SendInput {Ctrl Up}{x Up}

Capslock & c::SendInput {Ctrl Down}{c Down}
Capslock & c up::SendInput {Ctrl Up}{c Up}

Capslock & v::SendInput {Ctrl Down}{v Down}
Capslock & v up::SendInput {Ctrl Up}{v Up}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Enter Key
; Capslock + m

CapsLock & m::Send, {Enter}


^0::#space

;return









;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; UNUSED CODE


; For navigation 

;Capslock & h::Send {Blind}{Left DownTemp}
;Capslock & h up::Send {Blind}{Left Up}
