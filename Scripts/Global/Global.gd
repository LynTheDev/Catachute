extends Node

var speed_data = {
	1: {
		"speed": 0.7,
		"price": 10
	},
	2: {
		"speed": 0.6,
		"price": 25
	},
	3: {
		"speed": 0.5,
		"price": 60
	},
	4: {
		"speed": 0.4,
		"price": 100
	},
	5: {
		"speed": 0.3,
		"price": 150
	}
}

var powerup_data = {
	1: {
		"chance": 20,
		"time": 10,
		"price": 10
	},
	2: {
		"chance": 25,
		"time": 11,
		"price": 30
	},
	3: {
		"chance": 30,
		"time": 12,
		"price": 80
	},
	4: {
		"chance": 35,
		"time": 13,
		"price": 110
	},
	5: {
		"chance": 45,
		"time": 15,
		"price": 180
	}
}


var distance_data = {
	1: {
		"distance": 1,
		"price": 10
	},
	2: {
		"distance": 20,
		"price": 20
	},
	3: {
		"distance": 40,
		"price": 80
	},
	4: {
		"distance": 50,
		"price": 145
	},
	5: {
		"distance": 100,
		"price": 225
	}
}


@export
var game_beans := 0

@export 
var beans := 0

@export
var game_dist := 0

@export
var best_dist := 0

@export
var travel_level := 1

@export
var travel_speed: float = speed_data[travel_level]["speed"]

@export
var distance_level := 1

@export
var distance_start: int = distance_data[distance_level]["distance"]

@export
var powerup_level := 1

@export
var powerup_chance: int = powerup_data[powerup_level]["chance"]

@export
var powerup_time: int = powerup_data[powerup_level]["time"]

@export
var bean_collection := 1

@export 
var player_speed := 300
