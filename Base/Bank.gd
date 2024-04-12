extends MarginContainer


@export var starting_gold :int


@onready var label: Label = $Label


var gold: int:
    set(new_gold):
        gold = max(new_gold, 0)
        label.text = "gold: " + str(gold)
        #if gold < 0:
            #gold = 0


func _ready() -> void:
    gold = starting_gold
