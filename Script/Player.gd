extends KinematicBody2D
var motion =  Vector2()
var Speed = 800
var UP = Vector2(0,-1)
var gameOver = false
var score = 0
var shot = false
onready var Laser =  preload("res://Scene/Red lasser.tscn")
onready var Delay = $Timer



func _ready():
	$AnimationPlayer.current_animation = "[stop]"


func _physics_process(delta):

	if Input.is_action_pressed("ui_right") and gameOver == false:
		motion.x = Speed
		$Animation.play("Right")
	elif Input.is_action_pressed("ui_left")and gameOver == false:
		motion.x = -Speed
		$Animation.play("Left")
	elif Input.is_action_pressed("ui_down")and gameOver == false:
		motion.y = Speed
	
	elif Input.is_action_pressed("ui_up")and gameOver == false:
		motion.y = -Speed
	else:
		motion.x = 0
		motion.y =0
		$Animation.play("default")
	if Input.is_action_pressed("ui_accept") and $Timer.is_stopped()and gameOver == false:
		$Timer.start()
		var laser =  Laser.instance()
		#var laser2 =  Laser.instance()
		#var laser3 = Laser.instance()
		get_parent().add_child(laser)
		#get_parent().add_child(laser2)
		#get_parent().add_child(laser3)
		laser.position = $Position2D.global_position
		#laser2.position = $Position2D2.global_position
		#laser3.position = $Position2D3.global_position

	
	move_and_slide(motion,UP)
	
	var Player_health = Global.health
	if Player_health <= 0:
		pass
		GameOver()
		$Animation.hide()
		$Particles2D.emitting = true
		$Particles2D.one_shot = true


func GameOver():
	gameOver = true
	$CollisionShape2D.disabled = true
	$CollisionShape2D2.disabled = true





