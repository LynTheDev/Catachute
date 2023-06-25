extends Node

var bean = preload("res://Scenes/Entities/Bean.tscn")

func _ready():
	$BeanSpawner.start()


func _on_bean_spawner_timeout():
	var spawn_bean = bean.instantiate()

	add_child(spawn_bean)
