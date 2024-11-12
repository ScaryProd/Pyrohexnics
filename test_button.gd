extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	#if(%Potion.get_child(0).get_child(0).data != null):
		#for x in %Potion.get_children():
			#if(x.get_child(0).data != null):
				#PlayerVariables.explosionItems.append(x.get_child(0).data)
				#print("Added %s" % x.get_child(0).data);
			
		
	PlayerVariables.explosionItems.append(%Potion.get_child(0).get_child(0).data)
	print(PlayerVariables.explosionItems[0].name)
	$"../Button".disabled = false
	pass
	#print(PlayerVariables.savedText)
	#PlayerVariables.savedText += '1'
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
