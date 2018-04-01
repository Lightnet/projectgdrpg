#http://docs.godotengine.org/en/3.0/tutorials/plugins/editor/import_plugins.html

# material_import.gd
tool
extends EditorPlugin

var import_plugin

func _enter_tree():
	import_plugin = preload("import_plugin.gd").new()
	add_import_plugin(import_plugin)

func _exit_tree():
	remove_import_plugin(import_plugin)
	import_plugin = null