extends Node2D

var is_active = false

var check_mark_active_spr = preload("res://Assets/Buttons/CheckMarkChecked.png")
var check_mark_idle_spr = preload("res://Assets/Buttons/CheckMarkIdle.png")


func _ready():
	$SFXPlayer.play()


func _process(_delta):
	if $"UIView/UI/FullScreenCheck".is_pressed():
		$"UIView/UI/FullScreenCheck".texture_normal = check_mark_active_spr
	else:	
		$"UIView/UI/FullScreenCheck".texture_normal = check_mark_idle_spr
	
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
