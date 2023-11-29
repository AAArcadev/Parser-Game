extends Camera2D

var target=null

onready var mapTarget=get_parent().get_node("MapWorld/Position2D")

func _physics_process(_delta):
	if target:
		position=target.position
		
func _ready():
	target=mapTarget
