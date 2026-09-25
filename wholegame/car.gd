extends CharacterBody2D

@export var speed = 100.0

var target: Marker2D
var stop_point: Marker2D
var cross_point: Marker2D
var exit_point: Marker2D
var fuckoff : Marker2D
var fuckedoff = false
var has_passed = false


func _process(delta: float) -> void:
	if fuckedoff == true:
		queue_free()

	# If the car has already crossed the intersection,
	# it should always continue toward the exit.
	if has_passed:
		target = exit_point

	# If the light is green, the car can move toward the exit.
	else:
		if GameData.traffic == true:
			target = exit_point
		else:
			target = stop_point

	# Check if the car has actually crossed the intersection.
	if global_position.distance_to(cross_point.global_position) < 10:
		has_passed = true

	if global_position.distance_to(fuckoff.global_position) < 10:
		print("passed")
		queue_free()



func _physics_process(delta: float) -> void:

	if target == null:
		return

	var direction = global_position.direction_to(target.global_position)

	velocity = direction * speed

	move_and_slide()
