extends Button

@export var SceneTarget: String = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	print("Hello world!")
	#print(%Potion.get_child(0).name)
	get_tree().change_scene_to_file(SceneTarget)

func transfer_data_between_scenes(old_scene, new_scene):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
