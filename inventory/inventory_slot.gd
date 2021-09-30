class_name Inventory_Slot extends TextureRect

export( NodePath ) onready var item_container = get_node( item_container ) as Control

var item : Item

func _ready():
	if item:
		item_container.add_child( item )

func set_item( new_item ):
	item = new_item

func pick_item():
	item.pick_item()
	item_container.remove_child( item )
	item = null

func put_item( new_item ):
	item = new_item
	item.put_item()
	item_container.add_child( item )
