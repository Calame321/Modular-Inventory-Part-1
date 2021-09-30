extends NinePatchRect

export( NodePath ) onready var inventory = get_node( inventory ) as Inventory

func _ready():
	rect_size.y = 20 + inventory.rect_size.y
