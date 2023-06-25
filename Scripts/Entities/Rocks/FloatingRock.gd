extends Area2D


var SPEED := 0


func set_speed():
	SPEED = randi_range(4, 6)


func pick_x_pos() -> int:
	return randi_range(347, 823)


func _ready():
	position.x = pick_x_pos()
	position.y = 744

	set_speed()


func _physics_process(_delta):
	position.y -= SPEED

	if position.y < -60:
		queue_free()



func _on_body_entered(body:Node2D):
	if body.get_collision_layer() == 1:
		body.kill()
