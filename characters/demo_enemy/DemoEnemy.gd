extends "res://characters/enemy_base/EnemyBase.gd"


var stateMachine
var Player : Player
onready var anim_tree = $AnimationTree
var justGotHit = false
var justDied = false

func _ready():
	stateMachine = anim_tree.get("parameters/playback")
	stateMachine.travel("idle")
	player = get_tree().get_nodes_in_group("player")[0]

func move(delta : float):
	var curAnimState = stateMachine.get_current_node()
	
	if curAnimState == "die": return
	elif curAnimState == "hit": return
	elif justDied:
		stateMachine.travel("die")
		justDied = false
		return
	elif justGotHit:
		stateMachine.travel("hit")
		justGotHit = false
		return
	

	direction = (player.position - position).normalized()
	if (direction.x > 0):
		velocity.x += ACCELERATION * delta
	elif (direction.x < 0):
		velocity.x -= ACCELERATION * delta
	
	
	if (abs(velocity.x) > 50):
			stateMachine.travel("run")
	else:
		stateMachine.travel("idle")


	if (enemyState == IDLE):
		pass
	if (enemyState == FOLLOW):
		pass
	elif (enemyState == COMBAT):
		pass
		
		
		
	.move(delta)

	
	

func handle_hit(damage):
	justGotHit = true
	.handle_hit(damage)
	
	
func die():
	set_collision_mask_bit(1, false)
	justDied = true
	
	
