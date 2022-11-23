extends "res://characters/enemy_base/EnemyBase.gd"


export var isGettingHit : bool = false
var isDead : bool = false

func move(delta : float):
	
	if !isGettingHit:
		$AnimationPlayer.play("idle")
	
	.move(delta)


func handle_hit(damage):
	isGettingHit = true
	$AnimationPlayer.play("hit")

	.handle_hit(damage)
