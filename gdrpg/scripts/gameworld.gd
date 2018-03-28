extends Spatial

var gamemanagement
var characters

func checkspawn():
	if gamemanagement.bspawn:
		for character in characters.get_children():
			print(character.get_name())
			character.queue_free()
		#gamemanagement.teleportId
		#print(gamemanagement.teleportId)
		var travelpoint = get_tree().get_root().find_node(gamemanagement.teleportId,true,false)
		if travelpoint != null:
			print("found")
			print(travelpoint)
			travelpoint.spawnplayer()
		print("create spawn!")
		pass
	else:
		print("no spawn!")
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	gamemanagement = get_node("/root/gamemanagement")
	characters = get_node("Characters")
	checkspawn()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
