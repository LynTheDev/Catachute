extends Node2D


var can_throw := false


func _ready():
	if Glob.mouse_hide:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	
	get_node("/root/Glob/MusicPlayer").stop()
	$MusicPlayer.play()

	Glob.game_beans = 0


func _process(_delta):
	if $Player.distance_travelled >= 30:
		can_throw = true
