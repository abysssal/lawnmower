extends Node2D

@onready var grass = preload("res://scenes/grass.tscn")
@onready var cashAmount = $CashAmount
@onready var cashUI = $UserInterface/Panel/Cash
@onready var panel = $UserInterface/Panel
@onready var camera = $Camera

@export var grassCount : int = 0
@export var maxGrassCount : int = 5 # max is 500
@export var grassGrowRate : float = 5 # min is 0.5
@export var grassDistanceX : int = 1000 # complete max is 4800, add 100 per upgrade /________ should be 48 upgrades
@export var grassDistanceY : int = 800 # complete max is 3840, add 80 per upgrade   \         in total

var timer = 0 
var waitTime = randi_range(3, 8)

func _ready():
	growGrass()

func _process(delta):
	cashUI.text = "$" + str(cashAmount.wait_time)
	
	panel.position = camera.position
	panel.scale = Vector2(camera.zoom.x, camera.zoom.y)
	
	timer += delta
	
	if timer >= waitTime and grassCount < maxGrassCount:
		growGrass()
		timer = 0
		waitTime = randi_range(5, 10)
	elif timer >= waitTime and grassCount == maxGrassCount:
		timer = 0
		waitTime = randi_range(5, 10)
		

func growGrass(): # create grass
	grassCount += 1
	var ass = grass.instantiate()
	ass.set("position", Vector2(randf_range(-grassDistanceX, grassDistanceX), randf_range(-grassDistanceY, grassDistanceY)))
	add_child(ass)
	print("new grass at " + str(ass.position))
