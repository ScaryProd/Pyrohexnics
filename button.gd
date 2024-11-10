extends Button

@onready var main = get_tree().get_root().get_node("main")
@onready var firework = load("res://fireworkbasescene.tscn")

var hasBeenPressed: bool = false;
#var fireworkInstance = preload("res://fireworkbasescene.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(self._button_pressed)
	

func _button_pressed():
	print("Let the magic begin!")
	var fireworkInstance = firework.instantiate()
	fireworkInstance.spawnPos = self.position;
	fireworkInstance._startEmission();
	main.add_child.call_deferred(fireworkInstance);
	fireworkInstance._startEmission();
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
