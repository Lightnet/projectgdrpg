extends RigidBody

#export (String, FILE) var sceneid
export (String) var teleportPointId = "TeleportPoint1"
var spawnpoint
var excludes = []
var currentobj

func set_Teleport(teleportId, objpawnId):
	var teleportpoint = get_tree().get_root().find_node(teleportPointId,true,false)
	if teleportpoint != null:
		print("TeleportPoint?")
		#global_transform.origin
		#pawnId
		if objpawnId !=null:
			spawnpoint = teleportpoint.get_node("Position3D")
			objpawnId.transform.origin = spawnpoint.global_transform.origin
			print("teleport")
			print(teleportId)
			currentobj = null
		pass
	pass
	

func _ready():
	excludes.append(get_rid())
	spawnpoint = get_node("Position3D")
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
		if results[0].collider.get_name().find("LBCharacterPawn") > -1:
			if results[0].collider != currentobj:
				print(results[0].collider.get_name())
				currentobj = results[0].collider
				if gamemanagement != null:
					
					#print(sceneid)
					#gamemanagement.set_travel(sceneid,travelPointId)
					if currentobj != null:
						print("Trigger Travel!")
						set_Teleport(teleportPointId,currentobj)
					pass
		pass
	pass
