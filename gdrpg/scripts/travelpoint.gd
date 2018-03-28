extends RigidBody

export (String, FILE) var sceneid
export (String) var teleportid = "TravelPoint01"
export (String) var travelPointId = "TravelPoint01"
export (bool) var btravel = true
var characterPawn = preload("res://prefabs/LBCharacterPawn.tscn")
var excludes = []
var currentobj
#var oldcurrentobj
var gamemanagement

func spawnplayer():
	var Characters = get_tree().get_root().find_node("Characters",true,false)
	var spawnpoint = get_node("Position3D")
	
	var pawn = characterPawn.instance()
	#pawn.transform.origin = spawnpoint.transform.origin
	pawn.transform.origin = spawnpoint.global_transform.origin
	Characters.add_child(pawn)
	pass

func _ready():
	#print(PackedScene)
	#set_contact_monitor(true)
	#connect("body_entered",self,"do_the_printing")
	#set_process(true)
	
	excludes.append(get_rid())
	gamemanagement = get_node("/root/gamemanagement")
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	#if is_colliding():
	pass
func _physics_process(delta):
	#if self.is_coll
		#print("r collision")
	#var space_state = get_world().get_direct_space_state()
	var params = PhysicsShapeQueryParameters.new()
	params.set_transform(get_transform())  #work
	params.set_exclude(excludes) # here exclude is an array of... RID
	var state = get_world().get_direct_space_state()
	params.set_shape(get_node("CollisionShape").get_shape())
	var results = state.intersect_shape(params, 2)
	if results.size() != 0:
		#print("collider")
		#print(results.size())
		#print(results[0].collider.get_name() )
		#print(results[0].collider.get_name().find("LBCharacterPawn"))
		if results[0].collider.get_name().find("LBCharacterPawn") > -1:
			if results[0].collider != currentobj:
				print(results[0].collider.get_name())
				currentobj = results[0].collider
				if gamemanagement != null:
					print("Trigger Travel!")
					print(sceneid)
					gamemanagement.set_travel(sceneid,travelPointId)
					pass
		pass
		
		
	pass
	
#func do_the_printing(body):
   #print("collision hapened")

#func _on_Teleport01_body_entered(body):
	#print("BE collision hapened")
	#pass # replace with function body

#func _on_Teleport01_body_shape_entered(body_id, body, body_shape, local_shape):
	#print("BHE collision hapened")
	#pass # replace with function body
