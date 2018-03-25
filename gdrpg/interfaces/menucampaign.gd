extends Control

func _ready():
	pass
	
func _on_BtnBack_pressed():
	hide()
	get_parent().get_node("ctrl_mainmenu").show()
	pass # replace with function body
