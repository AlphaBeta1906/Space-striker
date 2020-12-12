extends Node
var health  = 50
var Score = 0
var save = File.new()
var save2 =  File.new()
var path = "Highscore.dat"
#var path2 = "User://test.text"
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
	print(save.get_path())
	save.store_var(data)
	save.close()
	print("save created")

func Load():
	save.open(path,File.READ)
	data = save.get_var()
	highscore = data["Highscore"]
	save.close()
"""
func create_save2():
	save2.open("C://Users/Salman-pc/AppData/Local/Space striker/test.text", File.WRITE)
	print(save2.get_path())
	save2.store_var(data)
	save2.close()
	print("save2 created")"""

