extends CharacterBody2D


var SPEED = Glob.player_speed
const FRICTION := 20.0

const CHUTE_LEFT := 30
const CHUTE_RIGHT := -30

var missle_rock = preload("res://Scenes/Entities/MissleRock.tscn")
var smoll_powerup = preload("res://Scenes/Entities/SmollPowerup.tscn")
var multi_powerup = preload("res://Scenes/Entities/BeanMultipler.tscn")

var distance_travelled := Glob.distance_start
var chance := 43.0
var ticked_once := false
var small_chance := Glob.powerup_chance


func get_multi():
	Glob.bean_collection = 2
	$Progress.visible = true
	$MultiDuration.start()


func get_small():
	$Smoll.play("Shrink")
	$SmollDuration.start()


func kill():
	if Glob.bean_collection > 1:
		Glob.bean_collection = 1
	
	Glob.beans += Glob.game_beans
	# Just for testing purposes lmao
	# Glob.beans = 32823493

	Glob.game_dist = distance_travelled

	get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")


func change_chances():
	chance += 1
	if $ChanceTimer.wait_time > 0:
		$ChanceTimer.wait_time -= 0.1
	else:
		$ChanceTimer.wait_time = 0
	
	if $"../BeanManager/BeanSpawner".wait_time > 0:
		$"../BeanManager/BeanSpawner".wait_time -= 0.2
	else:
		$"../BeanManager/BeanSpawner".wait_time = 0
	
	ticked_once = true


func _ready():
	if Glob.distance_level > 4:
		chance += 1
		if $ChanceTimer.wait_time > 0:
			$ChanceTimer.wait_time -= 0.1
		else:
			$ChanceTimer.wait_time = 0
	
		if $"../BeanManager/BeanSpawner".wait_time > 0:
			$"../BeanManager/BeanSpawner".wait_time -= 0.2
		else:
			$"../BeanManager/BeanSpawner".wait_time = 0
	
	$MeterCounter.wait_time = Glob.travel_speed
	$MeterCounter.start()

	$MultiDuration.wait_time = Glob.powerup_time

	$ChanceTimer.start()


func _physics_process(_delta):
	$"../UIView/UI/Distance".text = "distance: %dm" % [distance_travelled]
	$"../UIView/UI/Beans".text = "Beans: %d" % [Glob.game_beans]

	# $"../UIView/UI/DebugStuff".text = "start dist: %d\ntravel speed: %f\nchance: %f\nchance time: %f\nbean time: %f\npowerup: %d" % [Glob.distance_start, Glob.travel_speed, chance, $ChanceTimer.wait_time, $"../BeanManager/BeanSpawner".wait_time, Glob.powerup_chance]
	# $"../UIView/UI/DebugStuff".text = "powerup time: %d\nbean col: %d" % [Glob.powerup_time, Glob.bean_collection]

	if $MultiDuration.wait_time > 0:
		var scale_fct = 90 / $MultiDuration.wait_time
		$Progress/ProgressMain.size.x = 90 - (scale_fct * $MultiDuration.time_left)

	if position.x < 20:
		position.x = 20
		velocity.x = 0
	elif position.x > 1132:
		position.x = 1132
		velocity.x = 0

	if distance_travelled % 50 == 0:
		if not ticked_once:
			change_chances()
	else:
		ticked_once = false
		
	if Input.is_action_pressed("left"):
		$Cat.flip_h = true

		if $Parachute.rotation_degrees < 30:
			$Parachute.rotation_degrees += 3
		else:
			$Parachute.rotation_degrees = 30
	elif Input.is_action_pressed("right"):
		$Cat.flip_h = false

		if $Parachute.rotation_degrees > -30:
			$Parachute.rotation_degrees -= 3
		else:
			$Parachute.rotation_degrees = -30
	
	if Input.is_action_pressed("left") and Input.is_action_pressed("right"):
		$Parachute.rotation_degrees = move_toward($Parachute.rotation_degrees, 0, 2)

	var direction = Input.get_axis("left", "right")
	if direction:	
		velocity.x = direction * SPEED
	else:
		$Parachute.rotation_degrees = move_toward($Parachute.rotation_degrees, 0, 2)
		velocity.x = move_toward(velocity.x, 0, FRICTION)

	move_and_slide()


func _on_meter_counter_timeout():
	distance_travelled += 1


func _on_chance_timer_timeout():
	if get_parent().can_throw and randi_range(1, 100) <= chance:
		var missile_rock_spawn = missle_rock.instantiate()
		$"../ObstacleManager/Rocks".add_child(missile_rock_spawn)

		missile_rock_spawn.position.x = position.x


func _on_smoll_duration_timeout():
	$Smoll.play_backwards("Shrink")
	$SmollDuration.stop()


func _on_powerup_chance_timer_timeout():
	if randi_range(1, 100) <= chance:
		if randi_range(1, 100) <= 40:
			var multi_spawn = multi_powerup.instantiate()
			$"../PowerupManager".add_child(multi_spawn)
		else:
			var smoll_spawn = smoll_powerup.instantiate()
			$"../PowerupManager".add_child(smoll_spawn)


func _on_multi_duration_timeout():
	Glob.bean_collection = 1
	$Progress.visible = false
	$MultiDuration.stop()
