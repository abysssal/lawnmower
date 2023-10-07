extends RigidBody2D

@onready var animSprite = $AnimatedSprite2D
var target = Vector2(0, 0)
var targetNode
var needsGrass : bool = true
var master
var speed = 100
var canCut : bool = true

func _ready():
	master = get_parent()
	
func _process(delta):
	global_rotation = atan2(tan(target.y), tan(target.x)) - 90
	if needsGrass:
		var grasses = master.get_children()
		for i in grasses:
			if "Grass" in i.name:
				if i.global_scale.x > 0.5:
					target = i.position
					targetNode = i
					needsGrass = false
					break
	
	if targetNode:
		if targetNode.global_scale.x < 0.5:
			needsGrass = true
			target = Vector2(0, 0)

func _integrate_forces(state):
	if target.x > position.x:
		apply_impulse(Vector2(speed * get_physics_process_delta_time(), 0))
	else:
		apply_impulse(Vector2(-speed * get_physics_process_delta_time(), 0))
		
	if target.y < position.y:
		apply_impulse(Vector2(0, -speed * get_physics_process_delta_time()))
	else:
		apply_impulse(Vector2(0, speed * get_physics_process_delta_time()))
