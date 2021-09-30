extends Node

onready var items = {
	"tree" : preload( "res://items/data/tree.tscn" ),
	"stone_brick" : preload( "res://items/data/stone_brick.tscn" ),
	"gold" : preload( "res://items/data/gold.tscn" ),
	"crystal" : preload( "res://items/data/crystal.tscn" ),
}

func get_item( id : String ):
	return items[ id ].instance()
