extends Node2D
onready var enemy =  preload("res://Scene/Enemy.tscn")
onready var enemy2 = preload("res://Scene/Enmy2.tscn")
onready var meteor =  preload("res://Scene/Meteor.tscn")
var highscore = 0
func _ready():
	$"/root/Player".position = $Position2D.global_position
	$"/root/Bgm".playing =true
	highscore = Global.highscore
	$"/root/Player".gameOver = false
	$"/root/Player".get_node("Animation").show()
	if not Global.save.file_exists(Global.path):
		Global.create_save()
	if Global.save.file_exists(Global.path):
		Global.Load()
		print("Highscore : "+str(Global.highscore))




func _physics_process(delta):
	$Label2.text = str(Global.health)
	$Label4.text = str(Global.Score)
	
	if Global.health <= 0:
		GameOver()
	if Input.is_key_pressed(KEY_P) || Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = true
		$"Pause dialog".show()


func _on_Button_pressed():
	get_tree().paused = false
	$"Pause dialog".hide()

func _on_Button4_pressed():
	get_tree().quit()
	Global.data = {"Highscore" : int($"Game over/Label4".text)}
	Global.create_save()

func _on_Button2_pressed():
	get_tree().reload_current_scene()
	Global.Reset()
	get_tree().paused = false
	$"/root/Player".get_node("CollisionShape2D").disabled = false
	$"/root/Player".get_node("CollisionShape2D2").disabled = false
	Global.data = {"Highscore" : int($"Game over/Label4".text)}
	Global.create_save()

func _on_Button3_pressed():
	get_tree().change_scene("res://Scene/Menu.tscn")
	Global.Reset()
	get_tree().paused = false

func _on_Pause_pressed():
	get_tree().paused = true
	$"Pause dialog".show()


func _on_Quit_pressed():
	get_tree().quit()


func _on_Timer_timeout():
	var enemy_Arr = [enemy,enemy2]
	var random = randi()%enemy_Arr.size()
	var EnemySpawn = enemy_Arr[random].instance()
	add_child(EnemySpawn)
	EnemySpawn.position = Vector2(rand_range(120,315),-32)
	pass


func _on_Metor_timer_timeout():
	$"Metor timer/Meteor spawn".start()
	$"Metor timer/Meteor spawn".autostart = true



func _on_Meteor_spawn_timeout():
	var Meteor =  meteor.instance()
	add_child(Meteor)
	Meteor.position = Vector2(rand_range(120,315),-32)

func GameOver():
	$Label2.text = str(0)
	$"Game over".show()
	if Global.highscore < Global.Score:
		Global.highscore = Global.Score
	$"Game over/Label5".text = str(Global.Score)
	$"Game over/Label4".text = str(Global.highscore)


