extends StaticBody2D

var scaleFactor = 0.1
var mouseEntered : bool = false
var isCuttable : bool = false
@onready var particles = $CutParticles

func cut(cashMin:int, cashMax:int):
	scaleFactor -= 0.1
	var cashCount = get_parent().get_node("CashAmount")
	particles.scale = Vector2(scaleFactor * 100, scaleFactor * 100)
	particles.emitting = true
	if cashCount.get_class() == "Timer":
		cashCount.wait_time += randi_range(cashMin, cashMax)
	else:
		push_error("no cash count timer variable?")

func _process(delta):
	if scaleFactor < 2:
		scaleFactor += randf_range(0.0001, 0.001)
		global_scale = Vector2(scaleFactor, scaleFactor)
		
	if scaleFactor > 0.5:
		isCuttable = true
	else:
		isCuttable = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if mouseEntered and isCuttable:
				cut(1, 4)

func _on_mouse_entered():
	mouseEntered = true
	print("mouse entered ass")

func _on_mouse_exited():
	mouseEntered = false
	print("mouse exited ass")

func _on_body_entered(body):
	if body.name == "Scissors" and isCuttable:
		cut(2, 5)
