	; Sets the current enum value to 0 so that the next constant set with "enumVariant" will be set to 0
	mac newEnum
enum_value set 0
	endm

	; Sets the current enum value to the macro argument so that the next constant set with "enumVariant" will be set to the argument value
	mac enumFrom
enum_value set {1}
	endm

	; Sets a constant to the current enum value then increments said value
	mac enumVariant
{1} = enum_value
enum_value set enum_value + 1
	endm