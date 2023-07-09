extends Node2D


var hs := false

var crash_sound = preload("res://Assets/Sound/SFX/Crash.mp3")

# B r a n d o n
var brandon_sprite = preload("res://Assets/Entities/Player/Catdon_Idle.png")


func _process(_delta):
	if Input.is_action_pressed("quick_restart"):
		Trans.switch_anim("res://Scenes/Game.tscn")


func _ready():
	if Glob.mouse_hide:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);

	if Glob.brandon_equipped:
		$Player.texture = brandon_sprite

	if not $"SFXPlayer".is_playing():
		$"SFXPlayer".stream = crash_sound
		$"SFXPlayer".play()

	if Glob.game_dist > Glob.best_dist:
		hs = true
		Glob.best_dist = Glob.game_dist
	
	Save.save_game()
	
	if hs:
		$Meters.text = "travelled %dm new high score!\nhigh score: %dm" % [Glob.game_dist, Glob.best_dist]
	else:
		$Meters.text = "travelled %dm\nhigh score: %dm" % [Glob.game_dist, Glob.best_dist]

	$Beans.text = "collected: %d beans\ntotal: %d beans" % [Glob.game_beans, Glob.beans]


func _on_sign_again_pressed():
	Trans.switch_anim("res://Scenes/Game.tscn")


func _on_sign_leave_pressed():
	Trans.switch_anim("res://Scenes/MainMenu.tscn")