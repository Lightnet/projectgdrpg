extends KinematicBody

export (float) var TeamID = 0
export (float) var PartyID = 0



var progressbar
var count = 0
var statusClass = preload("res://rpgscripts/status.gd")
var status = statusClass.new()

export (bool) var IsDead = false
export (bool) var IsEndTurn = false

func _ready():
	progressbar = get_node("Viewport/Control2/ProgressBar")
	#print(status)
	status = statusClass.new()
	pass


func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	count += 1
	if count > 100:
		count = 0
	#progressbar.value = count
	#pass
	
func OnDamage(damage, DamageClass):
	if status.health <= 0:
		return
	status.health = status.health - damage
	progressbar.value = round((status.health/100.0)*100)
	print((status.health/100.0)*100)
	#print(status.health)
	#print(progressbar.value)
	if status.health <= 0:
		status.health = 0
		IsDead = true
	pass
	
func CheckDeath():
	return IsDead
	
	
	