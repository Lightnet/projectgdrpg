extends Node

#global vars
var bspawn = false


var player = null
var inventory = []


#travel id
var sceneId
var teleportId = "Teleport01"
var travelPointId = "TravelPoint01"

func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func set_travel(sceneid, teleportid):
	print("game m > travel")
	print(sceneid,teleportid)
	
	if sceneid != null:
		bspawn = true
		travelPointId = teleportid
		teleportId = teleportid
		get_tree().change_scene(sceneid)
	pass
