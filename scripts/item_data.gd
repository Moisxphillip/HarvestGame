class_name ItemData
extends Resource

enum Type {SEED, TOOL, CROP}

@export var type: Type
@export var item_name: String
@export var stackable: bool
@export var count: int
@export var price_buy: float
@export var price_sell: float
@export var sellable: bool
@export_multiline var description: String
@export var item_texture: Texture2D


