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
	$"..".gravity_scale = 1;
	$"..".linear_velocity = Vector2(0,-10);
	self.add_child(generateFirework(PlayerVariables.explosionItems[0]));
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func generateFirework(data: ItemData):
	var newfirework = CPUParticles2D.new()
	newfirework.texture = data.texture;
	newfirework.gravity = Vector2(0,980);
	newfirework.amount = data.amount;
	newfirework.spread = (float(data.amount) / 1000.0) * 180.0;
	newfirework.direction = Vector2(0,-1);
	newfirework.initial_velocity_min = data.initialVelocity - 50;
	newfirework.initial_velocity_max = data.initialVelocity + 50;
	newfirework.position += Vector2(45,0);
	newfirework.color = Color((float(data.amount) / 1000.0) * 255.0, (float(data.amount) / 1000.0) * 255.0, (float(data.initialVelocity * data.amount) / 1000.0) * 255.0);
	
	if(data.type == ItemData.Type.CELESTIAL):
		newfirework.orbit_velocity_min = -10;
		newfirework.orbit_velocity_max = 10;
		
	if(data.type == ItemData.Type.GREED):
		newfirework.scale_amount_min = 1
		newfirework.scale_amount_max = 100
	
	return newfirework;
	
func genericFirework():
	var newfirework = CPUParticles2D.new()
	newfirework.gravity = Vector2(0,0);
	newfirework.amount = 100;
	newfirework.spread = 45;
	newfirework.direction = Vector2(0,-1);
	newfirework.initial_velocity_min = 50;
	newfirework.initial_velocity_max = 50;
	newfirework.position += Vector2(50,0);
	return newfirework;
	

	#var currentData = PlayerVariables.explosionItems[0]
	#var fireworkInstance = firework.instantiate();
	##fireworkInstance.spawnPos = self.position;
	#fireworkInstance.scaleVar = 1;
	#fireworkInstance.amountVar = currentData.amount;
	#fireworkInstance.texture = currentData.texture;
	##fireworkInstance.color = currentData.color;
	##fireworkInstance._startEmission();
	#self.add_child.call_deferred(fireworkInstance);
	#fireworkInstance._startEmission();
