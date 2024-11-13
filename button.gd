extends Button

@onready var main = get_tree().get_root().get_node("main")
@onready var firework = load("res://fireworkbasescene.tscn")

var maxFireworks = 1;

var hasBeenPressed: bool = false;
#var fireworkInstance = preload("res://fireworkbasescene.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(self._button_pressed)
	

func _button_pressed():
	
	$"..".gravity_scale = 1;
	$"..".linear_velocity = Vector2(0,1);
	#self.add_child(rising().add_child(generateFirework(PlayerVariables.explosionItems[0])));
	print("Let the magic begin! %s" % maxFireworks);
	self.add_child(generateFirework(PlayerVariables.explosionItems[0]));
	
	#self.add_child(rising());
	
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
	newfirework.initial_velocity_min = 250 + data.initialVelocity;
	newfirework.initial_velocity_max = 300 + data.initialVelocity;
	newfirework.position += Vector2(45,0);
	#newfirework.color = Color(randi_range(0,150), randi_range(0,150) ,randi_range(0,150),  randi_range(0,255));
	
	var colorArray;
	
	colorArray = PackedColorArray([Color(randf(), randf(), randf()), Color(randf(), randf(), randf()),  Color(randf(), randf(), randf())]);
	
	
	
	var newGradient = Gradient.new();
	newfirework.one_shot = true;
	
	newGradient.colors = colorArray;
	
	newfirework.color_ramp = newGradient;
	
	if(data.type == ItemData.Type.ICON):
		newfirework.orbit_velocity_min = -10;
		newfirework.orbit_velocity_max = 10;
		
	if(data.type == ItemData.Type.MEME):
		newfirework.scale_amount_min = 1
		newfirework.scale_amount_max = 5
		
	if(data.type == ItemData.Type.NATURAL):
		newfirework.lifetime = 5
		newfirework.gravity = Vector2(400,0);
		
		
	if(data.type == ItemData.Type.MEME):
		newfirework.randomness = 1;
	
	return newfirework;
	
func genericFirework():
	var newfirework = CPUParticles2D.new()
	newfirework.amount = 100;
	newfirework.spread = 45;
	newfirework.gravity = Vector2(0,980);
	newfirework.direction = Vector2(0,-1);
	newfirework.initial_velocity_min = 50;
	newfirework.initial_velocity_max = 50;
	newfirework.position += Vector2(50,0);
	newfirework.spread = 45;
	return newfirework;
	

#func rising():
	#var circle = CircleShape2D.new();
	#circle.radius = 5;
	#var shape = CollisionShape2D.new();
	#shape.shape = circle;
	#var newBody = RigidBody2D.new();
	#var image = ImageTexture.create_from_image(Image.load_from_file("res://textures/Cauldron/Phex-Mini.png"));
	#
	#shape.shape = circle;
	#newBody.add_child = shape;
	#newBody.add_child = image;
	#
	#newBody.linear_velocity = Vector2(0, 20);
	#
	#return newBody;
	
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


func _on_potion_body_entered(body: Node) -> void:
	pass # Replace with function body.
