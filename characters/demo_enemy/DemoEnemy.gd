extends "res://characters/enemy_base/EnemyBase.gd"

var stateMachine
var Player : Player

func _ready():
	stateMachine = $AnimationTree.get("parameters/playback")
	stateMachine.travel("idle")
	Player = get_tree().get_nodes_in_group("player")[0]

func move(delta : float):
	var current_state = stateMachine.get_current_node()
	.move(delta)

func _process(delta):
	var current_state = stateMachine.get_current_node()


func handle_hit(damage):
	stateMachine.travel("hit")
	.handle_hit(damage)
	
	
func die():
	set_collision_mask_bit(1, false)
	stateMachine.travel("die")
	
	
