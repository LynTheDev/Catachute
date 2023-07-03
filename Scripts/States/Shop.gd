extends Node2D


func update_text():
	$"UIView/UI/Bean/Currency".text = "%d" % [Glob.beans]

	$"UIView/UI/TravelSpeed/CurrentLevel".text = "current level: %d" % [Glob.travel_level]
	if Glob.travel_level == 5:
		$"UIView/UI/TravelSpeed/BuyButton".visible = false
		$"UIView/UI/TravelSpeed/Next".text = "maxxed out"
	else:
		var next_level := Glob.travel_level + 1
		var next_price: float = Glob.speed_data[next_level]["price"]

		$"UIView/UI/TravelSpeed/Next".text = "next: %d\nprice:%d" % [next_level, next_price]

	$"UIView/UI/StartDistance/CurrentLevel".text = "current level: %d" % [Glob.distance_level]
	if Glob.distance_level == 5:
		$"UIView/UI/StartDistance/BuyButtonDistance".visible = false
		$"UIView/UI/StartDistance/Next".text = "maxxed out"
	else:
		var next_level := Glob.distance_level + 1
		var next_price: float = Glob.distance_data[next_level]["price"]

		$"UIView/UI/StartDistance/Next".text = "next: %d\nprice:%d" % [next_level, next_price]
	
	$"UIView/UI/Powerups/CurrentLevel".text = "current level: %d" % [Glob.powerup_level]
	if Glob.powerup_level == 5:
		$"UIView/UI/Powerups/BuyButtonPowerup".visible = false
		$"UIView/UI/Powerups/Next".text = "maxxed out"
	else:
		var next_level := Glob.powerup_level + 1
		var next_price: float = Glob.powerup_data[next_level]["chance"]

		$"UIView/UI/Powerups/Next".text = "next: %d\nprice:%d" % [next_level, next_price]


func _ready():
	$SFXPlayerSpecial.play()
	update_text()


func _process(_delta):
	if Glob.travel_level != 5:
		var next_level_travel := Glob.travel_level + 1
		var next_price_travel: float = Glob.speed_data[next_level_travel]["price"]

		if Glob.beans < next_price_travel:
			$"UIView/UI/TravelSpeed/BuyButton".disabled = true
		else:
			$"UIView/UI/TravelSpeed/BuyButton".disabled = false

	if Glob.distance_level != 5:
		var next_level_distance := Glob.distance_level + 1
		var next_price_distance: float = Glob.distance_data[next_level_distance]["price"]

		if Glob.beans < next_price_distance:
			$"UIView/UI/StartDistance/BuyButtonDistance".disabled = true
		else:
			$"UIView/UI/StartDistance/BuyButtonDistance".disabled = false
	
	if Glob.powerup_level != 5:
		var next_level_powerup := Glob.powerup_level + 1
		var next_price_powerup: float = Glob.powerup_data[next_level_powerup]["chance"]

		if Glob.beans < next_price_powerup:
			$"UIView/UI/Powerups/BuyButtonPowerup".disabled = true
		else:
			$"UIView/UI/Powerups/BuyButtonPowerup".disabled = false


func _on_backbutton_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")


func _on_buy_button_pressed():
	$SFXPlayer.play()

	var next_level := Glob.travel_level + 1
	var next_price = Glob.speed_data[next_level]["price"]

	if Glob.beans >= next_price:
		Glob.beans -= next_price

		Glob.travel_level = next_level
		Glob.travel_speed = Glob.speed_data[next_level]["speed"]

		update_text()
		Save.save_game()



func _on_buy_button_distance_pressed():
	$SFXPlayer.play()
	
	var next_level := Glob.distance_level + 1
	var next_price = Glob.distance_data[next_level]["price"]

	if Glob.beans >= next_price:
		Glob.beans -= next_price

		Glob.distance_level = next_level
		Glob.distance_start = Glob.distance_data[next_level]["distance"]

		update_text()
		Save.save_game()


func _on_buy_button_powerup_pressed():
	$SFXPlayer.play()
	
	var next_level := Glob.powerup_level + 1
	var next_price = Glob.powerup_data[next_level]["chance"]

	if Glob.beans >= next_price:
		Glob.beans -= next_price

		Glob.powerup_level = next_level
		Glob.powerup_chance = Glob.powerup_data[next_level]["chance"]

		update_text()
		Save.save_game()


func _on_costumes_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/CostumesShop.tscn")
