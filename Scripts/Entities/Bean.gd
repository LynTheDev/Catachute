extends Area2D


var SPEED := 0
var ROTATION_SPEED := 0.0

var pickup_sound = preload("res://Assets/Sound/SFX/Pickup.mp3")


func set_speed_rot():
	SPEED = randi_range(5, 7)
	ROTATION_SPEED = randf_range(5, 20)


func _ready():
	set_speed_rot()

	var viewport_size = get_viewport().get_visible_rect().size

	position.y = viewport_size.y
	position.x = randi_range(0, viewport_size.x + 1)


func _process(_delta):
	position.y -= SPEED
	rotation_degrees += ROTATION_SPEED

	if position.y < -20:
		queue_free()


func _on_body_entered(body):
	if body.get_collision_layer() == 1:
		$"../../SFXPlayer".stream = pickup_sound
		$"../../SFXPlayer".play()
		
		Glob.game_beans += Glob.bean_collection
		queue_free()
