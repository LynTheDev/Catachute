extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if not get_node("/root/Glob/MusicPlayer").is_playing():
		get_node("/root/Glob/MusicPlayer").play()
	Save.load_game()


func _on_quit_button_pressed():
	$SFXPlayer.play()
	await $SFXPlayer.finished
	
	get_tree().quit()


func _on_play_button_pressed():
	$SFXPlayer.play()
	Trans.switch_anim("res://Scenes/Game.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Options.tscn")


func _on_shop_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Shop.tscn")
