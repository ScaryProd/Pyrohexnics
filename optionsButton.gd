extends Button

var movement: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	movement = true;
	#if(movementvar == 0):
		#backwards = true;
	#if(movementvar > 1200):
		#forward = true;
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(movement && $"../../../..".position > Vector2(0, 0)):
		$"../../../..".position += Vector2(10,0);
		$"../../../../../Label".position += Vector2(10,0);
		if(movement && $"../../../..".position > Vector2(1280, 720)):
			movement = false;
	#if(forward):
		#movementvar -= 1;
		#$"../../../..".position += Vector2(10,0);
		#$"../../../../../Label".position += Vector2(10,0);
		#if(movementvar < 0):
			#forward = false;
	#
	#if(backwards):
		#movementvar += 1;
		#$"../../../..".position -= Vector2(10,0);
		#$"../../../../../Label".position -= Vector2(10,0);
		#if(movementvar == 1280):
			#backwards = false;
	
	#if(!backwards):
		#if(movement && $"../../../..".position < Vector2(1280, 720)):
			#$"../../../..".position += Vector2(10,0);
			#$"../../../../../Label".position += Vector2(10,0);
			#if(movement && $"../../../..".position > Vector2(1279, 719)):
				#backwards = true;
				#movement = false;
	#elif(backwards):
		

	
