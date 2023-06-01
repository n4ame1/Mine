extends Node2D

@export var tilemap: TileMap

@export var width = 100
@export var height = 100

enum layers {
	FLOOR,
	WALL
}

const TERRAIN = 0

enum source_ids {
	CAVE,
	OTHER
}

var cave_cells: Array[Vector2i]

var noise = preload("res://resources/noise/noise.tres")

func _ready():
	for x in width:
		for y in height:
			var coords = Vector2i(x, y)
			
			tilemap.set_cell(layers.FLOOR, coords, source_ids.OTHER, Vector2i(0, 9))
			
			var value = noise.get_noise_2d(x, y)
			if value < 0.2:
				cave_cells.append(coords)
	
	tilemap.set_cells_terrain_connect(layers.WALL, cave_cells, source_ids.CAVE, TERRAIN)
