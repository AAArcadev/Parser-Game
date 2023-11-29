extends Sprite

var canWork=false
var isDown=true
var canClick=true

func pullUp():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position",
		Vector2(58, 61), Vector2(58, 47.811), 0.4,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func pullDown():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position",
		Vector2(58, 47.811), Vector2(58, 61), 0.4,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
func _physics_process(_delta):
	if get_parent().get_parent().canPick==true:
		if Input.is_action_just_pressed("LeftMouseButton") and canWork==true and isDown==true and canClick==true:
			canClick=!canClick
			MasterAudioControl.get_node("CardSelect").play()
			get_parent().get_parent().get_parent().get_node("BattleBoxHolder").runAway()
			MasterAudioControl.get_node("RunAway").play()

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
