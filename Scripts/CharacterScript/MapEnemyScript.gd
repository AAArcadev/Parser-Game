extends Sprite

onready var textBox=get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("TextBoxHolder")
onready var battleBox=get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("BattleBoxHolder")
onready var mapBox=get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("MapBoxHolder2")

func _on_Area2D_body_entered(body):
	if body.get_name()=="Player":
		mapBox.get_node("AnimationPlayer").play("BattleFadeIn")
		queue_free()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=="BattleFadeIn":
		textBox.normalText("You encountered an [color=#c720e0]Ode o' the Past![/color]")
		battleBox.odesOfPastBattleStart()
		MasterAudioControl.get_node("MainGameMusic").stop()
		MasterAudioControl.get_node("OdesBattleMusic").play()
		
