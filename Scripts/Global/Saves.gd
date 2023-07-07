extends Node


var save_path := "user://user_data.tres"
var saved_data = save_data.new()


func save_game():
	saved_data.beans = Glob.beans
	saved_data.high_scowore = Glob.best_dist
	saved_data.travel_level = Glob.travel_level
	saved_data.distance_level = Glob.distance_level
	saved_data.powerup_level = Glob.powerup_level
	saved_data.has_brandon = Glob.has_brandon
	saved_data.brandon_equipped = Glob.brandon_equipped
	saved_data.has_catcher = Glob.has_catcher

	ResourceSaver.save(saved_data, save_path)
	print("Dev info: saved")


func load_game():
	if ResourceLoader.exists(save_path):
		var saved = ResourceLoader.load(save_path)

		Glob.beans = saved.beans
		Glob.best_dist = saved.high_scowore
		Glob.brandon_equipped = saved.brandon_equipped
		Glob.has_brandon = saved.has_brandon

		Glob.travel_level = saved.travel_level
		Glob.travel_speed = Glob.speed_data[Glob.travel_level]["speed"]

		Glob.distance_level = saved.distance_level
		Glob.distance_start = Glob.distance_data[Glob.distance_level]["distance"]

		Glob.powerup_level = saved.powerup_level
		Glob.powerup_chance = Glob.powerup_data[Glob.powerup_level]["chance"]
		Glob.powerup_time = Glob.powerup_data[Glob.powerup_level]["time"]
		
		Glob.has_catcher = saved.has_catcher
		print("Dev info: loaded")
	else:
		print("Dev info: No save file found.")
