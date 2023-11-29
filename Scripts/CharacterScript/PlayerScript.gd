extends KinematicBody2D

var northCanMove=false
var southCanMove=false
var westCanMove=false
var eastCanMove=false

func moveNorth(times):
	while times>0:
			position.y-=8
			times-=1
		
func moveSouth(times):
	while times>0:
			position.y+=8
			times-=1
		
func moveWest(times):
	get_node("EdieCharacter").flip_h=true
	while times>0:
			position.x-=8
			times-=1
		
func moveEast(times):
	get_node("EdieCharacter").flip_h=false
	while times>0:
			position.x+=8
			times-=1


func _on_NorthCheckArea_body_entered(body):
	if body.get_name()=="PlayerCollision":
		northCanMove=false

func _on_NorthCheckArea_body_exited(body):
	if body.get_name()=="PlayerCollision":
		northCanMove=true


func _on_EastCheckArea_body_entered(body):
	if body.get_name()=="PlayerCollision":
		eastCanMove=false

func _on_EastCheckArea_body_exited(body):
	if body.get_name()=="PlayerCollision":
		eastCanMove=true


func _on_WestCheckArea_body_entered(body):
	if body.get_name()=="PlayerCollision":
		westCanMove=false

func _on_WestCheckArea_body_exited(body):
	if body.get_name()=="PlayerCollision":
		westCanMove=true


func _on_SouthCheckArea_body_entered(body):
	if body.get_name()=="PlayerCollision":
		eastCanMove=false

func _on_SouthCheckArea_body_exited(body):
	if body.get_name()=="PlayerCollision":
		eastCanMove=true

func indicatorOn():
	$PlayerIndicator.visible=true

func indicatorOff():
	$PlayerIndicator.visible=false
