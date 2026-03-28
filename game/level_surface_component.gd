extends CSGBox3D

class_name LevelSurfaceComponent

func change_color(color_enum: ColorManager.ColorEnum) -> void:
	ColorManager.apply_color(self, color_enum)
