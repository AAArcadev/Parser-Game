extends Node2D

func _physics_process(delta):
	if Input.is_action_just_pressed("enterKey"):
		$ColorRect/AnimationPlayer.play("fadeIn")
		MasterAudioControl.get_node("StartButton").play()
		$AudioStreamPlayer.volume_db=lerp(-4.952,-80,0.2)
		
func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/MainScene/MainGame.tscn")
