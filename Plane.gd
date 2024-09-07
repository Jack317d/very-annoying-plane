extends CharacterBody2D


var rotateVelocity = 0
var pitchIncrease = 0

var fps1 = 3
var fps2 = 3

const deadPlane = preload("res://crash_heli.tscn")

var kaboomm = true

func kaboom():
	
	if kaboomm:
		A.deaths += 1
		kaboomm = false
		$Timer.start()
		var a = deadPlane.instantiate()
		
		$Boom.play()
		get_parent().add_child(a)
		
		a.global_position = global_position
		a.rotation_degrees = rotation_degrees

func _physics_process(delta):
	
	fps1 = 3
	fps2 = 3
	
	pitchIncrease = rotateVelocity / 14
	pitchIncrease += velocity.x / 600
	
	if velocity.y < 0:
		pitchIncrease += -velocity.y / 750
		fps1 += round(-velocity.y / 10)
		fps2 += round(-velocity.y / 10)
	
	if pitchIncrease < 0:
		pitchIncrease = 0
	
	if rotateVelocity > 0:
		fps2 += rotateVelocity * 8
	else:
		fps1 += -rotateVelocity * 8
	
	
	
	$AudioStreamPlayer2D.pitch_scale = 1 + pitchIncrease
	rotation_degrees += rotateVelocity
	
	if rotateVelocity > 6 or rotateVelocity < 6:
		velocity.x += randi_range(-rotateVelocity * 5, rotateVelocity * 5)
		velocity.y += randi_range(-rotateVelocity * 5, rotateVelocity * 5)
	
	velocity.y += 7
	
	if $CanvasLayer/Button6.button_pressed:
		velocity.x -= 8 * A.speedMod
		rotateVelocity -= 0.45 * A.rotateSpeedMod
	elif $CanvasLayer/Button7.button_pressed:
		velocity.x += 8 * A.speedMod
		rotateVelocity += 0.45 * A.rotateSpeedMod
	else:
		velocity.x = move_toward(velocity.x, 0, 3 * A.controlMod)
	
	if $CanvasLayer/Button9.button_pressed:
		rotateVelocity -= 0.4 * A.rotateSpeedMod
	elif $CanvasLayer/Button10.button_pressed:
		rotateVelocity += 0.4 * A.rotateSpeedMod
	else:
		rotateVelocity = move_toward(rotateVelocity, 0, 0.2 * A.controlMod)
	
	if $CanvasLayer/Button8.button_pressed:
		velocity.y -= 20
	
	if fps1 > 9:
		fps1 = 9
	if fps2 > 9:
		fps2 = 9
	
	$AnimatedSprite2D.sprite_frames.set_animation_speed("default", fps1)
	$AnimatedSprite2D2.sprite_frames.set_animation_speed("default", fps2)
	
	move_and_slide()


func _on_timer_timeout():
	kaboomm = true
