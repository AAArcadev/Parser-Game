extends Sprite

export var InstrOn=false
export var canInstrOn=false

func _physics_process(delta):
	if Input.is_action_just_pressed("LeftMouseButton") and canInstrOn==true:
		$InstructionPage.visible=!$InstructionPage.visible

func _on_Area2D_mouse_entered():
	canInstrOn=true

func _on_Area2D_mouse_exited():
	canInstrOn=false
