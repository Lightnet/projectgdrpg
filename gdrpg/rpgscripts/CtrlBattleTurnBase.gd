extends Control

var bPlayerTurn = true
var bEnemyTurn = false

func _ready():
	pass
	
func CheckTurns():
	
	var characters = get_tree().get_root().get_node("Main").find_node("Characters").get_children()
	
	var pawnturncount = 0
	var pawntotal = 0
	#var playerturn = false
	#var enemyturn = false
	
	for pawn in characters:
		pawntotal += 1
		if pawn.IsEndTurn == true:
			pawnturncount += 1
			#pass
			
	#if pawnturncount == 0:
		#pass
		
	if bEnemyTurn:
		BotAttack()
		
	if pawntotal == pawnturncount:
		print("RESET TURN")
		ResetTurn()
		
	
	pass
	
func ResetTurn():
	var characters = get_tree().get_root().get_node("Main").find_node("Characters").get_children()
	for pawn in characters:
		pawn.IsEndTurn = false
		
	bPlayerTurn = true
	#pass
	
func BotAttack():
	var player = null
	var enemy = null 
	var characters = get_tree().get_root().get_node("Main").find_node("Characters").get_children()
	#print(characters )
	for N in characters:
		#print(N)
		#print(N.TeamID)
		if N.TeamID == 1:
			player = N
			#pass
		else:
			enemy = N
	#pass
	if player !=null and enemy !=null:
		if enemy.IsDead == true:
			return
		#enemy.status.health = enemy.status.health - player.status.attack
		enemy.IsEndTurn = true
		player.OnDamage(enemy.status.attack,null)
		pass
		
	bEnemyTurn = false
	
	CheckTurns()
	#pass
	
	
func Attack():
	var player = null
	var enemy = null 
	var characters = get_tree().get_root().get_node("Main").find_node("Characters").get_children()
	#print(characters )
	for N in characters:
		#print(N)
		#print(N.TeamID)
		if N.TeamID == 1:
			player = N
			#pass
		else:
			enemy = N
	#pass
	if player !=null and enemy !=null:
		if player.IsDead == true:
			return
		#enemy.status.health = enemy.status.health - player.status.attack
		player.IsEndTurn = true
		enemy.OnDamage(player.status.attack,null)
		#pass
		
	bPlayerTurn = false
	bEnemyTurn = true
	CheckTurns()
	
	
func _on_BtnAction_pressed():
	
	pass # replace with function body


func _on_BtnMove_pressed():
	pass # replace with function body


func _on_BtnAttack_pressed():
	Attack()
	pass # replace with function body


func _on_BtnDefense_pressed():
	pass # replace with function body


func _on_BtnSkills_pressed():
	pass # replace with function body


func _on_BtnItems_pressed():
	pass # replace with function body


func _on_BtnEnd_pressed():
	pass # replace with function body


func _on_BtnEscape2_pressed():
	pass # replace with function body
