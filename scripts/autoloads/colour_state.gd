extends Node

var color_dictionary: Dictionary[Enums.ColorEnum, Color] = {
	Enums.ColorEnum.WHITE: Color(1, 1, 1),
	Enums.ColorEnum.RED: Color(1, 0.4, 0.4),
	Enums.ColorEnum.YELLOW: Color(1, 1, 0.3),
	Enums.ColorEnum.GREEN: Color(0, 1, 0.3),
	Enums.ColorEnum.PINK: Color(1, 0.2, 0.6),
}

func set_color(CSG_shape: CSGShape3D, color_enum: Enums.ColorEnum) -> void:
	var material: Material = StandardMaterial3D.new()
	material.albedo_color = color_dictionary[color_enum]
	CSG_shape.material_override = material
	
