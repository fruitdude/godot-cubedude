extends KinematicBody


const SPEED:= 10
const UP:= Vector3(0, 1, 0)

var _motion:= Vector3()

export var _player_id:= 1


func _physics_process(_delta):
	_move()
	_animate()
	_face_forward()
	
	
func _move():
	var x = Input.get_action_strength("right_%s" % _player_id) - Input.get_action_strength("left_%s" % _player_id)
	var z = Input.get_action_strength("down_%s" % _player_id) - Input.get_action_strength("up_%s" % _player_id)
	
	_motion = Vector3(x, 0, z)
	move_and_slide(_motion.normalized() * SPEED, UP)
	
	
func _animate():
	if _motion.length() > 0:
		$AnimationPlayer.play("Arms Cross Walk")
	else:
		$AnimationPlayer.stop()
		
		
func _face_forward():
	if not _motion.x == 0 or not _motion.z == 0:
		look_at(Vector3(-_motion.x, 0, -_motion.z) * SPEED, UP)