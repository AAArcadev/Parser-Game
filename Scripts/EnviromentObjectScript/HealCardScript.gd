extends Sprite

var canWork=false
var isDown=true
var canClick=true
var healthPotionNum=3

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
	$PotionNum.text=String(healthPotionNum)
	if get_parent().get_parent().canPick==true:
		if Input.is_action_just_pressed("LeftMouseButton") and canWork==true and isDown==true and canClick==true:
			var healNum=15+(15*(get_parent().get_parent().get_parent().get_node("PlayerInfoHolder").vitalityStat/100))
			canClick=!canClick
			get_parent().get_parent().get_parent().get_node("TextBoxHolder").normalText("You calmed down and reaffirmed yourself. You [color=#7ea816]healed[/color] for "+String(healNum)+"HP!")
			$Timer.start()
			get_parent().get_parent().get_parent().get_node("PlayerInfoHolder").heal(healNum)
			MasterAudioControl.get_node("CardSelect").play()
			
			if healthPotionNum>0:
				healthPotionNum-=1
			if healthPotionNum<=0:
				get_parent().get_parent().get_parent().get_node("TextBoxHolder").normalText("You can't heal up again!")
		
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
