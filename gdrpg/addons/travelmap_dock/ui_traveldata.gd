extends Control

func _init():
	#add_export_plugin(SomeFrameworkExportPlugin.new())
	print("init ??????")
	pass

func _ready():
	print("travel data????")
	pass

static func set_data(text,data):
	
	var textname = get_node("LEName")
	textname.text = text
	
	var pathname = get_node("LEPath")
	pathname.text = data["mappath"]
	
	var pointname = get_node("LEPoint")
	pointname.text = data["mappath"]
	
	pass