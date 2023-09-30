extends Node2D

@onready var grass = preload("res://scenes/grass.tscn")
@onready var grassTimer = $GrasTimer
@onready var cashAmount = $CashAmount
@onready var cashUI = $Camera/Control/Panel/Cash

func _ready():
	timer_reaches_zero()

func _process(delta):
	cashUI.text = "$" + str(cashAmount.wait_time)

func timer_reaches_zero(): # create grass
	grassTimer.start(3)
	var ass = grass.instantiate(PackedScene.GEN_EDIT_STATE_MAIN)
	ass.set("position", Vector2(randf_range(-10, 10), randf_range(-10, 10)))
