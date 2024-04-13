extends CanvasLayer


@onready var star_1: TextureRect = %Star1
@onready var star_2: TextureRect = %Star2
@onready var star_3: TextureRect = %Star3
@onready var health_label: Label = %HealthLabel
@onready var money_label: Label = %MoneyLabel
@onready var survived_lebel: Label = %SurvivedLebel
@onready var label: Label = %Label
@onready var base : Node3D = get_tree().get_first_node_in_group("base")
@onready var bank : MarginContainer = get_tree().get_first_node_in_group("bank")
@onready var next_button: Button = %NextButton



func victory() -> void:
    visible = true
    if base.current_health >= 1:
        star_1.modulate = Color.WHITE
        survived_lebel.visible = true
        label.text = "Victory!"
        next_button.visible = true
        get_tree().paused = true
        
    if base.current_health == base.max_health:
        star_2.modulate = Color.WHITE
        health_label.visible = true
        
    if bank.gold > 250:
        star_3.modulate = Color.WHITE
        money_label.visible = true
        


func _on_quit_button_pressed() -> void:
    get_tree().quit()


func _on_next_button_pressed() -> void:
    get_tree().change_scene_to_file("res://levels/level_02.tscn")


func _on_retry_button_pressed() -> void:
    get_tree().paused = false
    get_tree().reload_current_scene()
    
