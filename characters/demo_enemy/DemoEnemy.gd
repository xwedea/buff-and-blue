extends "res://characters/enemy_base/EnemyBase.gd"


var stateMachine


func _ready():
	stateMachine = $AnimationTree.get("parameters/playback")
	stateMachine.travel("idle")


func move(delta : float):
	var current_state = stateMachine.get_current_node()
	.move(delta)


func handle_hit(damage):
	stateMachine.travel("hit")
	.handle_hit(damage)
	
	
func die():
	stateMachine.travel("die")
	set_collision_mask_bit(3, false)
	set_collision_mask_bit(1, false)
