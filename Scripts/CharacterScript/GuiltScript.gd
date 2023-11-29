extends AnimatedSprite

onready var textBox=get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("TextBoxHolder")
onready var battleBox=get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("BattleBoxHolder")

func _on_Area2D_body_entered(body):
	if body.get_name()=="Player":
		textBox.normalText("You encountered [color=#c720e0]Guilt[/color]!")
		battleBox.guiltBattleStart()
		queue_free()
