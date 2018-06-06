extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY= 20
const MAX_SPEED =200
const JUMP_Height=-500
const ACCELERATION = 50
var motion = Vector2()


func _physics_process(delta):#method defining player physics charateristics
	
	#adding Gravity
	motion.y+=GRAVITY 
	
	#Player movement with right arrow key
	if Input.is_action_pressed("ui_right"):   #method takes key input
		motion.x += ACCELERATION              #adds smooth movement
		motion.x =min(motion.x,MAX_SPEED)     #limits max speed by returning min value
		$Sprite.flip_h=false    #decides where the player sprite is facing
		$Sprite.play("Run")     #Decides which sprite will be displayed (Here "Run" is displayed)
		
	elif Input.is_action_pressed("ui_left"):
		motion.x -= ACCELERATION
		motion.x =max(motion.x,-MAX_SPEED)
		$Sprite.flip_h=true
		$Sprite.play("Run")
	else :
		$Sprite.play("Idle")
		motion.x = lerp(motion.x,0,0.2) 
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y=JUMP_Height
	else:
		#player jump sprite changes
		if motion.y<0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
			
	motion = move_and_slide(motion, UP)
	pass

