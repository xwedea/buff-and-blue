extends Node

signal death

export var MAXHEALTH : int = 100
var health


# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAXHEALTH
	if get_parent().is_in_group("enemy"):
		get_parent().connect("got_hit", self, "on_hit")


func on_hit(damage : float):
	health -= damage
	if (health <= 0):
		emit_signal("death")

