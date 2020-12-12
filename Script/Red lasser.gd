extends Area2D


func _ready():
	$AudioStreamPlayer2D.playing =true

func _physics_process(delta):
	var motion =  Vector2()
	motion.y -= 20
	translate(motion)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Laser_area_entered(area):
		if area.name != "Laser2":
			queue_free()

