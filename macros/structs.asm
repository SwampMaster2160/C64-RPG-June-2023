	mac mapExtraData
	byte {1} | ({2} << 4), {3} | ({4} << 4), {5}, {6}, {7}, {8}
	word {9}
	byte 0, 0, 0, 0, 0, 0
	endm

	mac tileExtraData
	byte {1} | {5} << 4, {2}, {3}, {4}
	endm

	mac entityData
	byte {1}, {2}, {3}, {4}, {5}, 0
	word {6}
	endm