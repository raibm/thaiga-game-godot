extends KinematicBody2D
const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 300
const JUMP_HEIGHT = -550
var motion = Vector2()
#isso esta em python, então ta foda
func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		#o valor de X é equivalente a velocidade de corrida no respectivo eixo
		motion.x = SPEED
		$Sprite.flip_h = true
		$Sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = false
		$Sprite.play("run")
		motion.x = -SPEED
	else:
		$Sprite.play("idle")
		motion.x = 0
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	motion = move_and_slide(motion, UP)
