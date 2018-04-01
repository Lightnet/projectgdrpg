tool
extends EditorPlugin

#var dock # A class member to hold the dock during the plugin lifecycle
#var exportapp #= EditorExportPlugin.new()

var export_plugin

func _init():
	print("init export?")
	pass

func setup():
	#var btnload = dock.get_node("BtnExport")
	#btnload.connect("pressed", self, "pressload")
	pass

func _enter_tree():
	# Initialization of the plugin goes here
	# First load the dock scene and instance it:
	#dock = preload("res://addons/game_export_dock/game_export_dock.tscn").instance()
	# Add the loaded scene to the docks:
	#add_control_to_dock(DOCK_SLOT_LEFT_UL, dock)
	# Note that LEFT_UL means the left of the editor, upper-left dock
	#exportapp = EditorExportPlugin.new()
	export_plugin = preload("export_plugin.gd").new()
	add_export_plugin(export_plugin)
	#setup()
	pass

func _exit_tree():
	# Clean-up of the plugin goes here
	# Remove the scene from the docks:
	#remove_control_from_docks(dock) # Remove the dock
	#dock.free() # Erase the control from the memory
	remove_export_plugin(export_plugin)
	export_plugin = null
	pass