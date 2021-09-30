extends Node

export( NodePath ) onready var item_in_hand_node = get_node( item_in_hand_node ) as Control
export( NodePath ) onready var item_info = get_node( item_info ) as Control

var inventories : Array = []
var item_in_hand = null
var item_offset = Vector2.ZERO

func _ready():
	SignalManager.connect( "inventory_ready", self, "_on_inventory_ready" )


func _on_inventory_ready( inventory ):
	inventories.append( inventory )
	
	for slot in inventory.slots:
		slot.connect( "mouse_entered", self, "_on_mouse_entered_slot", [ slot ] )
		slot.connect( "mouse_exited", self, "_on_mouse_exited_slot" )
		slot.connect( "gui_input", self, "_on_gui_input_slot", [ slot ] )

func _input( event : InputEvent ):
	if event is InputEventMouseMotion and item_in_hand:
		item_in_hand.rect_position = event.position - item_offset

func _on_mouse_entered_slot( slot ):
	if slot.item:
		item_info.display( slot )

func _on_mouse_exited_slot():
	item_info.hide()

func _on_gui_input_slot( event : InputEvent, slot : Inventory_Slot ):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if item_in_hand:
			item_in_hand_node.remove_child( item_in_hand )
			
			if slot.item:
				var temp_item = slot.item
				slot.pick_item()
				temp_item.rect_global_position = event.global_position - item_offset
				slot.put_item( item_in_hand )
				item_in_hand = temp_item
				item_in_hand_node.add_child( item_in_hand )
			else:
				slot.put_item( item_in_hand )
				item_in_hand = null
			
		elif slot.item:
			item_in_hand = slot.item
			item_offset = event.global_position - item_in_hand.rect_global_position
			slot.pick_item()
			item_in_hand_node.add_child( item_in_hand )
			item_in_hand.rect_global_position = event.global_position - item_offset






