extends Area2D
var motion = Vector2()


func _physics_process(delta):
	motion = Vector2()
	motion.y += 10
	translate(motion)
	
	#enemy hit laser
	var Areas = get_overlapping_areas()
	for area in Areas:
		if area.name == "Laser":
			damage()

	var bodies =  get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			$"/root/Player".get_node("AnimationPlayer").play("New Anim")
			damage()
			Global.hit(5)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func damage():
	Global.Add_Score(100)
	$Sprite.hide()
	$Particles2D.emitting = true
	$Particles2D.one_shot = true
	$CollisionShape2D2.queue_free()
	$"/root/Player".get_node("Explosion").playing = true
