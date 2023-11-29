extends Sprite

var canWork=false
var isDown=true
export var canClick=true

func pullUp():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position",
		Vector2(-36.028, 57.924), Vector2(-36.028, 37.933), 0.4,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func pullDown():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position",
		Vector2(-36.028, 37.933), Vector2(-36.028, 57.924), 0.4,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
	
func _physics_process(delta):
	if get_parent().get_parent().canPick==true:
		if Input.is_action_just_pressed("LeftMouseButton") and canWork==true and isDown==true and canClick==true:
			canClick=!canClick
			get_parent().get_parent().get_node("AnimationPlayer").play("ExchangeAttack")
			MasterAudioControl.get_node("CardSelect").play()
	
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

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=="ExchangeAttackReverse":
		canClick=true
