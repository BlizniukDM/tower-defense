extends Node3D

@onready var label_3d: Label3D = $Label3D

var max_health : int = 50
var current_health: int:
    set(new_health):
        current_health = new_health
        label_3d.text = str(current_health) + "/" + str(max_health)
        var red : Color = Color.RED
        var white: Color = Color.WHITE
        label_3d.modulate = red.lerp(white, float(current_health - 1.0) / float(max_health - 1.0))
        if current_health < 1:
            get_tree().reload_current_scene()

func _ready() -> void:
    current_health = max_health

func take_damage() -> void:
    current_health -= 1
