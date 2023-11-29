extends ColorRect



func _on_getUpButton_pressed():
	get_tree().paused=false
	visible=false
	get_parent().get_parent().get_node("PlayerInfoHolder").heal(100)
	get_parent().get_parent().get_node("BattleBoxHolder").Health=get_parent().get_parent().get_node("BattleBoxHolder").maxHealth

func _on_GiveUpButton_pressed():
	get_tree().quit()
