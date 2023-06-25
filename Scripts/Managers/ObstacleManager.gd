extends Node


var rock = preload("res://Scenes/Entities/Rock.tscn")
var floating_rock = preload("res://Scenes/Entities/FloatingRock.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Rocks/RockSpawner".start()
	$"Rocks/FloatingRockSpawner".start()


func _on_rock_spawner_timeout():
	var rock_spawn = rock.instantiate()
	add_child(rock_spawn)


func _on_floating_rock_spawner_timeout():
	var floating_rock_spawn = floating_rock.instantiate()
	add_child(floating_rock_spawn)
