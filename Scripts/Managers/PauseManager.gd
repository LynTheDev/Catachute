extends Control


func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		visible = not visible
		get_tree().paused = not get_tree().paused


func _on_resume_button_pressed():
	$SFXPlayerSpecial.play()
	visible = not visible
	get_tree().paused = not get_tree().paused



func _on_back_to_menu_button_pressed():
	$SFXPlayerSpecial.play()
	await $SFXPlayerSpecial.finished
	
	get_tree().paused = false
	
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

