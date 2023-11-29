extends Node2D

var canWork=false
var canClick=true

onready var battleBox=get_parent().get_parent().get_parent().get_node("BattleBoxHolder")

func pullUp():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position",
		Vector2(26, 53), Vector2(26, 38.828), 0.4,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
	
func pullDown():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position",
		Vector2(26, 38.828), Vector2(26, 53), 0.4,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	canClick=!canClick
	
	
func _physics_process(_delta):
	if get_parent().get_parent().canPick==true:
		if Input.is_action_just_pressed("LeftMouseButton") and canWork==true and canClick==true:
			get_parent().get_parent().get_parent().get_node("BattleBoxHolder").damage(int($AttackNoCardFront/DamageNo.text)+get_parent().get_parent().get_parent().get_node("PlayerInfoHolder").attackStat)
			battleBox.battleText("You attacked "+battleBox.enemy+" ,you did [color=#d62954]%s[/color]"% String((int($AttackNoCardFront/DamageNo.text)+get_parent().get_parent().get_parent().get_node("PlayerInfoHolder").attackStat))+" amount of damage!")
			battleBox.get_node("Enemy").shake(0.2,3000,0.7)
			$AnimationPlayer.play("Flip")
			canClick=!canClick
			MasterAudioControl.get_node("CardSelect").play()
			$Timer.start()
			MasterAudioControl.get_node("Attack").play()
	
func _on_Card3Area2D_mouse_entered():
	if get_parent().get_parent().canPick==true:
		pullUp()
		canWork=true
		MasterAudioControl.get_node("CardSlide").play()

func _on_Card3Area2D_mouse_exited():
	if get_parent().get_parent().canPick==true:
		pullDown()
		canWork=false
		MasterAudioControl.get_node("CardSlide").play()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=="Flip":
		if battleBox.battleOn==true:
			get_parent().get_parent().get_node("AnimationPlayer").play("ExchangeAttackReverse")
		$AnimationPlayer.play("FlipReverse")
	if anim_name=="ExchangeAttackReverse":
		canClick=true

func _on_Timer_timeout():
	get_parent().get_parent().get_parent().get_node("BattleBoxHolder").enemyTurn()
	$Timer.stop()
