extends Node

export var sceneName = "Travel02"
export var sceneDescription = ""

#export var travelMapList = {}

export var travelMapList = {
	"Travel01":{
		"nodepath":"Travel01",
		"nodepoint":"res://levels/Travel02.tscn"
	},
	"Travel02":{
		"nodepath":"res://levels/Travel01.tscn",
		"nodepoint":"TravelPointMenu1"
	}
}

func saveTravelMapList():
	var file = File.new()
	file.open("res://database/travels/travelmap02.json", File.WRITE)
	#file.store_line(to_json(travelMapList))
	file.store_string(to_json(travelMapList))
	file.close()
	
	pass

func loadTravelMapList():
	var file = File.new()
	file.open("res://database/travels/travelmap01.json", file.READ)
	var text = file.get_as_text()
	travelMapList = parse_json(text)
	file.close()
	# print something from the dictionnary for testing.
	#print(travelMapList["node01"])
	#print(travelMapList)
	
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
