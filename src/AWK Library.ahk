

;;
;; Wrapper Functions for Fn Sequences
;;

FnKey(NormalAction, FnAction, FnActionIsDefault = false)
{
	global FnKeyPressed
    SetKeyDelay, -1
    if (FnKeyPressed = FnActionIsDefault) {
		Send {Blind}%NormalAction%
	} else {
		Send {Blind}%FnAction%
	}
}

FnKeyCall(NormalAction, FnActionCall, FnArgs = "", FnActionIsDefault = false)
{
	global FnKeyPressed
    SetKeyDelay, -1
    if (FnKeyPressed = FnActionIsDefault) {
		Send {Blind}%NormalAction%
	} else {
        %FnActionCall%(FnArgs)
	}
}


;;
;; Wrapper Functions for Optional Features
;;

PreferenceKeyDown(normalKey, pref, prefKey) {
	global
	SetKeyDelay, -1
	if (%pref%) {
		Send {Blind}{%prefKey% Down}
	} else {
		Send {Blind}{%normalKey% Down}
	}
}

PreferenceKeyUp(normalKey, pref, prefKey) {
	global
	SetKeyDelay, -1
	if (%pref%) {
		Send {Blind}{%prefKey% Up}
	} else {
		Send {Blind}{%normalKey% Up}
	}
}

PreferenceKeyFnDown(normalKey, pref) {
	global
	SetKeyDelay, -1
	if (%pref%) {
		FnKeyPressed := true
	} else {
		Send {Blind}%normalKey%
	}
}

PreferenceKeyFnUp(normalKey, pref) {
	global
	SetKeyDelay, -1
	if (%pref%) {
		FnKeyPressed := false
	} else {
		Send {Blind}%normalKey%
	}
}

;;
;; Brightness Key Support
;; 

BrightnessUp(dummyVar="") {
	Run, lcd up, , Hide
}

BrightnessDown(dummyVar="") {
	Run, lcd down, , Hide
}

;;
;; Volume Helpers
;;

VolumeMute(dummyVar="") {
    Send {Volume_Mute}
}

VolumeDown(dummyVar="") {
	Send {Volume_Down}
}

VolumeUp(dummyVar="") {
	Send {Volume_Up}
}

ActiveWindowIsAMediaPlayer() {
	SetTitleMatchMode RegEx
	IfWinActive, ^Windows Media Player$
		Return true
	IfWinActive, ahk_class iTunes
		Return true
	IfWinActive, ahk_class MediaPlayerClassicW
		Return true
	Return false
}

;;
;; Media Key Support
;;

MediaCommandPrev(dummyVar="") {
    if (ActiveWindowIsAMediaPlayer()) {
		GoTo SendMediaCommandPrev
	}
	
	IfWinExist, ahk_class iTunes
	{
		ControlSend, ahk_parent, ^{Left}^{Left}
		return
	}
	
	SendMediaCommandPrev:
		Send, {Media_Prev}
}

MediaCommandPlay(dummyVar="") {
    if (ActiveWindowIsAMediaPlayer()) {
		GoTo SendMediaCommandPlay
	}
	
	IfWinExist, ahk_class iTunes
	{
		ControlSend, ahk_parent, ^{Space}
		return
	}
	
	SendMediaCommandPlay:
		Send, {Media_Play_Pause}
}

MediaCommandNext(dummyVar="") {
    if (ActiveWindowIsAMediaPlayer()) {
		GoTo SendMediaCommandNext
	}
	
	IfWinExist, ahk_class iTunes
	{
		ControlSend, ahk_parent, ^{Right}
		return
	}
	
	SendMediaCommandNext:
		Send, {Media_Next}
}

