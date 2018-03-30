extends Node

export var sceneName = "Travel02"
export var sceneDescription = ""

#export var travelMapList = {}

export var travelMapList = {
	"node01":{
		"nodename":"Travel01",
		"nodepath":"Travel01",
		"nodepoint":"Travel01"
	},
	"node02":{
		"nodename":"Travel02",
		"nodepath":"Travel02",
		"nodepoint":"Travel02"
	}
}

func saveTravelMapList():
	var file = File.new()
	file.open("res://database/travels/travelmap02.json", File.WRITE)
	file.store_line(to_json(travelMapList))
	file.close()
	
	pass

func loadTravelMapList():
	var file = File.new()
	file.open("res://database/travels/travelmap01.json", file.READ)
	var text = file.get_as_text()
	travelMapList = parse_json(text)
	file.close()
	# print something from the dictionnary for testing.
	print(travelMapList["node01"])
	print(travelMapList)
	
	pass



func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	loadTravelMapList()
	saveTravelMapList()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
