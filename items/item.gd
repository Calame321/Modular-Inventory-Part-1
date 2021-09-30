class_name Item extends TextureRect

export( String ) var id
export( String ) var item_name

func pick_item():
	mouse_filter = Control.MOUSE_FILTER_IGNORE

func put_item():
	mouse_filter = Control.MOUSE_FILTER_PASS
