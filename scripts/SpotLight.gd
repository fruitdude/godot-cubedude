extends SpotLight


func _ready():
	hide()
	
	
func freeze(player):
	var player1 = get_tree().get_root().find_node("Player1", true, false)
	var player2 = get_tree().get_root().find_node("Player2", true, false)
	
	var target
	
	if player == 1:
		target = player1.translation
	else:
		target = player2.translation
		
	look_at(target, Vector3.UP)
	show()
	
	
func reset():
	hide()