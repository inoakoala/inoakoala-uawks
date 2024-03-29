;;
;; Media Keys {Apple Fn Key}-(F7, F8, F9)
;;

$F7::FnKeyCall("{F7}", "MediaCommandPrev", "", MediaControlsAreDefault)
$F8::FnKeyCall("{F8}", "MediaCommandPlay", "", MediaControlsAreDefault)
$F9::FnKeyCall("{F9}", "MediaCommandNext", "", MediaControlsAreDefault)


;;
;; Volume Controls {Apple Fn Key}-(F10, F11, F12)
;;

$F10::FnKeyCall("{F10}", "VolumeMute", "", VolumeControlsAreDefault)
$F11::FnKeyCall("{F11}", "VolumeDown", "", VolumeControlsAreDefault)
$F12::FnKeyCall("{F12}", "VolumeUp", "", VolumeControlsAreDefault)

;;
;; Brightness Controls {Apple Fn Key}-{F1, F2}
;;

$F1::FnKeyCall("{F1}", "BrightnessDown", "", BrightnessControlsAreDefault)
$F2::FnKeyCall("{F2}", "BrightnessUp", "", BrightnessControlsAreDefault)

;;
;; Project to a second screen
;;

$F3::FnKeyCall("{F3}", "MissionControl", "", MissionControlIsDefault)