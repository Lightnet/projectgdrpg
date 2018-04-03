tool
extends EditorPlugin

var dock # A class member to hold the dock during the plugin lifecycle
var label = null

func get_name():
    return "Job"
    
func _init():
	print("Plugin init!")
	pass
    
func _enter_tree():
	# Initialization of the plugin goes here
	# First load the dock scene and instance it:
	dock = preload("res://addons/job_dock/job_dock.tscn").instance()
	# Add the loaded scene to the docks:
	add_control_to_dock(DOCK_SLOT_LEFT_UL, dock)
	# Note that LEFT_UL means the left of the editor, upper-left dock
    #setup()
    
	label = Label.new()
	label.set_text("Hello World")
	add_custom_type(CONTAINER_TOOLBAR, label)
	#add_custom_control(CONTAINER_TOOLBAR, label)
	pass
	
func _exit_tree():
	# Clean-up of the plugin goes here
	# Remove the scene from the docks:
	remove_control_from_docks(dock) # Remove the dock
	dock.free() # Erase the control from the memory
	pass