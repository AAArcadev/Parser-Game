extends Node2D

func _on_Hub_body_entered(body):
	if body.get_name()=="Player":
		$Camera2D.current=true
		
func _on_Hub_body_exited(body):
	if body.get_name()=="Player":
		$Camera2D.current=false
