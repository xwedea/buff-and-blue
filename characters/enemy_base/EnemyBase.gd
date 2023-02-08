extends "res://characters/agent_base/AgentBase.gd"

signal got_hit

enum {
	IDLE,
	ALERT,
	FOLLOW,
	COMBAT,
}
var enemyState = IDLE;

var player : Player
	
func _ready():
	$HealthComponent.connect("death", self, "die")
	player = get_tree().get_nodes_in_group("player")[0]
	
func _process(delta):
	var distance = position.distance_to(player.position)
	
	if (distance >= 400):
		enemyState = IDLE
	elif (distance >= 120 and distance < 400):
		enemyState = FOLLOW
	elif (distance < 120):
		enemyState = COMBAT
	
	
func move(delta : float):
	.move(delta)


func handle_hit(damage : float):
	emit_signal("got_hit", damage)
	
func die():
	.die()
