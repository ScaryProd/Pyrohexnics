extends CanvasLayer

var InvSize = 9
var BottleSize = 1
var itemsLoad = [
	"res://items/baseItem.tres",
	"res://items/money.tres",
	"res://items/AllItems/item1.tres",
	"res://items/AllItems/item2.tres",
	"res://items/AllItems/item2.tres",
	"res://items/AllItems/item3.tres",
	"res://items/AllItems/item2.tres",
	"res://items/AllItems/item2.tres",
	"res://items/AllItems/item2.tres",
]
#enum Type {MEME, NATURAL, TYPICAL, ICON}
var allTextures = [
	["res://textures/Phex-DesignsFinal/pe-alien.png", ItemData.Type.MEME],
	["res://textures/Phex-DesignsFinal/pe-bean.png", ItemData.Type.NATURAL],
	["res://textures/Phex-DesignsFinal/pe-cat.png", ItemData.Type.NATURAL],
	["res://textures/Phex-DesignsFinal/pe-circle.png", ItemData.Type.TYPICAL],
	["res://textures/Phex-DesignsFinal/pe-corn.png", ItemData.Type.NATURAL],
	["res://textures/Phex-DesignsFinal/pe-crosshair.png", ItemData.Type.TYPICAL],
	["res://textures/Phex-DesignsFinal/pe-dollar.png", ItemData.Type.ICON],
	["res://textures/Phex-DesignsFinal/pe-duck.png", ItemData.Type.NATURAL],
	["res://textures/Phex-DesignsFinal/pe-eye.png", ItemData.Type.NATURAL],
	["res://textures/Phex-DesignsFinal/pe-geml.png", ItemData.Type.ICON],
	["res://textures/Phex-DesignsFinal/pe-heart.png", ItemData.Type.TYPICAL],
	["res://textures/Phex-DesignsFinal/pe-hourglass.png", ItemData.Type.ICON],
	["res://textures/Phex-DesignsFinal/pe-meat.png", ItemData.Type.MEME],
	["res://textures/Phex-DesignsFinal/pe-nirv.png", ItemData.Type.MEME],
	["res://textures/Phex-DesignsFinal/pe-peanut.png", ItemData.Type.NATURAL],
	["res://textures/Phex-DesignsFinal/pe-person.png", ItemData.Type.NATURAL],
	["res://textures/Phex-DesignsFinal/pe-question.png", ItemData.Type.ICON],
	["res://textures/Phex-DesignsFinal/pe-red.png", ItemData.Type.TYPICAL],
	["res://textures/Phex-DesignsFinal/pe-shroom.png", ItemData.Type.MEME],
	["res://textures/Phex-DesignsFinal/pe-skull.png", ItemData.Type.NATURAL],
	["res://textures/Phex-DesignsFinal/pe-smileChat.png", ItemData.Type.MEME],
	["res://textures/Phex-DesignsFinal/pe-square.png", ItemData.Type.TYPICAL],
	["res://textures/Phex-DesignsFinal/pe-sun.png", ItemData.Type.TYPICAL],
	["res://textures/Phex-DesignsFinal/pe-v.png", ItemData.Type.MEME],
	]
var availableTextures = allTextures;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	availableTextures = allTextures;
	
	for i in InvSize:
		var slot := InventorySlot.new()
		slot.init(ItemData.Type.NATURAL, Vector2(80,80))
		%Inv.add_child(slot)
	
	for i in BottleSize:
		var cauldron := InventorySlot.new()
		cauldron.init(ItemData.Type.NATURAL, Vector2(112,112))
		cauldron.self_modulate = Color("ffffff00")
		%Potion.add_child(cauldron)
		
	for i in itemsLoad.size():
		var item = InventoryItem.new();
		item.init(generateItem());
		%Inv.get_child(i).add_child(item)

func generateItems(): 
	# restore textures so we can use them again
	availableTextures = allTextures;
	
	#delete the children slots in the inventory grid
	if %Inv.get_child_count() > 0:
		var children = %Inv.get_children()
		for c in children:
			%Inv.remove_child(c)
			c.queue_free()
			
	
	# then restore them so we can put items in them again
	for i in InvSize:
		var slot := InventorySlot.new()
		slot.init(ItemData.Type.MEME, Vector2(80,80))
		%Inv.add_child(slot)
		
	for i in itemsLoad.size():
		var item = InventoryItem.new();
		item.init(generateItem());
		%Inv.get_child(i).add_child(item)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func generateItem():
	# image logic
	var numberForImage = randi_range(0,availableTextures.size() - 1);
	var itemTexture = ImageTexture.create_from_image(Image.load_from_file(availableTextures[numberForImage][0]));
	var itemType = availableTextures[numberForImage][1];
	#availableTextures[numberForImage]
	availableTextures.pop_at(numberForImage);
	
	var itemName = "Placeholder"
	var itemDescription = "Placeholder %s" % ItemData.Type.keys()[itemType];
	
	#Color logic
	var itemAmount = randi_range(0,1000);
	var itemInitialVelocity = randi_range(0, 1000);
	var itemColor = GradientTexture2D.new()
	itemColor.draw(RID(), Vector2(0,0), Color(randi_range(1,9),randi_range(1,9),randi_range(1,9),randi_range(1,9)), true);
	
	var newItem = ItemData.new()
	newItem.init(itemType, itemName, itemDescription, itemTexture, itemAmount, itemInitialVelocity, itemColor);
	return (newItem);
