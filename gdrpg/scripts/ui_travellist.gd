extends Control

var travelmapfile
var travelMap

var nodepath = ""
var nodepoint = ""

var gamemanagement

func travelMap():
	
	gamemanagement.set_travel(nodepath,nodepoint)
	
	pass

func selectTravelScene(arg):
	#print(arg)
	print(arg[1]["nodepath"])
	print(arg[1]["nodepoint"])
	
	nodepath = arg[1]["nodepath"]
	nodepoint = arg[1]["nodepoint"]
	pass

func loadmap():
	print("load map")
	print(travelmapfile)
	
	var file = File.new()
	file.open(travelmapfile, file.READ)
	var text = file.get_as_text()
	travelMap = parse_json(text)
	file.close()
	
	print(travelMap)
	
	var TList = get_node("ScrollContainer/VBoxContainer")
	
	for list in TList.get_children():
		list.queue_free()
	
	var MapInfo = get_tree().get_root().get_node("Main")
	
	for travel in travelMap:
		if travel != MapInfo.sceneName:
			var arg = []
			var button = Button.new()
			print("==============")
			print(travel)
			print(travelMap[travel])
			arg.append(button)
			arg.append(travelMap[travel])
			
			button.connect("pressed", self, "selectTravelScene", [arg])
			
			button.text = travel
			TList.add_child(button)
			
	pass

func _ready():
	gamemanagement = get_node("/root/gamemanagement")
	
	if travelmapfile != null:
		loadmap()
	pass

func _on_BtnTravel_pressed():
	travelMap()
	pass 


func _on_BtnCancel_pressed():
	queue_free()
	pass 
