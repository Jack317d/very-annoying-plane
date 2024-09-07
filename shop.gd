extends Node2D



func _physics_process(delta):
	$Label.text = str("Control Modifier: ", "+" if A.controlMod > 1 else "", A.controlMod * 100 - 100, "%")
	$Label3.text = str("Speed Modifier: ", "+" if A.speedMod > 1 else "", A.speedMod * 100 - 100, "%")
	$Label2.text = str("Coins: ", A.coins)
	
	$Button.text = str("Reroll Control/Friction \nCost: ", A.controlCost)
	$Button3.text = str("Reroll Speed \nCost: ", A.speedCost)

func _on_button_pressed():
	
	if A.coins >= A.controlCost:
		A.coins -= A.controlCost
		
		A.controlCost = round(A.controlCost * 1.3)
		
		A.controlMod = snapped(randf_range(1.3, 0.7), 0.02)
	


func _on_button_2_pressed():
	
	get_tree().change_scene_to_file(A.lastLevel)


func _on_button_3_pressed():
	
	if A.coins >= A.speedCost:
		A.coins -= A.speedCost
		
		A.speedCost = round(A.speedCost * 1.3)
		
		A.speedMod = snapped(randf_range(1.6, 0.3), 0.02)
