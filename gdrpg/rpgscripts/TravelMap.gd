#extends Node

export var MapName = ""
export var MapScene = ""
export var MapPoint = ""

func _get_property_list():
    return [
        {
            "name": "Prop1",
            "type": TYPE_STRING,
            "usage": PROPERTY_USAGE_STORAGE
        },
        {
            "name": "Prop2",
            "type": TYPE_VECTOR2,
            "usage": PROPERTY_USAGE_STORAGE
        },
        {
            "name": "Prop3",
            "type": TYPE_INT,
            "usage": PROPERTY_USAGE_STORAGE
        }
    ]

#func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
