extends Node


var save_path := "user://user_data.tres"
var saved_data = save_data.new()


func save_game():
	saved_data.beans = Glob.beans
	saved_data.high_scowore = Glob.best_dist
	saved_data.travel_level = Glob.travel_level
	saved_data.distance_level = Glob.distance_level
	saved_data.powerup_level = Glob.powerup_level

	ResourceSaver.save(saved_data, save_path)
	print("Dev info: saved")


func load_game():
	if ResourceLoader.exists(save_path):
		var saved = ResourceLoader.load(save_path)

		Glob.beans = saved.beans
		Glob.best_dist = saved.high_scowore

		Glob.travel_level = saved.travel_level
		Glob.travel_speed = Glob.speed_data[Glob.travel_level]["speed"]

		Glob.distance_level = saved.distance_level
		Glob.distance_start = Glob.distance_data[Glob.distance_level]["distance"]

		Glob.powerup_level = saved.powerup_level
		Glob.powerup_chance = Glob.powerup_data[Glob.powerup_level]["chance"]
		Glob.powerup_time = Glob.powerup_data[Glob.powerup_level]["time"]
		print("Dev info: loaded")
	else:
		print("Dev info: No save file found.")
