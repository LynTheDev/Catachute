extends Node2D


var check_mark_active_spr = preload("res://Assets/Buttons/CheckMarkChecked.png")
var check_mark_idle_spr = preload("res://Assets/Buttons/CheckMarkIdle.png")


func update_text():
	$"UIView/UI/Bean/Currency".text = "%d" % [Glob.beans]


func _ready():
	$SFXPlayerSpecial.play()

	update_text()


func _process(_delta):
	if $"UIView/UI/CatdonBuyLabel/Equi/BrandonEquip".is_pressed():
		$"UIView/UI/CatdonBuyLabel/Equi/BrandonEquip".texture_normal = check_mark_active_spr
	else:
		$"UIView/UI/CatdonBuyLabel/Equi/BrandonEquip".texture_normal = check_mark_idle_spr
	
	if Glob.brandon_equipped:
		$"UIView/UI/CatdonBuyLabel/Equi/BrandonEquip".set_pressed(true)
	else:
		$"UIView/UI/CatdonBuyLabel/Equi/BrandonEquip".set_pressed(false)
		
	if Glob.beans < 999:
		$"UIView/UI/CatdonBuyLabel/BrandonBuy".disabled = true
	else:
		$"UIView/UI/CatdonBuyLabel/BrandonBuy".disabled = false
	
	if not Glob.has_brandon:
		$"UIView/UI/CatdonBuyLabel/Equi".visible = false
	else:
		$"UIView/UI/CatdonBuyLabel/Equi".visible = true
		$"UIView/UI/CatdonBuyLabel/Equi".position.y = 52

		$"UIView/UI/CatdonBuyLabel/Price".visible = false
		$"UIView/UI/CatdonBuyLabel/BrandonBuy".visible = false

func _on_backbutton_pressed():
	get_tree().change_scene_to_file("res://Scenes/Shop.tscn")


func _on_brandon_buy_pressed():
	$SFXPlayer.play()
	Glob.beans -= 999

	Glob.has_brandon = true

	update_text()
	Save.save_game()


func _on_brandon_equip_toggled(button_pressed: bool):
	if button_pressed:
		$"UIView/UI/CatdonBuyLabel/Equi/BrandonEquip".texture_normal = check_mark_active_spr
		Glob.brandon_equipped = true
	else:
		$"UIView/UI/CatdonBuyLabel/Equi/BrandonEquip".texture_normal = check_mark_idle_spr
		Glob.brandon_equipped = false
	
	Save.save_game()


func _on_brandon_equip_pressed():
	$SFXPlayerSpecial.play()
