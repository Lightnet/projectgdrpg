tool
extends EditorPlugin

var TravelInfoClass = preload("res://addons/travelmap_dock/ui_traveldata.tscn")

var travelmaplist = {
	"travel01":{
		"mappath":"Travel01",
		"mappoint":"Travel01"
	},
	"travel02":{
		"mappath":"Travel01",
		"mappoint":"Travel01"
	}
}

var travelname = "Travel03"
var path = "res://database/travels/"

	
func _init():
	#add_export_plugin(SomeFrameworkExportPlugin.new())
	print("init export?")
	pass

var dock # A class member to hold the dock during the plugin lifecycle

func setup():

	var BtnNew = dock.get_node("BtnNew")
	BtnNew.connect("pressed", self, "new_travelmap")

	var BtnSave = dock.get_node("BtnSave")
	BtnSave.connect("pressed", self, "load_travelmap")

	var btnload = dock.get_node("BtnLoad")
	btnload.connect("pressed", self, "save_travelmap")

	var LEPath = dock.get_node("LEFileName")
	LEPath.text = path + travelname

	#pass

func TravelListPressed(arg):
	#print(arg[0].get_name()) #this would be button)
	#print(event)
	print(arg)
	#arg[1].info #this would be buttonMessage
	pass

func new_travelmap():
	#var travellist = dock.get_node("HBCTravelMapList")
	#var button = Button.new()
	#button.text = "test"
	#var arg = []
	#arg.append(button)
	#arg.append("Travel01")
	#arg.append("test")
	#print(arg)
	#button.connect("pressed", self, "TravelListPressed", [arg])
	#travellist.add_child(button)

	var travellist = dock.get_node("ScrollContainer/HBCTravelMapList")

	for travel in travelmaplist:
		print(travel)
		#var button = Button.new()
		var traveldata = TravelInfoClass.instance()
		
		#button.text = travel
		var arg = []
		arg.append(traveldata)
		arg.append(travel)
		arg.append(travelmaplist[travel])
		#arg.append("Travel01")
		#arg.append("test")
		#print(arg)
		#button.connect("pressed", self, "TravelListPressed", [arg])

		var mapname = traveldata.get_node("LEName")
		mapname.text = travel

		travellist.add_child(traveldata)

		#var gscript = button.get_node(".").get_script()
		#gscript.set_data(travel,travelmaplist[travel])

		pass

	#pass

func load_travelmap():

	pass

func save_travelmap():
	
	pass

func new_traveldata():


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