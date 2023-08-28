	newEnum
	enumVariant GAMESTATE_INGAME                                 ; No script, should be 0
	;enumVariant SUSPENDED_SCRIPT_RESUME_ON_TICK   ; Resume the suspended script during the next tick
	enumVariant GAMESTATE_SCRIPT_RESUME_AFTER_TICK_AND_ON_ACTION ; Set to GAMETSATE_SCRIPT_RESUME_ON_ACTION after tick
	enumVariant GAMETSATE_SCRIPT_RESUME_ON_ACTION                ; Resume the suspended script on the next tick that the action button is pressed