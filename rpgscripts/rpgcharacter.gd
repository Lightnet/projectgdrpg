extends KinematicBody

var progressbar
var count = 0

func _ready():
	progressbar = get_node("Viewport/Control2/ProgressBar")
	pass


func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	count += 1
	if count > 100:
		count = 0
	progressbar.value = count
	pass