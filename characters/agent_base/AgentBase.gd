extends KinematicBody2D

export var GRAVITY = 12
var MAXFALLSPEED = 400
var MAXSPEED = 170
var JUMPFORCE = 270
var ACCELERATION = 40

var velocity = Vector2.ZERO
var facing_right = true

func _physics_process(delta):
	move(delta)

func move(delta):
	# DIRECTION
	if facing_right:
		$AnimatedSprite.scale.x = 1
	else:
		$AnimatedSprite.scale.x = -1
	
	# Handling gravity
	velocity.y += GRAVITY
	if velocity.y > MAXFALLSPEED:
		velocity.y = MAXFALLSPEED
	
	# HORIZONTAL MOVEMENT
	velocity.x = clamp(velocity.x, -MAXSPEED, MAXSPEED)
	
	# Setting the position
	velocity = move_and_slide(velocity, Vector2.UP)
	
	
func die():
	queue_free()
	
