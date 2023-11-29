extends Node2D

export var canPick= false
export var attackDamage=0

onready var textBox=get_parent().get_node("TextBoxHolder")

func randomizeAttackNo():
	$AttackCardHolder/AttackCard1/AttackNoCardFront/DamageNo.text=String(floor(rand_range(0,15)))
	$AttackCardHolder/AttackCard2/AttackNoCardFront/DamageNo.text=String(floor(rand_range(0,15)))
	$AttackCardHolder/AttackCard3/AttackNoCardFront/DamageNo.text=String(floor(rand_range(0,15)))
	$AttackCardHolder/AttackCard4/AttackNoCardFront/DamageNo.text=String(floor(rand_range(0,15)))

func cardsUp():
	canPick=true
	$AnimationPlayer.play("CardsUp")
	textBox.handle_scrollbar_changed()

func cardsDown():
	canPick=false
	$AnimationPlayer.play("CardsDown")
	textBox.handle_scrollbar_changed()
