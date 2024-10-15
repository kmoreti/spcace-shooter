extends Area2D

@export var speed: int
@export var rotation_speed: int
@export var direction_x: float

func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	
	# texture
	var path: String = "res://graphics/meteors/" + str(rng.randi_range(1,8)) + ".png"
	$MeteorImage.texture = load(path)
	
	# start position
	var width := get_viewport().get_visible_rect().size[0]
	var random_x := rng.randi_range(0, int(width)) 
	var randon_y := rng.randi_range(-150, -50)
	position = Vector2(random_x, randon_y)
	
	# speed / rotation / direction
	speed = rng.randi_range(200, 500)
	rotation_speed = rng.randi_range(40, 100)
	direction_x = randf_range(-1, 1)

func _process(delta: float) -> void:
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta
	
func _on_body_entered(body: Node2D) -> void:
	print("body entered")
	print(body.name)
