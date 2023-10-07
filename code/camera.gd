extends Camera2D

var shift = 1
var speed = 500

var zoomMax = 2
var zoomMin = 0.25

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("shift"):
		shift = 2
		print("shift")
		
	if Input.is_action_just_released("shift"):
		shift = 1
		print("unshift")
	
	if Input.is_action_pressed("ui_left"):
		position.x = position.x - speed * shift * delta
		
	if Input.is_action_pressed("ui_right"):
		position.x = position.x + speed * shift * delta
	
	if Input.is_action_pressed("ui_up"):
		position.y = position.y - speed * shift * delta
	
	if Input.is_action_pressed("ui_down"):
		position.y = position.y + speed * shift * delta
		
	if Input.is_action_pressed("zoomOut"):
		if zoom.x >= zoomMin and zoom.y >= zoomMin:
			zoom = Vector2(zoom.x - 0.01 * shift, zoom.y - 0.01 * shift)
		
	if Input.is_action_pressed("zoomIn"):
		if zoom.x <= zoomMax and zoom.y <= zoomMax:
			zoom = Vector2(zoom.x + 0.01 * shift, zoom.y + 0.01 * shift)
