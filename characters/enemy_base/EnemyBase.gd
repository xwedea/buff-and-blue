extends "res://characters/agent_base/AgentBase.gd"


export var isGettingHit : bool = false
var isDead : bool = false

func move(delta : float):
	
	if !isGettingHit:
		$AnimationPlayer.play("idle")
	
	.move(delta)


func handle_hit():
	print("enemy got hit!")
	isGettingHit = true
	$AnimationPlayer.play("hit")
