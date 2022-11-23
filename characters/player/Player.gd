extends "res://characters/agent_base/AgentBase.gd"



export var isAttacking : bool = false

func move(delta):
#	GRAVITY = 0
	
	if Input.is_action_just_pressed("attack"):
		$AnimationPlayer.play("attack1")
		isAttacking = true
	
	if isAttacking:
		return
	
	if Input.is_action_pressed("move_right"):
		velocity.x += ACCELERATION
		facing_right = true
		$AnimationPlayer.play("run")
	elif Input.is_action_pressed("move_left"):
		velocity.x -= ACCELERATION
		facing_right = false
		$AnimationPlayer.play("run")
	else:
		velocity.x = lerp(velocity.x, 0, 0.2)
		$AnimationPlayer.play("idle")
	
	
	# JUMP
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y -= JUMPFORCE
			$AnimationPlayer.play("jump")
	else:
		if velocity.y > 0:
			$AnimationPlayer.play("fall")
		elif velocity.y < 0:
			$AnimationPlayer.play("jump")
	
	.move(delta)
	


func _on_HitArea_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
	
	
