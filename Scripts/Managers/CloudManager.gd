extends Node


var cloud = preload("res://Scenes/Entities/Cloud.tscn")


func _ready():
	$CloudSpawner.start()


func _on_cloud_spawner_timeout():
	var spawn_cloud = cloud.instantiate()

	add_child(spawn_cloud)
