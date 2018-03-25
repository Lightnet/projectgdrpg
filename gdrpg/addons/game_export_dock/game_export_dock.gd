tool
extends EditorPlugin
#extends EditorExportPlugin

class SomeFrameworkExportPlugin:
	extends EditorExportPlugin
	
func _init():
	add_export_plugin(SomeFrameworkExportPlugin.new())
	print("init export?")
	pass

var dock # A class member to hold the dock during the plugin lifecycle
var exportapp #= EditorExportPlugin.new()

func setup():
	var btnload = dock.get_node("BtnExport")
	btnload.connect("pressed", self, "pressload")
	pass

func pressload():
	print("load")
	#exportapp._export_file( "./release", "test", [] )
	exportapp._export_begin( [], false,"./test", 0 )
	#print(exportapp.get_method_list())
	pass

func _enter_tree():
	# Initialization of the plugin goes here
	# First load the dock scene and instance it:
	dock = preload("res://addons/game_export_dock/game_export_dock.tscn").instance()
	# Add the loaded scene to the docks:
	add_control_to_dock(DOCK_SLOT_LEFT_UL, dock)
	# Note that LEFT_UL means the left of the editor, upper-left dock
	exportapp = EditorExportPlugin.new()
	setup()
	pass
func _exit_tree():
	# Clean-up of the plugin goes here
	# Remove the scene from the docks:
	remove_control_from_docks(dock) # Remove the dock
	dock.free() # Erase the control from the memory
	pass