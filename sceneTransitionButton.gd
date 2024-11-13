extends Button

@export var SceneTarget: String = ""
enum ButtonType {Start, Options, Exit}
@export var type: ButtonType;


# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	if type == ButtonType.Start:
		get_tree().change_scene_to_file(SceneTarget)
	elif type == ButtonType.Options:
		pass
#		THIS IS WHERE OPTIONS CODE GOES
	elif type == ButtonType.Exit:
		get_tree().quit();
		#THIS IS WHERE EXIT CODE GOES

func transfer_data_between_scenes(old_scene, new_scene):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
