class_name ItemData
extends Resource

enum Type {NATURE, ARTIFICIAL, HUMAN, CELESTIAL, GREED}

@export var type: Type
@export var name: String
@export_multiline var description: String
@export var texture: Texture2D
@export var amount: int
@export var initialVelocity: int 
@export var color: GradientTexture2D
