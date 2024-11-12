extends Camera2D

var movement = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.make_current()

func _move_right() -> void:
	movement = true;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if movement:
		position.x = position.x + 1;
