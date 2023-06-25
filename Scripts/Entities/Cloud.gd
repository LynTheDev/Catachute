extends Area2D


var cloud_one = preload("res://Assets/Entities/Clouds/Cloud_One.png")
var cloud_two = preload("res://Assets/Entities/Clouds/Cloud_Two.png")
var cloud_three = preload("res://Assets/Entities/Clouds/Cloud_Three.png")
var cloud_four = preload("res://Assets/Entities/Clouds/Cloud_Four.png")

var SPEED := 0.0
var OPACITY := 0.0
var SCALE = 0

func pick_sprite():
	var sprite = randi_range(0, 5)
	match sprite:
		1: 
			$CloudSprite.texture = cloud_one
		2: 
			$CloudSprite.texture = cloud_two
		3: 
			$CloudSprite.texture = cloud_three
		4:
			$CloudSprite.texture = cloud_four


func set_properties():
	SPEED = randi_range(5, 25)
	SCALE = randf_range(2, 4)

	if SPEED < 8:
		OPACITY = 0.2
	elif SPEED < 15:
		OPACITY = 0.3
	elif SPEED < 23:
		OPACITY = 0.6

	$CloudSprite.modulate.a = OPACITY
	
	$CloudSprite.scale.x = SCALE
	$CloudSprite.scale.y = SCALE


func _ready():
	var viewport_size = get_viewport().get_visible_rect().size

	position.y = viewport_size.y + 20
	position.x = randi_range(0, viewport_size.x + 1)

	set_properties()
	pick_sprite()


func _process(_delta):
	position.y -= SPEED

	if position.y < -20:
		queue_free()
