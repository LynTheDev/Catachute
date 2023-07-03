extends Control


var game_paused := false


func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		game_paused = not game_paused
		visible = not visible

		if Glob.mouse_hide:
			if game_paused:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
			else:
				Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);

		get_tree().paused = not get_tree().paused


func _on_resume_button_pressed():
	$SFXPlayerSpecial.play()
	visible = not visible

	game_paused = false
	if Glob.mouse_hide:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);

	get_tree().paused = not get_tree().paused



func _on_back_to_menu_button_pressed():
	$SFXPlayerSpecial.play()
	await $SFXPlayerSpecial.finished
	
	get_tree().paused = false
	
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

