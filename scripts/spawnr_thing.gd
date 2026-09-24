extends Node2D

@export var car_scene: PackedScene
@export var stop_point: Marker2D
@export var cross_point: Marker2D
@export var exit_point: Marker2D
@export var fuckoff: Marker2D

func _ready() -> void:
	spawn_car()


func spawn_car() -> void:

	var car = car_scene.instantiate()

	add_child(car)

	car.global_position = global_position

	car.stop_point = stop_point
	car.cross_point = cross_point
	car.exit_point = exit_point
	car.fuckoff = fuckoff





func _on_timer_timeout() -> void:
	spawn_car()
