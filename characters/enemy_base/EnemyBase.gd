extends "res://characters/agent_base/AgentBase.gd"

signal got_hit
	
func _ready():
	$HealthComponent.connect("death", self, "die")
	
func move(delta : float):
	.move(delta)


func handle_hit(damage : float):
	emit_signal("got_hit", damage)
	
func die():
	.die()
