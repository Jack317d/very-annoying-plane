extends Node2D

@export var levelNo = 1
var startPos = Vector2()

func _ready():
	startPos = $Plane.global_position

func _physics_process(delta):
	
	if Input.is_action_just_pressed("tab"):
		A.lastLevel = str("res://l", levelNo, ".tscn")
		print(A.lastLevel)
		get_tree().change_scene_to_file("res://shop.tscn")
	
	if levelNo == 10:
		$Label.text = str("It took you ", A.deaths, " deaths to get here, maybe just quit now..")

func _on_n_ext_body_entered(body):
	
	if body.name == "Plane":
		A.coins += levelNo
		get_tree().change_scene_to_file(str("res://l", levelNo + 1, ".tscn"))


func _on_area_2d_body_entered(body):
	
	if body.name == "Plane":
		$Camera2D.zoom = Vector2(0.6, 0.6)
		$Sprite2D.hide()
		$Sprite2D3.hide()


func _on_area_2d_body_exited(body):
	
	if body.name == "Plane":
		$Camera2D.zoom = Vector2(1, 1)
		$Sprite2D.show()
		$Sprite2D3.show()
