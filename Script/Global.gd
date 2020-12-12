extends Node
var health  = 50
var Score = 0
var save = File.new()
var path = "Highscore.dat"
var data = {"Highscore" : 0}
var highscore = 0


func hit(Count :int):
	health -= Count


func Add_Score(Count :int):
	Score += 100

func Reset():
	Score = 0
	health = 50

func create_save():
	save.open(path, File.WRITE)
	save.store_var(data)
	save.close()

func Load():
	save.open(path,File.READ)
	data = save.get_var()
	highscore = data["Highscore"]
	save.close()


