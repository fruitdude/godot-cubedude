extends Spatial


func _on_GoalDetector_body_entered(body, goal_id):
	get_tree().call_group("Actors", "freeze")
	$Timer.start()


func _on_Timer_timeout():
	get_tree().call_group("Actors", "reset")
