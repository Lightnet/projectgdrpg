tool
extends EditorPlugin

var TravelInfoClass = preload("res://addons/travelmap_dock/ui_traveldata.tscn")

var travelMapList = {
	"Travel01":{
		"nodepath":"res://levels/Travel01.tscn",
		"nodepoint":"TravelPointMenu1"
	},
	"Travel02":{
		"nodepath":"res://levels/Travel02.tscn",
		"nodepoint":"TravelPointMenu1"
	}
}

var travelname = "Travelmap03.json"
var path = "res://database/travels/"
var travelpath = path + travelname

func _init():
	print("init export?")
	pass

var dock # A class member to hold the dock during the plugin lifecycle

func setup():
	var BtnNew = dock.get_node("BtnNew")
	BtnNew.connect("pressed", self, "new_travelmap")
	var BtnSave = dock.get_node("BtnSave")
	BtnSave.connect("pressed", self, "save_travelmap")
	var btnload = dock.get_node("BtnLoad")
	btnload.connect("pressed", self, "load_travelmap")
	var LEPath = dock.get_node("LEFileName")
	LEPath.text = path + travelname

	var btnnewdata = dock.get_node("BtnNewData")
	btnnewdata.connect("pressed", self, "new_traveldata")
	#pass

func TravelListPressed(arg):
	#print(arg[0].get_name()) #this would be button)
	#print(event)
	print(arg)
	#arg[1].info #this would be buttonMessage
	pass

func travelUpdatePressed(arg):
	print("update data")
	print(arg[0])
	print(arg[1])

	var traveldata = arg[0]

	var mapname = traveldata.get_node("HBoxContainer2/LEName")
	#mapname.text = travel
	var mappath = traveldata.get_node("HBoxContainer3/LEPath")
	#mappath.text = travelMapList[travel]["nodepath"]
	var mappoint = traveldata.get_node("HBoxContainer4/LEPoint")
	#mappoint.text = travelMapList[travel]["nodepoint"]

	if arg[1] == mapname.text:
		travelMapList[arg[1]]["nodepath"] = String(mapname.text)
		travelMapList[arg[1]]["nodepoint"] = String(mappoint.text)
		pass
	else:
		travelMapList[arg[1]] = null
		var mapName = String(mapname.text)
		travelMapList[mapName] = {"nodepath":String(mapname.text),"nodepoint":String(mappoint.text)}

		pass

	print(travelMapList)
	pass

func travelDeletePressed(arg):
	print("delete data")
	#travelMapList
	#print(arg[0])
	#print(arg[1])
	#travelMapList[arg[1]] = null

	for traveldata in travelMapList:
		if traveldata == arg[1]:
			travelMapList.erase(traveldata)
		pass

	updateTravelList()
	pass

func updateTravelList():
	var travellist = dock.get_node("ScrollContainer/HBCTravelMapList")

	for uinode in travellist.get_children():
		uinode.queue_free()
	print("..... data")
	for travel in travelMapList:
		print(travel)
		if travelMapList[travel] == null:
			return

		var traveldata = TravelInfoClass.instance()
		
		var arg = []
		arg.append(traveldata)
		arg.append(travel)
		arg.append(travelMapList[travel])

		print("traveldata")
		print(travelMapList[travel])

		var BtnUpdate = traveldata.get_node("HBoxContainer/BtnUpdate")
		BtnUpdate.connect("pressed", self, "travelUpdatePressed", [arg])
		var BtnDelete = traveldata.get_node("HBoxContainer/BtnDelete")
		BtnDelete.connect("pressed", self, "travelDeletePressed", [arg])
		var mapname = traveldata.get_node("HBoxContainer2/LEName")
		mapname.text = travel
		var mappath = traveldata.get_node("HBoxContainer3/LEPath")
		if travelMapList[travel]["nodepath"] != null:
			mappath.text = travelMapList[travel]["nodepath"]
		var mappoint = traveldata.get_node("HBoxContainer4/LEPoint")
		mappoint.text = travelMapList[travel]["nodepoint"]

		travellist.add_child(traveldata)
	pass

func new_travelmap():
	#var travellist = dock.get_node("ScrollContainer/HBCTravelMapList")
	travelMapList = {
		"Travel01":{
			"nodepath":"",
			"nodepoint":"TravelPointMenu1"
		}
	}

	updateTravelList()
	#pass

func load_travelmap():
	var LEPath = dock.get_node("LEFileName")
	travelpath = String(LEPath.text)
	#print(travelpath)
	var file = File.new()
	file.open(travelpath, file.READ)
	var text = file.get_as_text()
	travelMapList = parse_json(text)
	file.close()
	#print(travelMapList)
	updateTravelList()
	pass

func save_travelmap():
	var file = File.new()
	file.open(travelpath, File.WRITE)
	file.store_string(to_json(travelMapList))
	file.close()
	print("Save Travel Scene!")
	pass

func new_traveldata():
	travelMapList["travel"] = {}
	travelMapList["travel"]["nodepath"] = "none"
	travelMapList["travel"]["nodepoint"] = "TravelPointMenu1"
	updateTravelList()
	pass

func _enter_tree():
	# Initialization of the plugin goes here
	# First load the dock scene and instance it:
	dock = preload("res://addons/travelmap_dock/travelmap_dock.tscn").instance()
	# Add the loaded scene to the docks:
	add_control_to_dock(DOCK_SLOT_LEFT_UL, dock)
	# Note that LEFT_UL means the left of the editor, upper-left dock
	#exportapp = EditorExportPlugin.new()
	setup()
	pass
	
func _exit_tree():
	# Clean-up of the plugin goes here
	# Remove the scene from the docks:
	remove_control_from_docks(dock) # Remove the dock
	dock.free() # Erase the control from the memory
	pass