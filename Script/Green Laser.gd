extends Area2D


func _physics_process(delta):
	var motion =  Vector2()
	motion.y += 20
	translate(motion)


func _on_Laser_body_entered(body):
	queue_free()
	if body.name == "Player":
		Global.hit(1)
		$"/root/Player".get_node("AnimationPlayer").play("New Anim")
		if Global.health <= 0:
			$"/root/Player".get_node("Explosion").playing = true
