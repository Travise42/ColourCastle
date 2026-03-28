@tool extends EditorScript

class_name BaseLevelGeneratorScript

const BASE_LEVEL_PATH: String = "res://game/levels/base_level.tscn"
const TARGET_LEVEL_PATH: String = "res://game/levels/levels/"

var target_level_name: String = "example.tscn"

func _run() -> void:
	print("attempt to duplicate level...")
	
	var scene: PackedScene = load(BASE_LEVEL_PATH)
	if scene == null:
		push_error("unable to load level at: ", BASE_LEVEL_PATH)
		return
	
	print("load complete")
	
	var error: Error = ResourceSaver.save(scene, TARGET_LEVEL_PATH + target_level_name)
	if error != OK:
		push_error("unable to save level")
		return
	
	print("save complete")
