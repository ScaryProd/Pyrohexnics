extends Button

var movement: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	$"..".position = Vector2(-1152, 249);
	$"../../MainMenu".position = Vector2(0, 2);

#extends Button
#
#var movement: bool
## Called when the node enters the scene tree for the first time.
#func _ready():
	#self.pressed.connect(self._button_pressed)
#
#func _button_pressed():
	#movement = true;
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#if(movement && $"../../../MainMenu".position > Vector2(0, 0)):
		#$"../../../..".position -= Vector2(10,0);
		#$"../../../MainMenu".position -= Vector2(10,0);
		#if(movement && $"../../../MainMenu".position < Vector2(1, 2)):
			#movement = false;
