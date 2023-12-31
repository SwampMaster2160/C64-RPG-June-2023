; x: Entity
; y: Tile event

dummy_interacted_with subroutine
	rts

wall_gate_interacted_with subroutine
	; Push x since we don't need to know what entity is interacting with the gate
	txa
	pha
	; Make map_heap+x point to the extra bytes for the event
	lda tile_event_extra_bytes,y
	tax
	; Return if the gate is open
	lda map_heap,x
	jsr is_plot_completion_flag_set
	bne .end
	; Return if key has not been collected
	lda #PLOT_COMPLETION_FLAG_GOT_GATE_KEY
	jsr is_plot_completion_flag_set
	beq .no_key
	; Make map_heap+x point to the extra bytes for the event
	lda tile_event_extra_bytes,y
	tax
	; Set gate as open
	lda map_heap,x
	jsr set_plot_completion_flag
	; Make map_heap+x point to the extra bytes for the event
	lda tile_event_extra_bytes,y
	tax
	; Change gate tile to a path tile
	lda map_heap+1,x
	tax
	lda #METATILE_DIRT_PATH_HORIZONTAL
	sta map_metatiles,x
	lda #1
	sta does_map_need_redraw
	; Print text
	lda #<gate_opened_script
	sta script_address
	lda #>gate_opened_script
	sta script_address+1
	jsr execute_script
	; Restore x and return
.end
	pla
	tax
	rts
.no_key
	; Print text
	lda #<gate_no_key_script
	sta script_address
	lda #>gate_no_key_script
	sta script_address+1
	jsr execute_script
	jmp .end

fallen_tree_interacted_with subroutine
	; Return if the tree has been removed
	lda plot_completion_flags+[PLOT_COMPLETION_FLAG_REMOVED_MIDLAND_PATH_0_FALLEN_TREE/8]
	and #1<<(PLOT_COMPLETION_FLAG_REMOVED_MIDLAND_PATH_0_FALLEN_TREE%8)
	bne .end
	; Return if the weak axe has not been collected
	lda plot_completion_flags+[PLOT_COMPLETION_FLAG_GOT_WEAK_AXE/8]
	and #1<<(PLOT_COMPLETION_FLAG_GOT_WEAK_AXE%8)
	beq .no_axe
	lda #0
	; Set tree as cleared
	lda plot_completion_flags+[PLOT_COMPLETION_FLAG_REMOVED_MIDLAND_PATH_0_FALLEN_TREE/8]
	ora #1<<(PLOT_COMPLETION_FLAG_REMOVED_MIDLAND_PATH_0_FALLEN_TREE%8)
	sta plot_completion_flags+[PLOT_COMPLETION_FLAG_REMOVED_MIDLAND_PATH_0_FALLEN_TREE/8]
	; Change gate tile to a path tile
	lda #METATILE_GRASS
	sta map_metatiles+2*10+4
	lda #1
	sta does_map_need_redraw
	; Print text
	lda #<fallen_tree_cleared_script
	sta script_address
	lda #>fallen_tree_cleared_script
	sta script_address+1
	jsr execute_script
	; Return
.end
	rts
.no_axe
	; Print text
	lda #<fallen_tree_no_axe_script
	sta script_address
	lda #>fallen_tree_no_axe_script
	sta script_address+1
	jsr execute_script
	jmp .end

choppable_tree_interacted_with subroutine
	; Push x since we don't need to know what entity is interacting with the gate
	txa
	pha
	; Make map_heap+x point to the extra bytes for the event
	lda tile_event_extra_bytes,y
	tax
	; Return if the tree is chopped
	lda map_heap,x
	jsr is_plot_completion_flag_set
	bne .end
	; Return if axe has not been collected
	lda #PLOT_COMPLETION_FLAG_GOT_AXE
	jsr is_plot_completion_flag_set
	beq .no_axe
	; Make map_heap+x point to the extra bytes for the event
	lda tile_event_extra_bytes,y
	tax
	; Set tree as chopped
	lda map_heap,x
	jsr set_plot_completion_flag
	; Make map_heap+x point to the extra bytes for the event
	lda tile_event_extra_bytes,y
	tax
	; Change gate tile to a path/grass tile
	lda map_id
	cmp #MAP_MONEY_BEACH_1
	beq .use_grass
	lda #METATILE_DIRT_PATH_VERTICAL
	jmp .not_grass
.use_grass
	lda #METATILE_GRASS
.not_grass
	pha
	lda map_heap+1,x
	tax
	pla
	sta map_metatiles,x
	lda #1
	sta does_map_need_redraw
	; Print text
	lda #<tree_chopped_script
	sta script_address
	lda #>tree_chopped_script
	sta script_address+1
	jsr execute_script
	; Restore x and return
.end
	pla
	tax
	rts
.no_axe
	; Print text
	lda #<choppable_tree_no_axe_script
	sta script_address
	lda #>choppable_tree_no_axe_script
	sta script_address+1
	jsr execute_script
	jmp .end

deep_river_interacted_with subroutine
	; Push x since we don't need to know what entity is interacting with the gate
	txa
	pha
	; Make map_heap+x point to the extra bytes for the event
	lda tile_event_extra_bytes,y
	tax
	; Return if the river has been shallowed
	lda map_heap,x
	jsr is_plot_completion_flag_set
	bne .end
	; Return if key has not been collected
	lda #PLOT_COMPLETION_FLAG_GOT_SHOVEL
	jsr is_plot_completion_flag_set
	beq .no_shovel
	; Make map_heap+x point to the extra bytes for the event
	lda tile_event_extra_bytes,y
	tax
	; Set river as shallowed
	lda map_heap,x
	jsr set_plot_completion_flag
	; Make map_heap+x point to the extra bytes for the event
	lda tile_event_extra_bytes,y
	tax
	; Change metatile and metatile below to be shallow water
	lda map_heap+1,x
	tax
	lda #METATILE_SHALLOW_WATER
	sta map_metatiles,x
	lda tile_event_extra_bytes,y
	tax
	lda map_heap+1,x
	clc
	adc #10
	tax
	lda #METATILE_SHALLOW_WATER
	sta map_metatiles,x
	lda #1
	sta does_map_need_redraw
	; Print text
	lda #<river_shallowed_script
	sta script_address
	lda #>river_shallowed_script
	sta script_address+1
	jsr execute_script
	; Restore x and return
.end
	pla
	tax
	rts
.no_shovel
	; Print text
	lda #<river_no_shovel_script
	sta script_address
	lda #>river_no_shovel_script
	sta script_address+1
	jsr execute_script
	jmp .end

broken_bridge_interacted_with subroutine
	; Return if the bridge has been repaired
	lda plot_completion_flags+[PLOT_COMPLETION_FLAG_REPAIRED_BRIDGE/8]
	and #1<<(PLOT_COMPLETION_FLAG_REPAIRED_BRIDGE%8)
	bne .end
	; Return if the bridge repair kit has not been collected
	lda plot_completion_flags+[PLOT_COMPLETION_FLAG_GOT_BRIDGE_REPAIR_KIT/8]
	and #1<<(PLOT_COMPLETION_FLAG_GOT_BRIDGE_REPAIR_KIT%8)
	beq .no_bridge_repair_kit
	lda #0
	; Repair bridge
	lda plot_completion_flags+[PLOT_COMPLETION_FLAG_REPAIRED_BRIDGE/8]
	ora #1<<(PLOT_COMPLETION_FLAG_REPAIRED_BRIDGE%8)
	sta plot_completion_flags+[PLOT_COMPLETION_FLAG_REPAIRED_BRIDGE/8]
	; Change gate tile to a path tile
	lda #METATILE_BOARDWALK_HORIZONTAL
	sta map_metatiles+2*10+0
	lda #1
	sta does_map_need_redraw
	; Print text
	lda #<bridge_repaired_script
	sta script_address
	lda #>bridge_repaired_script
	sta script_address+1
	jsr execute_script
	; Return
.end
	rts
.no_bridge_repair_kit
	; Print text
	lda #<no_bridge_repair_kit_script
	sta script_address
	lda #>no_bridge_repair_kit_script
	sta script_address+1
	jsr execute_script
	jmp .end