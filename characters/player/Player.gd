extends "res://characters/agent_base/AgentBase.gd"

class_name Player

enum PlayerStatus {NEUTRAL, ATTACKING, DIALOG}

export var nextComboAttack = 1

export var attackPower : int = 35
export var bAttackCombo = false

var hasDoubleJump = true
var stateMachine

func _ready():
	stateMachine = $AnimationTree.get("parameters/playback")
	stateMachine.travel("idle")


func move(delta):
	var current_state = stateMachine.get_current_node()
	
	
		
	if current_state != "attack1" and current_state != "attack2":
		if Input.is_action_pressed("move_right"):
			velocity.x += ACCELERATION
			facing_right = true
		elif Input.is_action_pressed("move_left"):
			velocity.x -= ACCELERATION
			facing_right = false
		else:
			velocity.x = lerp(velocity.x, 0, 0.2)
		# JUMP
		if Input.is_action_just_pressed("jump") && (hasDoubleJump || is_on_floor()):
			velocity.y = -JUMPFORCE
			hasDoubleJump = is_on_floor()
	else:
		velocity.x = lerp(velocity.x, 0, 0.05) 


	if Input.is_action_just_pressed("attack"):
		stateMachine.travel("attack" + str(nextComboAttack))
	elif velocity.y > 0:
		stateMachine.travel("fall")
	elif velocity.y < 0:
		stateMachine.travel("jump")
	elif is_on_floor():
		if abs(velocity.x) > 50:
			stateMachine.travel("run")
		else:
			stateMachine.travel("idle")
		
	.move(delta)

func start_combo_timer():
	$ComboTimer.start()

func _on_HitArea_body_entered(body):
	$AudioStreamPlayer.play(0.00)
	
	if body.has_method("handle_hit"):
		body.handle_hit(attackPower)
	

func _on_ComboTimer_timeout():
	nextComboAttack = 1
