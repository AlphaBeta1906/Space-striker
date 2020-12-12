extends ParallaxLayer


func _physics_process(delta):
	$".".motion_offset.y += 10
