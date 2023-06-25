extends Area2D


var SPEED := 0
var ROTATION_SPEED := 0.0

var can_move := false


func set_speed():
	SPEED = randi_range(15, 25)


func _ready():
	$WarningAnim.play("Fade")
	$RockSpawnTimer.start()

	ROTATION_SPEED = randf_range(5, 20)

	set_speed()


func _physics_process(_delta):
	if can_move:
		$MRock.rotation_degrees += ROTATION_SPEED
		position.y -= SPEED

		if position.y < -90:
			queue_free()


func _on_rock_spawn_timer_timeout():
	$MRock.visible = true
	$WarningAnim.play("FadeBackwards")

	$RockSpawnTimer.stop()


func _on_warning_anim_animation_finished(anim_name: StringName):
	if anim_name == "FadeBackwards":
		can_move = true


func _on_body_entered(body: Node2D):
	if body.get_collision_layer() == 1:
		body.kill()
