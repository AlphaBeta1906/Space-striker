extends Area2D
var health =  50
var motion

func _physics_process(delta):
	motion = Vector2()
	motion.y += 3

	translate(motion)
	var bodies =  get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			Global.Add_Score(250)
			health -= 100
			$"/root/Global".hit(100)
			MeteorHit()

	var area = get_overlapping_areas()
	for areas in area:
		if areas.name == "Laser":
			Global.Add_Score(250)
			health -= 10
			if health <= 0:
				MeteorHit()

func MeteorHit():
	$Sprite.hide()
	$CollisionShape2D.disabled = true
	$"Metor shard".emitting = true
	$"/root/Player".get_node("Explosion").playing = true
