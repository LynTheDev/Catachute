extends CanvasLayer


func switch_anim(scene: String):
	$Switcher.play("Fade")
	await $Switcher.animation_finished
	get_tree().change_scene_to_file(scene)
	$Switcher.play_backwards("Fade")
