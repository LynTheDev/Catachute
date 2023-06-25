extends Area2D


var SPEED := 0


func set_speed():
	SPEED = randi_range(4, 6)


func set_x_left() -> float:
	return randi_range(0, 160)


func set_x_right() -> float:
	return randi_range(993, 1152)


func _ready():
	position.y = 744

	var lr = randi_range(1, 2)
	if lr == 1:
		position.x = set_x_left()
	elif lr == 2:
		$RockSprite.flip_h = true
		position.x = set_x_right()

	set_speed()


func _process(_delta):
	position.y -= SPEED

	if position.y < -60:
		queue_free()


func _on_body_entered(body):
	if body.get_collision_layer() == 1:
		body.kill()
