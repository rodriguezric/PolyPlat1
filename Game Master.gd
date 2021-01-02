extends Node
onready var player = $Player

func _on_Lava_body_entered(body):
	player.position = Vector2(128, 64)
	print("You died")


func _on_Victory_body_entered(body):
	print("you win!")
