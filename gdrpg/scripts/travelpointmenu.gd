extends RigidBody

#class a:
	#export var b = 0
	#func _init():
		#print("test")

#export(a) var custom_export

#var MapListClass = get_script("res://scripts/travelpointmenu.gd")
#var MapListClass = preload("res://scripts/travelpointmenu.gd")

#class MapListClassSub:
	#const _var1 = "test"

#export (MapListClass) var TravelList
#export (MapListClassSub) var TravelList
#export var TravelList = MapListClassSub()

export var strings = PoolStringArray()
export(int, "Warrior", "Magician", "Thief") var character_class
export(String, "Rebecca", "Mary", "Leah") var character_name


export (String, FILE) var sceneid
#export (String) var teleportid = "TravelPoint01"
export (String) var travelPointId = "TravelPoint1"
export (bool) var btravel = true
var characterPawn = preload("res://prefabs/LBCharacterPawn.tscn")

var travelMenu = preload("res://interfaces/ui_travellist.tscn")
var ui_TravelList


var excludes = []
var currentobj
var gamemanagement

var bMenu = false
var bareapawn = false

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
	
func _input(event):
	if Input.is_action_pressed("Used"):
		if bareapawn:
			print("Used Interface")
			var ui_travellist = get_tree().get_root().get_node("Main/CanvasLayer/ui_travellist")
			if ui_travellist == null:
				ui_TravelList = travelMenu.instance()
				get_tree().get_root().get_node("Main/CanvasLayer").add_child(ui_TravelList)
		pass
	#pass

func CheckPawnClass(pawn):
	if pawn.collider.get_name().find("LBCharacterPawn") > -1:
			print("found!")
			if pawn.collider != currentobj:
				print("menu travel?")
				print(pawn.collider.get_name())
				currentobj = pawn.collider
				
				bMenu = true
				print(bMenu)
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
	
	#print(bMenu)
	
	var results = state.intersect_shape(params, 2)
	var barea = false
	if results.size() != 0:
		#print("collider")
		#print(results.size())
		#print(results[0].collider.get_name())
		for obj in results:
			#print("obj",obj.collider.get_name())
			#print(obj)
			if obj.collider.get_name().find("LBCharacterPawn") > -1:
				barea = true
				#print("pass")
	if barea:
		bareapawn = true
	else:
		bareapawn = false
		#print(results[0].collider.get_name().find("LBCharacterPawn"))
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
