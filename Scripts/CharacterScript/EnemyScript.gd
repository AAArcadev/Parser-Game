extends NinePatchRect

const BattleText = preload("res://Scenes/GUIScene/Response.tscn")

export var battleOn=false

export var maxHealth=20
export var Health=30
export var damage=5

export var enemy="none"
export var attackText=""
export var extraInfo=""
export var attackDamage=0

onready var historyRow= get_parent().get_node("TextBoxHolder/ScrollContainer/HistoryRows")
onready var textBoxHolder= get_parent().get_node("TextBoxHolder")
onready var cardHolder=get_parent().get_node("CardHolder")
onready var mapHolder=get_parent().get_node("MapBoxHolder2")

onready var enemyProgressBar=$EnemyProgressBar
onready var enemyProgressBarUnder=$EnemyProgressBarUnder

onready var forgivenessTextNum=0
onready var acceptanceTextNum=0
onready var hopeTextNum=0



func battleText(text):
	get_parent().get_node("TextBoxHolder").normalText(text)
	
func _physics_process(_delta):
	$EnemyProgressBar.max_value=maxHealth
	$EnemyProgressBar.value=Health
	$EnemyHealthNumber.text=String(Health)+"/"+String(maxHealth)
	if Health<0:
		Health=0
	
func checkDead():
	if enemy=="Ode o' the Past":
		if Health<=0:
			Health=10
			get_parent().get_node("MapBoxHolder2/AnimationPlayer").play("BattleFadeOut")
			get_parent().get_node("BattleBoxHolder").visible=false
			get_parent().get_node("TextBoxHolder/TextBoxInput/Input").editable=true
			cardHolder.cardsDown()
			get_parent().get_node("PlayerInfoHolder").Health=40
			get_parent().get_node("CardHolder/ChoiceCardHolder/HealCard").healthPotionNum=3
			get_parent().get_node("PlayerInfoHolder").odesCollected+=1
			battleText("You won! You overcame the pain of your past!")
			battleText("You [color=#7ea816]healed[/color] back to full health! ")
			get_parent().get_node("PlayerInfoHolder").attackStat+=1
			get_parent().get_node("PlayerInfoHolder").defenceStat+=2
			get_parent().get_node("PlayerInfoHolder").vitalityStat+=2
			battleText("Your [color=#d62954]ATTACK[/color], [color=#5657bf]DEFENCE[/color] and [color=#7ea816]ViTALITY[/color] went up!")
			
			battleOn=false
			
			MasterAudioControl.get_node("MainGameMusic").play()
			MasterAudioControl.get_node("OdesBattleMusic").stop()
		
	if enemy=="Guilt" or "Denial" or "Anger":
		if Health<=0:
			Health=10
			get_parent().get_node("MapBoxHolder2/AnimationPlayer").play("BattleFadeOut")
			get_parent().get_node("BattleBoxHolder").visible=false
			get_parent().get_node("TextBoxHolder/TextBoxInput/Input").editable=true
			cardHolder.cardsDown()
			get_parent().get_node("PlayerInfoHolder").Health=40
			get_parent().get_node("PlayerInfoHolder").attackStat+=2
			get_parent().get_node("CardHolder/ChoiceCardHolder/HealCard").healthPotionNum=3
			battleText("You won! You confronted your "+enemy+ " and overcame it!")
			battleOn=false
			battleText("You [color=#7ea816]healed[/color] back to full health!")
			battleText("Your [color=#d62954]ATTACK[/color] went up!")
				
	if enemy=="Forgiveness" or "Acceptance" or "Hope":
			if Health<=0:
				Health=10
				get_parent().get_node("MapBoxHolder2/AnimationPlayer").play("BattleFadeOut")
				get_parent().get_node("BattleBoxHolder").visible=false
				get_parent().get_node("TextBoxHolder/TextBoxInput/Input").editable=true
				cardHolder.cardsDown()
				get_parent().get_node("PlayerInfoHolder").Health=40
				get_parent().get_node("PlayerInfoHolder").attackStat+=2
				get_parent().get_node("CardHolder/ChoiceCardHolder/HealCard").healthPotionNum=3
				battleText("You won! You chose not to welcome " + enemy+ "and chose to stamp it out!")
				battleOn=false
				battleText("You [color=#7ea816]healed[/color] back to full health!")
				battleText("Your [color=#d62954]ATTACK[/color] went up!")
				get_parent().get_node("PlayerInfoHolder").badPoints+=1
				
	if enemy=="Forgiveness":
		if forgivenessTextNum==5:
			forgivenessTextNum=6
			get_parent().get_node("MapBoxHolder2/AnimationPlayer").play("BattleFadeOut")
			get_parent().get_node("BattleBoxHolder").visible=false
			get_parent().get_node("TextBoxHolder/TextBoxInput/Input").editable=true
			cardHolder.cardsDown()
			get_parent().get_node("PlayerInfoHolder").Health=40
			get_parent().get_node("PlayerInfoHolder").defenceStat+=2
			get_parent().get_node("PlayerInfoHolder").vitalityStat+=2
			get_parent().get_node("CardHolder/ChoiceCardHolder/HealCard").healthPotionNum=3
			battleText("You won! You chose to FORGIVE yourself!")
			battleOn=false
			battleText("You [color=#7ea816]healed[/color] back to full health!")
			battleText("Your [color=#5657bf]DEFENCE[/color] and [color=#7ea816]ViTALITY[/color] went up!")
			get_parent().get_node("PlayerInfoHolder").goodPoints+=1
			
	if enemy=="Acceptance":
		if acceptanceTextNum==5:
			acceptanceTextNum=6
			get_parent().get_node("MapBoxHolder2/AnimationPlayer").play("BattleFadeOut")
			get_parent().get_node("BattleBoxHolder").visible=false
			get_parent().get_node("TextBoxHolder/TextBoxInput/Input").editable=true
			cardHolder.cardsDown()
			get_parent().get_node("PlayerInfoHolder").Health=40
			get_parent().get_node("PlayerInfoHolder").defenceStat+=2
			get_parent().get_node("PlayerInfoHolder").vitalityStat+=2
			get_parent().get_node("CardHolder/ChoiceCardHolder/HealCard").healthPotionNum=3
			battleText("You won! You chose to ACCEPT what had happened and not blame yourself for it.")
			battleOn=false
			battleText("You [color=#7ea816]healed[/color] back to full health!")
			battleText("Your [color=#5657bf]DEFENCE[/color] and [color=#7ea816]ViTALITY[/color] went up!")
			get_parent().get_node("PlayerInfoHolder").goodPoints+=1
			
	if enemy=="Hope":
		if hopeTextNum==5:
			hopeTextNum=6
			get_parent().get_node("MapBoxHolder2/AnimationPlayer").play("BattleFadeOut")
			get_parent().get_node("BattleBoxHolder").visible=false
			get_parent().get_node("TextBoxHolder/TextBoxInput/Input").editable=true
			cardHolder.cardsDown()
			get_parent().get_node("PlayerInfoHolder").Health=40
			get_parent().get_node("PlayerInfoHolder").defenceStat+=2
			get_parent().get_node("PlayerInfoHolder").vitalityStat+=2
			battleText("You won! You chose to HOPE for better days!")
			get_parent().get_node("CardHolder/ChoiceCardHolder/HealCard").healthPotionNum=3
			battleOn=false
			battleText("You [color=#7ea816]healed[/color] back to full health!")
			battleText("Your [color=#5657bf]DEFENCE[/color] and [color=#7ea816]ViTALITY[/color] went up!")
			get_parent().get_node("PlayerInfoHolder").goodPoints+=1
	
	get_parent().get_node("PlayerInfoHolder").heal(100)
	get_parent().get_node("CardHolder/AnimationPlayer").play("RESET")
			
			
	if enemy=="none":
		$Enemy.visible=false
		$EnemyHealthNumber.visible=false
		$EnemyName.visible=false
		$EnemyProgressBar.visible=false
		
func runAway():
			get_parent().get_node("MapBoxHolder2").visible=true
			get_parent().get_node("BattleBoxHolder").visible=false
			get_parent().get_node("TextBoxHolder/TextBoxInput/Input").editable=true
			cardHolder.cardsDown()
			get_parent().get_node("PlayerInfoHolder").Health=40
			battleText("You ran away! But you can't keep running.")
			Health=0
			MasterAudioControl.get_node("MainGameMusic").play()
			MasterAudioControl.get_node("OdesBattleMusic").stop()
			
func damage(damageNo):
	Health-=damageNo
	attackDamage=damageNo
	$Tween.interpolate_property(enemyProgressBarUnder,"value",enemyProgressBarUnder.value,Health,0.4,Tween.TRANS_SINE)
	$Tween.start()
	$Enemy/AnimationPlayer.play("Hurt")
	
	
func enemyTurn():
	get_parent().get_node("TextBoxHolder/TextBoxInput/Input").editable=false
	if enemy=="Ode o' the Past":
		if Health>0:
			odesOfPastEnemyTurn()
		else:
			checkDead()
	if enemy=="Guilt":
		if Health>0:
			guiltEnemyTurn()
		else:
			checkDead()
	if enemy=="Forgiveness":
		if Health>0:
			forgivenessEnemyTurn()
		else:
			checkDead()
	if enemy=="Denial":
		if Health>0:
			denialEnemyTurn()
		else:
			checkDead()
	if enemy=="Acceptance":
		if Health>0:
			acceptanceEnemyTurn()
		else:
			checkDead()
	if enemy=="Anger":
		if Health>0:
			angerEnemyTurn()
		else:
			checkDead()
	if enemy=="Hope":
		if Health>0:
			hopeEnemyTurn()
		else:
			checkDead()
		
func playerBattleTurn():
	get_parent().get_node("CardHolder").randomizeAttackNo()
		
func odesOfPastBattleStart():
	visible=true
	battleOn=true
	mapHolder.visible=false
	textBoxHolder.get_node("TextBoxInput/Input").editable=false
	$Enemy.visible=true
	$Enemy.animation="OdesOfThePast"
	$EnemyHealthNumber.visible=true
	$EnemyName.visible=true
	$EnemyName.text="Ode o' the Past"
	enemy="Ode o' the Past"
	$EnemyProgressBar.visible=true
	maxHealth=30
	Health=30
	$EnemyProgressBarUnder.max_value=maxHealth
	$EnemyProgressBarUnder.value=Health
	damage=floor(rand_range(2,7))
	cardHolder.cardsUp()
	playerBattleTurn()

func odesOfPastEnemyTurn():
	var guiltAttackText=[" attacked Edie emotionally"," bumped into Edie"," hit Edie"]
	
	attackText=String(guiltAttackText[floor(rand_range(0,3))])
	extraInfo=", and did [color=#d62954]%s[/color]"%String(damage-(floor(damage*(get_parent().get_node("PlayerInfoHolder").defenceStat/100))))+" amount of damage!"
	get_parent().get_node("PlayerInfoHolder").damage(damage-(damage*(get_parent().get_node("PlayerInfoHolder").defenceStat/100)))
	MasterAudioControl.get_node("PlayerHurt").play()
	
	battleText("[color=#c720e0]%s[/color]"%enemy+attackText+extraInfo)
	get_parent().get_node("Camera2D").shake(0.2,3000,1)
	playerBattleTurn()
	
func guiltBattleStart():
	visible=true
	battleOn=true
	mapHolder.visible=false
	textBoxHolder.get_node("TextBoxInput/Input").editable=false
	$Enemy.visible=true
	$Enemy.animation="Guilt"
	$EnemyHealthNumber.visible=true
	$EnemyName.visible=true
	$EnemyName.text="Guilt"
	enemy="Guilt"
	$EnemyProgressBar.visible=true
	maxHealth=45
	Health=45
	$EnemyProgressBarUnder.max_value=maxHealth
	$EnemyProgressBarUnder.value=Health
	damage=floor(rand_range(5,15))
	cardHolder.cardsUp()
	playerBattleTurn()
	
func guiltEnemyTurn():
	var guiltAttackText=[" attacked Edie emotionally"," bumped into Edie"," hit Edie"]
	
	attackText=String(guiltAttackText[floor(rand_range(0,3))])
	extraInfo=", and did [color=#d62954]%s[/color]"%String(damage-(floor(damage*(get_parent().get_node("PlayerInfoHolder").defenceStat/100))))+" amount of damage!"
	get_parent().get_node("PlayerInfoHolder").damage(damage-(damage*(get_parent().get_node("PlayerInfoHolder").defenceStat/100)))
	MasterAudioControl.get_node("PlayerHurt").play()
	
	battleText("[color=#c720e0]%s[/color]"%enemy+attackText+extraInfo)
	get_parent().get_node("Camera2D").shake(0.2,3000,1)
	playerBattleTurn()
	
func forgivenessBattleStart():
	visible=true
	battleOn=true
	mapHolder.visible=false
	textBoxHolder.get_node("TextBoxInput/Input").editable=false
	$Enemy.visible=true
	$Enemy.animation="Forgiveness"
	$EnemyHealthNumber.visible=true
	$EnemyName.visible=true
	$EnemyName.text="Forgiveness"
	enemy="Forgiveness"
	$EnemyProgressBar.visible=true
	maxHealth=45
	Health=45
	$EnemyProgressBarUnder.max_value=maxHealth
	$EnemyProgressBarUnder.value=Health
	damage=floor(rand_range(5,15))
	cardHolder.cardsUp()
	playerBattleTurn()

func forgivenessEnemyTurn():
	var forgivenessText=[" attacked Edie emotionally"," bumped into Edie"," hit Edie"]
	
	attackText=String(forgivenessText[forgivenessTextNum])
	forgivenessTextNum+=1
	
	battleText("[color=#30cecd]%s[/color]"%enemy+attackText)
	playerBattleTurn()

func denialBattleStart():
	visible=true
	battleOn=true
	mapHolder.visible=false
	textBoxHolder.get_node("TextBoxInput/Input").editable=false
	$Enemy.visible=true
	$Enemy.animation="Denial"
	$EnemyHealthNumber.visible=true
	$EnemyName.visible=true
	$EnemyName.text="Denial"
	enemy="Denial"
	$EnemyProgressBar.visible=true
	maxHealth=45
	Health=45
	$EnemyProgressBarUnder.max_value=maxHealth
	$EnemyProgressBarUnder.value=Health
	damage=floor(rand_range(5,15))
	cardHolder.cardsUp()
	playerBattleTurn()
	
func denialEnemyTurn():
	var denialAttackText=[" attacked Edie emotionally"," bumped into Edie"," hit Edie"]
	
	attackText=String(denialAttackText[floor(rand_range(0,3))])
	extraInfo=", and did [color=#d62954]%s[/color]"%String(damage-(floor(damage*(get_parent().get_node("PlayerInfoHolder").defenceStat/100))))+" amount of damage!"
	get_parent().get_node("PlayerInfoHolder").damage(damage)
	MasterAudioControl.get_node("PlayerHurt").play()
	
	battleText("[color=#7ea816]%s[/color]"%enemy+attackText+extraInfo)
	get_parent().get_node("Camera2D").shake(0.2,3000,1)
	playerBattleTurn()
	
func acceptanceBattleStart():
	visible=true
	battleOn=true
	mapHolder.visible=false
	textBoxHolder.get_node("TextBoxInput/Input").editable=false
	$Enemy.visible=true
	$Enemy.animation="Acceptance"
	$EnemyHealthNumber.visible=true
	$EnemyName.visible=true
	$EnemyName.text="Acceptance"
	enemy="Acceptance"
	$EnemyProgressBar.visible=true
	maxHealth=45
	Health=45
	$EnemyProgressBarUnder.max_value=maxHealth
	$EnemyProgressBarUnder.value=Health
	damage=floor(rand_range(5,15))
	cardHolder.cardsUp()
	playerBattleTurn()

func acceptanceEnemyTurn():
	var acceptanceText=[" attacked Edie emotionally"," bumped into Edie"," hit Edie"]
	
	attackText=String(acceptanceText[acceptanceTextNum])
	acceptanceTextNum+=1
	
	battleText("[color=#f9499c]%s[/color]"%enemy+attackText)
	playerBattleTurn()

func angerBattleStart():
	visible=true
	battleOn=true
	mapHolder.visible=false
	textBoxHolder.get_node("TextBoxInput/Input").editable=false
	$Enemy.visible=true
	$Enemy.animation="Anger"
	$EnemyHealthNumber.visible=true
	$EnemyName.visible=true
	$EnemyName.text="Anger"
	enemy="Anger"
	$EnemyProgressBar.visible=true
	maxHealth=45
	Health=45
	$EnemyProgressBarUnder.max_value=maxHealth
	$EnemyProgressBarUnder.value=Health
	damage=floor(rand_range(5,15))
	cardHolder.cardsUp()
	playerBattleTurn()
	
func angerEnemyTurn():
	var angerAttackText=[" attacked Edie emotionally"," bumped into Edie"," hit Edie"]
	
	attackText=String(angerAttackText[floor(rand_range(0,3))])
	extraInfo=", and did [color=#d62954]%s[/color]"%String(damage-(floor(damage*(get_parent().get_node("PlayerInfoHolder").defenceStat/100))))+" amount of damage!"
	get_parent().get_node("PlayerInfoHolder").damage(damage-(damage*(get_parent().get_node("PlayerInfoHolder").defenceStat/100)))
	MasterAudioControl.get_node("PlayerHurt").play()
	
	battleText("[color=#d62954]%s[/color]"%enemy+attackText+extraInfo)
	get_parent().get_node("Camera2D").shake(0.2,3000,1)
	playerBattleTurn()
	
func hopeBattleStart():
	visible=true
	battleOn=true
	mapHolder.visible=false
	textBoxHolder.get_node("TextBoxInput/Input").editable=false
	$Enemy.visible=true
	$Enemy.animation="Hope"
	$EnemyHealthNumber.visible=true
	$EnemyName.visible=true
	$EnemyName.text="Hope"
	enemy="Hope"
	$EnemyProgressBar.visible=true
	maxHealth=45
	Health=45
	$EnemyProgressBarUnder.max_value=maxHealth
	$EnemyProgressBarUnder.value=Health
	damage=floor(rand_range(5,15))
	cardHolder.cardsUp()
	playerBattleTurn()

func hopeEnemyTurn():
	var hopeText=[" attacked Edie emotionally"," bumped into Edie"," hit Edie"]
	
	attackText=String(hopeText[hopeTextNum])
	hopeTextNum+=1
	
	battleText("[color=#fdd043]%s[/color]"%enemy+attackText)
	playerBattleTurn()
