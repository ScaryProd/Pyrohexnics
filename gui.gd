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
var allTextures = [
	"res://textures/pe-final/pe-alien.png",
	"res://textures/pe-final/pe-corn.png",
	"res://textures/pe-final/pe-dollar.png",
	"res://textures/pe-final/pe-duck.png",
	"res://textures/pe-final/pe-hourglass.png",
	"res://textures/pe-final/pe-meat.png",
	"res://textures/pe-final/pe-person.png",
	"res://textures/pe-final/pe-question.png",
	"res://textures/pe-final/pe-red.png",
	"res://textures/pe-final/pe-shroom.png",
	"res://textures/pe-final/pe-skull.png",
	"res://textures/pe-final/pe-smile-export.png",
	"res://textures/pe-final/pe-smile.png",
	"res://textures/pe-final/pe-v.png",
]
var availableTextures = allTextures;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	availableTextures = allTextures;
	
	for i in InvSize:
		var slot := InventorySlot.new()
		slot.init(ItemData.Type.NATURE, Vector2(80,80))
		%Inv.add_child(slot)
	
	for i in itemsLoad.size():
		var item = InventoryItem.new();
		item.init(generateItem());
		%Inv.get_child(i).add_child(item)
	
	for i in BottleSize:
		var cauldron := InventorySlot.new()
		cauldron.init(ItemData.Type.NATURE, Vector2(112,112))
		cauldron.self_modulate = Color("ffffff00")
		%Potion.add_child(cauldron)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func generateItem():
	var itemType = randi_range(0,4);
	var itemName = "Placeholder"
	var itemDescription = "Placeholder %s" % ItemData.Type.keys()[itemType];
	
	# image logic
	var numberForImage = randi_range(0,availableTextures.size() - 1);
	var itemTexture = ImageTexture.create_from_image(Image.load_from_file(availableTextures[numberForImage]));
	availableTextures[numberForImage]
	availableTextures.erase(itemTexture);
	
	#Color logic
	var itemAmount = randi_range(0,100);
	var itemInitialVelocity = randi_range(0, 3);
	var itemColor = GradientTexture2D.new()
	itemColor.draw(RID(), Vector2(0,0), Color(randi_range(1,9),randi_range(1,9),randi_range(1,9),randi_range(1,9)), true);
	
	var newItem = ItemData.new()
	newItem.init(itemType, itemName, itemDescription, itemTexture, itemAmount, itemInitialVelocity, itemColor);
	return (newItem);
