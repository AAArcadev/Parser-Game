extends Node2D

var maxHealth=25
var Health=25

export var hasKey=false

export var attackStat=5
export var defenceStat=10
export var speedStat=20
export var vitalityStat=0

export var odesCollected=0
export var goodPoints=0
export var badPoints=0

onready var PlayerHealthBar=get_node("PlayerHealthBar")
onready var PlayerHealthBarUnder=get_node("PlayerHealthBarUnder")

func _physics_process(_delta):
	PlayerHealthBar.max_value=25
	$PlayerHealthBar/HPNum.text=String(Health)+"/"+String(maxHealth)
	get_parent().get_node("StatBoxHolder/AttackStat").text="Attack: +"+String(attackStat)
	get_parent().get_node("StatBoxHolder/DefenceStat").text="Defence: "+String(defenceStat)
	get_parent().get_node("StatBoxHolder/SpeedStat").text="Speed: "+String(speedStat)
	get_parent().get_node("StatBoxHolder/VitalityStat").text="Vitality: +"+String(vitalityStat)
	if Health>25:
		Health=25
	if Health<=0:
		Health=10
		get_parent().get_node("CanvasLayer/GameOverScreen").visible=true
		get_tree().paused=true
	

func damage(damageNo):
	Health-=(damageNo-(floor(damageNo*(defenceStat/100))))
	PlayerHealthBar.value=Health
	$PlayerFace.animation="Hurt"
	$PlayerHealthBar/Tween.interpolate_property(PlayerHealthBarUnder,"value",PlayerHealthBarUnder.value,Health,0.4,Tween.TRANS_SINE)
	$PlayerHealthBar/Tween.start()

func heal(healNum):
	Health+=healNum
	$PlayerHealthBar/Tween.interpolate_property(PlayerHealthBar,"value",PlayerHealthBar.value,Health,0.4,Tween.TRANS_SINE)
	$PlayerHealthBar/Tween.start()
	MasterAudioControl.get_node("Heal").play()
	$PlayerFace.animation="Heal"
	
	
func _on_PlayerFace_animation_finished():
	if $PlayerFace.animation=="Hurt":
		$PlayerFace.animation="default"
	if $PlayerFace.animation=="Heal":
		$PlayerFace.animation="default"
