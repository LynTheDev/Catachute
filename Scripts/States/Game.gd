extends Node2D


var can_throw := false


func _ready():
	get_node("/root/Glob/MusicPlayer").stop()
	$MusicPlayer.play()

	Glob.game_beans = 0


func _process(_delta):
	if $Player.distance_travelled >= 30:
		can_throw = true
