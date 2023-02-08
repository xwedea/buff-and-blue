extends "res://characters/enemy_base/EnemyBase.gd"

var stateMachine
var Player : Player
onready var anim_tree = $AnimationTree

func _ready():
	stateMachine = anim_tree.get("parameters/playback")
	stateMachine.travel("idle")
	player = get_tree().get_nodes_in_group("player")[0]

func move(delta : float):
	var animState = stateMachine.get_current_node()
	
	
#	direction = (player.position - position).normalized()
#	if (direction.x > 0):
#		velocity.x += ACCELERATION * delta
#	elif (direction.x < 0):
#		velocity.x -= ACCELERATION * delta
	
	if (enemyState == IDLE):
		stateMachine.travel("idle")
	elif (enemyState == COMBAT):
		pass
		
		
		
	.move(delta)

	
	


func handle_hit(damage):
	stateMachine.travel("hit")
	.handle_hit(damage)
	
	
func die():
	set_collision_mask_bit(1, false)
	stateMachine.travel("die")
	
	
