extends Node2D



func _ready():
	$"/root/Player".gameOver = true
	$"/root/Player".get_node("Animation").hide()
	$AnimationPlayer.play("Button up")
	$"/root/Bgm".playing = true

func _on_Button2_pressed():
	get_tree().change_scene("res://Scene/Manual.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://Scene/Main Scene.tscn")


func _on_Button3_pressed():
	get_tree().quit()





