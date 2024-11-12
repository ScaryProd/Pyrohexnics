extends Button

@onready var main = get_tree().get_root().get_node("main")
@onready var firework = load("res://fireworkbasescene.tscn")

var hasBeenPressed: bool = false;
#var fireworkInstance = preload("res://fireworkbasescene.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(self._button_pressed)
	

func _button_pressed():
	print("Let the magic begin!");
	var currentData = PlayerVariables.explosionItems[0]
	var fireworkInstance = firework.instantiate();
	#fireworkInstance.spawnPos = self.position;
	fireworkInstance.scaleVar = 1;
	fireworkInstance.amountVar = currentData.amount;
	fireworkInstance.texture = currentData.texture;
	fireworkInstance.color = currentData.color;
	fireworkInstance._startEmission();
	self.add_child.call_deferred(fireworkInstance);
	fireworkInstance._startEmission();
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
