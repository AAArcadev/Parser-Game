extends Area2D

export var canSend=false 
onready var textBox=get_parent().get_parent().get_parent().get_parent().get_parent().get_node("TextBoxHolder")

var text=""

func textSend(textInput):
	$Timer.start()
	text=textInput

func textSendActual(textInput):
		if canSend==true:
			if textInput=="bed":
				textBox.normalText("It's Sadie's old bed")
			
func _on_TextTimeliner_body_entered(body):
	if body.get_name()=="Player":
		canSend=true
		body.indicatorOn()

func _on_TextTimeliner_body_exited(body):
	if body.get_name()=="Player":
		canSend=false
		body.indicatorOff()

func _on_Timer_timeout():
	textSendActual(text)
	$Timer.stop()
