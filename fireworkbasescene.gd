extends Node2D

#var spawnPos : Vector2
var scaleVar : int = 1
var amountVar : int = 1
var initialVelocity: int 
var color: GradientTexture2D
var texture: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#self.position = spawnPos;
	$Rising.texture = color
	$Rising.process_material.initial_velocity = Vector2(initialVelocity,initialVelocity)
	$Rising.amount = amountVar;
	$Rising.texture = color;
	$Blast.texture = texture;
	#$Rising.process_material.scale_min = scaleVar;
	#$Rising.process_material.scale_max = scaleVar;


func _startEmission() -> void:
	$Rising.emitting = true;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
