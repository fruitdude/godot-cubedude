extends Spatial


var player1_score:= 0
var player2_score:= 0


func _on_GoalDetector_body_entered(body, goal_id):
	get_tree().call_group("Actors", "freeze")
	$Timer.start()
	update_score(goal_id)


func _on_Timer_timeout():
	get_tree().call_group("Actors", "reset")


func update_score(goal_id):
	var new_score
	
	match goal_id:
		1:
			player1_score += 1	
			new_score = player1_score
		2:
			player2_score += 1
			new_score = player2_score
			
	$GUI.update_score(goal_id, new_score)