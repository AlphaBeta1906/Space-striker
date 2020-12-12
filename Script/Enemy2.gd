extends Area2D
var motion = Vector2()
onready var Enemylaser = preload("res://Scene/Green Laser.tscn")
var death = false

func _physics_process(delta):
	var pos = $".".get_position_in_parent()
	motion = Vector2()
	motion.y += 5

	translate(motion)

	#enemy hit laser
	var Areas = get_overlapping_areas()
	for area in Areas:
		if area.name == "Laser":
			death()
	#enemy hit player
	var bodies =  get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			Global.hit(4)
			$"/root/Player".get_node("AnimationPlayer").play("New Anim")
			death()

#enemy will deleted when exited screem
func _on_VisibilityNotifier2D_screen_exited():
	$".".queue_free()

#enemy shoot system
func _on_Timer_timeout():
	var laser =  Enemylaser.instance()
	var laser2 = Enemylaser.instance()
	if death:
		pass
	else:
		get_parent().add_child(laser)
		get_parent().add_child(laser2)
		laser.position = $Position2D.global_position
		laser2.position = $Position2D2.global_position


#execute when enemy is desytroyed
func death():
	death = true
	Global.Add_Score(100)
	$Sprite.hide()
	$Particles2D.emitting = true
	$Particles2D.one_shot = true
	$CollisionShape2D2.queue_free()
	$"/root/Player".get_node("Explosion").playing = true
	
