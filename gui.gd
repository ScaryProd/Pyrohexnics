extends CanvasLayer

var InvSize = 9
var BottleSize = 3
var itemsLoad = [
	"res://items/baseItem.tres",
	"res://items/money.tres"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in InvSize:
		var slot := InventorySlot.new()
		slot.init(ItemData.Type.NATURE, Vector2(112,112))
		%Inv.add_child(slot)
	
	for i in itemsLoad.size():
		var item := InventoryItem.new()
		item.init(load(itemsLoad[i]))
		%Inv.get_child(i).add_child(item)
	
	for i in BottleSize:
		var cauldron := InventorySlot.new()
		cauldron.init(ItemData.Type.NATURE, Vector2(112,112))
		%Potion.add_child(cauldron)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
