extends RigidBody2D

signal clicked

var held = false

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print("clicked")
			clicked.emit(self)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	contact_monitor = true;
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if held:
		global_transform.origin = get_global_mouse_position()
	var collision = get_contact_count()
	if (collision > 0):
		$Button._button_pressed();
