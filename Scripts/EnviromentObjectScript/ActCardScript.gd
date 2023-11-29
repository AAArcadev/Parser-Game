extends Sprite

var canWork=false
var isDown=true
var canClick=true

func pullUp():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position",
		Vector2(-3.591, 51.914), Vector2(-3.591, 36.921), 0.4,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func pullDown():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position",
		Vector2(-3.591, 36.921), Vector2(-3.591, 51.914), 0.4,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

	
func _physics_process(_delta):
	if get_parent().get_parent().canPick==true:
		if Input.is_action_just_pressed("LeftMouseButton") and canWork==true and isDown==true and canClick==true:
			canClick=!canClick
			MasterAudioControl.get_node("CardSelect").play()
			$Timer.start()

func _on_Area2D_mouse_entered():
	if get_parent().get_parent().canPick==true:
		pullUp()
		canWork=true
		MasterAudioControl.get_node("CardSlide").play()

func _on_Area2D_mouse_exited():
	if get_parent().get_parent().canPick==true:
		pullDown()
		canWork=false
		MasterAudioControl.get_node("CardSlide").play()

func _on_Timer_timeout():
	get_parent().get_parent().get_parent().get_node("BattleBoxHolder").enemyTurn()
	$Timer.stop()
