extends Node

onready var textBox=get_parent().get_node("TextBoxHolder")

func _ready():
	MasterAudioControl.get_node("MainGameMusic").play()
	textBox.normalText("It’s not often you find yourself face to face with your worst nightmare. "
							+"You swore you'd never come back here ever again, yet here you are. Sadie’s " 
							+" bedroom, despite being right besides your's, might as well be miles away for all you could care. "
							+"Her peeling pink patterned wall. Her matching bed tucked away in the "
							+ "corner, and her old study desk, usually unkempt but this time there is A LONE"
							+" BOOK ON IT. HER DIARY. All brought an overwhelming feeling of guilt to you.")
