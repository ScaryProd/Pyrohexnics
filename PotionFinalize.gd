extends Button

@export var SceneTarget: String = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	print("Hello world!")
	if(!self.disabled):
		PlayerVariables.explosionItems = %Potion.get_children()
		get_tree().change_scene_to_file(SceneTarget)

func transfer_data_between_scenes(old_scene, new_scene):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if %Potion.get_child_count() < 1:
		self.disabled = true
	else:
		self.disabled = false
