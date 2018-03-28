extends KinematicBody

# You may need to adjust depending on the sensitivity of your mouse
const MOUSE_SENSITIVITY = 0.05

var view_sensitivity = 0.10
const ACCEL= 2
const DEACCEL= 4
const MAX_SPEED = 10
slave var slave_vel = Vector3()

export (float) var TeamID = 0
export (float) var PartyID = 0

export (bool) var bController = false
export (bool) var bTurnBase = false


var progressbar
var count = 0
var statusClass = preload("res://rpgscripts/status.gd")
var status = statusClass.new()

export (bool) var IsDead = false
export (bool) var IsEndTurn = false










func movecheck(delta):
	var dir = Vector3() # Where does the player intend to walk to
	var xform = get_global_transform()
	
	if Input.is_action_pressed("Up"):
		dir += -xform.basis[2]
		pass
	if Input.is_action_pressed("Down"):
		dir += xform.basis[2]
		pass
	if Input.is_action_pressed("Left"):
		dir -= xform.basis[0]
		pass
	if Input.is_action_pressed("Right"):
		dir += xform.basis[0]
		pass
	dir.y = 0
	dir = dir.normalized()
	var hvel = slave_vel
	hvel.y = 0
	var target = dir*MAX_SPEED
	var accel
	if dir.dot(hvel) > 0:
		accel = ACCEL
	else:
		accel = DEACCEL
	hvel = hvel.linear_interpolate(target, accel*delta)
	slave_vel.x = hvel.x
	slave_vel.z = hvel.z
	
	move_and_collide(slave_vel*delta)
	
	
	pass

func do_the_printing(body):
   print("collision hapened")


func _ready():
	progressbar = get_node("Viewport/Control2/ProgressBar")
	#print(status)
	status = statusClass.new()
	#connect("body_entered",self,"do_the_printing")
	pass
	
func _input(event):
	
	if event.is_action_pressed("Escape"):
		get_tree().quit()
		pass
	
	if bController == false:
		
		pass
	pass
	
func _physics_process(delta):
	
	
	movecheck(delta)
	
	#if is_colliding():
		#print("K collision")
	
	
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	#count += 1
	#if count > 100:
		#count = 0
	#progressbar.value = count
	pass
	
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
	
	
	