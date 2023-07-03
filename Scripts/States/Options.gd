extends Node2D

var is_active = false

var check_mark_active_spr = preload("res://Assets/Buttons/CheckMarkChecked.png")
var check_mark_idle_spr = preload("res://Assets/Buttons/CheckMarkIdle.png")


func _ready():
	$Version.text = "version: {0}".format({"0": Glob.version})
	$SFXPlayer.play()


func _process(_delta):
	if not ResourceLoader.exists("user://user_data.tres"):
		$"UIView/UI/DeleteSave".disabled = true
	else:
		$"UIView/UI/DeleteSave".disabled = false

	if $"UIView/UI/FullScreenCheck".is_pressed():
		$"UIView/UI/FullScreenCheck".texture_normal = check_mark_active_spr
	else:	
		$"UIView/UI/FullScreenCheck".texture_normal = check_mark_idle_spr
	
	if $"UIView/UI/CursorCheck".is_pressed():
		$"UIView/UI/CursorCheck".texture_normal = check_mark_active_spr
	else:	
		$"UIView/UI/CursorCheck".texture_normal = check_mark_idle_spr
	
	if $"UIView/UI/SoundLabel/MasterLabel/MasterMute".is_pressed():
		$"UIView/UI/SoundLabel/MasterLabel/MasterMute".texture_normal = check_mark_active_spr
	else:
		$"UIView/UI/SoundLabel/MasterLabel/MasterMute".texture_normal = check_mark_idle_spr
	
	if $"UIView/UI/SoundLabel/MusicLabel/MusicMute".is_pressed():
		$"UIView/UI/SoundLabel/MusicLabel/MusicMute".texture_normal = check_mark_active_spr
	else:
		$"UIView/UI/SoundLabel/MusicLabel/MusicMute".texture_normal = check_mark_idle_spr
	
	if $"UIView/UI/SoundLabel/SFXLabel/SFXMute".is_pressed():
		$"UIView/UI/SoundLabel/SFXLabel/SFXMute".texture_normal = check_mark_active_spr
	else:
		$"UIView/UI/SoundLabel/SFXLabel/SFXMute".texture_normal = check_mark_idle_spr
	
	if $"UIView/UI/SoundLabel/AmbienceLabel/AmbienceMute".is_pressed():
		$"UIView/UI/SoundLabel/AmbienceLabel/AmbienceMute".texture_normal = check_mark_active_spr
	else:
		$"UIView/UI/SoundLabel/AmbienceLabel/AmbienceMute".texture_normal = check_mark_idle_spr


	if DisplayServer.window_get_mode() == 3:
		$"UIView/UI/FullScreenCheck".set_pressed(true)
	else:	
		$"UIView/UI/FullScreenCheck".set_pressed(false)
	
	if Glob.mouse_hide:
		$"UIView/UI/CursorCheck".set_pressed(true)
	else:
		$"UIView/UI/CursorCheck".set_pressed(false)
	
	if AudioServer.is_bus_mute(AudioServer.get_bus_index("Master")) == true:
		$"UIView/UI/SoundLabel/MasterLabel/MasterMute".set_pressed(true)
	else:
		$"UIView/UI/SoundLabel/MasterLabel/MasterMute".set_pressed(false)
	
	if AudioServer.is_bus_mute(AudioServer.get_bus_index("Music")) == true:
		$"UIView/UI/SoundLabel/MusicLabel/MusicMute".set_pressed(true)
	else:
		$"UIView/UI/SoundLabel/MusicLabel/MusicMute".set_pressed(false)
	
	if AudioServer.is_bus_mute(AudioServer.get_bus_index("Sfx")) == true:
		$"UIView/UI/SoundLabel/SFXLabel/SFXMute".set_pressed(true)
	else:
		$"UIView/UI/SoundLabel/SFXLabel/SFXMute".set_pressed(false)

	if AudioServer.is_bus_mute(AudioServer.get_bus_index("Ambience")) == true:
		$"UIView/UI/SoundLabel/AmbienceLabel/AmbienceMute".set_pressed(true)
	else:
		$"UIView/UI/SoundLabel/AmbienceLabel/AmbienceMute".set_pressed(false)


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")


func _on_full_screen_check_toggled(button_pressed: bool):
	if button_pressed:
		$"UIView/UI/FullScreenCheck".texture_normal = check_mark_active_spr
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		$"UIView/UI/FullScreenCheck".texture_normal = check_mark_idle_spr
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_master_mute_toggled(button_pressed:bool):
	if button_pressed:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
		$"UIView/UI/SoundLabel/MasterLabel/MasterMute".texture_normal = check_mark_idle_spr
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
		$"UIView/UI/SoundLabel/MasterLabel/MasterMute".texture_normal = check_mark_active_spr


func _on_sfx_mute_toggled(button_pressed:bool):
	if button_pressed:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Sfx"), true)
		$"UIView/UI/SoundLabel/SFXLabel/SFXMute".texture_normal = check_mark_idle_spr
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Sfx"), false)
		$"UIView/UI/SoundLabel/SFXLabel/SFXMute".texture_normal = check_mark_active_spr

func _on_music_mute_toggled(button_pressed:bool):
	if button_pressed:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), true)
		$"UIView/UI/SoundLabel/MusicLabel/MusicMute".texture_normal = check_mark_idle_spr
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
		$"UIView/UI/SoundLabel/MusicLabel/MusicMute".texture_normal = check_mark_active_spr


func _on_ambience_mute_toggled(button_pressed:bool):
	if button_pressed:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Ambience"), true)
		$"UIView/UI/SoundLabel/AmbienceLabel/AmbienceMute".texture_normal = check_mark_idle_spr
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Ambience"), false)
		$"UIView/UI/SoundLabel/AmbienceLabel/AmbienceMute".texture_normal = check_mark_active_spr


func _on_full_screen_check_pressed():
	$SFXPlayer.play()


func _on_ambience_mute_pressed():
	$SFXPlayer.play()


func _on_master_mute_pressed():
	$SFXPlayer.play()


func _on_sfx_mute_pressed():
	$SFXPlayer.play()


func _on_music_mute_pressed():
	$SFXPlayer.play()


func _on_cursor_check_toggled(button_pressed: bool):
	if button_pressed:
		$"UIView/UI/CursorCheck".texture_normal = check_mark_active_spr
		Glob.mouse_hide = true
	else:
		$"UIView/UI/CursorCheck".texture_normal = check_mark_idle_spr
		Glob.mouse_hide = false


func _on_cursor_check_pressed():
	$SFXPlayer.play()


func _on_delete_save_pressed():
	$SFXPlayer.play()
	$"UIView/UI/WarningPanel".visible = true


func _on_no_button_pressed():
	$SFXPlayer.play()
	$"UIView/UI/WarningPanel".visible = false

func _on_yes_button_pressed():
	$SFXPlayer.play()
	if ResourceLoader.exists("user://user_data.tres"):
		$SFXPlayer.play()
		
		DirAccess.remove_absolute("user://user_data.tres")

		Glob.beans = 0
		Glob.best_dist = 0
		Glob.has_brandon = false
		Glob.brandon_equipped = false

		Glob.travel_level = 1
		Glob.travel_speed = Glob.speed_data[Glob.travel_level]["speed"]

		Glob.distance_level = 1
		Glob.distance_start = Glob.distance_data[Glob.distance_level]["distance"]

		Glob.powerup_level = 1
		Glob.powerup_chance = Glob.powerup_data[Glob.powerup_level]["chance"]
		Glob.powerup_time = Glob.powerup_data[Glob.powerup_level]["time"]

		Save.save_game()

		$"UIView/UI/WarningPanel".visible = false
