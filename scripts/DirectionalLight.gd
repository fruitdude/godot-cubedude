extends DirectionalLight


func _ready():
	reset()


func freeze(id):
	$AnimationPlayer.play("fade")
	
	
func reset():
	light_energy = 1