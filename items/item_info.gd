extends NinePatchRect

export( NodePath ) onready var item_name = get_node( item_name ) as Label

func display( slot : Inventory_Slot ):
	rect_global_position = slot.rect_size + slot.rect_global_position
	item_name.text = slot.item.item_name
	show()
