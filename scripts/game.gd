extends Node3D
class_name Game

@onready var background_color_enum: Enums.ColorEnum = Enums.ColorEnum.WHITE
@onready var perspective_enum: Enums.Perspective = Enums.Perspective.SIDESCROLLER

@export var floor_box: GameSurfaceComponent
@export var wall_box: GameSurfaceComponent
@export var game_camera: GameCamera

func _ready() -> void:
	floor_box.change_color(background_color_enum)
	wall_box.change_color(background_color_enum)

func get_color_enum() -> Enums.ColorEnum:
	return background_color_enum

func get_persepective() -> Enums.Perspective:
	return perspective_enum

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("change_color"):
		background_color_enum = (background_color_enum + 1) % Enums.ColorEnum.size() as Enums.ColorEnum
		floor_box.change_color(background_color_enum)
		wall_box.change_color(background_color_enum)
	if Input.is_action_just_pressed("change_perspective"):
		match perspective_enum:
			Enums.Perspective.TRANSITIONING:
				return
			Enums.Perspective.SIDESCROLLER:
				perspective_enum = Enums.Perspective.TRANSITIONING
				await game_camera.transition_to_topdown()
				perspective_enum = Enums.Perspective.TOPDOWN
			Enums.Perspective.TOPDOWN:
				perspective_enum = Enums.Perspective.TRANSITIONING
				await game_camera.transition_to_sidescroller()
				perspective_enum = Enums.Perspective.SIDESCROLLER
		
	
