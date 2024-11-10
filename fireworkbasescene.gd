extends Node2D

var spawnPos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position = spawnPos;


func _startEmission() -> void:
	$Rising.emitting = true;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
