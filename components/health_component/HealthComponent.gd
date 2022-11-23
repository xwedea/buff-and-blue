extends Node


export var MAXHEALTH : int = 100
var health

# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAXHEALTH


func handle_damage(damage : int):
	health -= damage
	if (health <= 0):
		owner.die()
