extends Control


var Campaign = preload("res://Interfaces/menucampaign.tscn")
var menuCampaign

var Training = preload("res://Interfaces/menutraining.tscn")
var menuTraining

var Multiplayer = preload("res://Interfaces/menumultiplayer.tscn")
var menuMultiplayer

var Options = preload("res://Interfaces/menuoptions.tscn")
var menuOptions

func _ready():
	pass
func _checkmenu(path, objclass, value):
	if value == null:
		value = objclass.instance()
		value.show()
		get_parent().add_child(value)
	else:
		value = get_node(path)
		value.show()
	hide()
func _on_BtnCampaign_pressed():
	_checkmenu("../ctrl_menucampaign", Campaign, menuCampaign)
	
func _on_BtnTraining_pressed():
	_checkmenu("../ctrl_menutraing", Training, menuTraining)
	
func _on_BtnMultiplayers_pressed():
	_checkmenu("../ctrl_menumultiplayer", Multiplayer, menuMultiplayer)
	
func _on_BtnOptions_pressed():
	_checkmenu("../ctrl_menuoptions", Options, menuOptions)
	
func _on_BtnQuit_pressed():
	var wd_q = get_node("WDQuit")
	wd_q.popup_centered()
	
func _on_QuitBtnOkay_pressed():
	get_tree().quit()
	
func _on_QuitBtnCancel_pressed():
	var wd_q = get_node("WDQuit")
	wd_q.hide()
