extends PathFollow3D


@export var speed : float
@export var max_health : int
@export var enemy_cost: int


@onready var base = get_tree().get_first_node_in_group("base")
@onready var bank = get_tree().get_first_node_in_group("bank")
@onready var animation_player: AnimationPlayer = $AnimationPlayer


var current_health: int:
    set(new_health):
        if new_health < current_health:
            animation_player.play("TakeDamage")
        current_health = new_health
        if current_health < 1:
            bank.gold += enemy_cost
            queue_free()


func _ready() -> void:
    current_health = max_health
    Engine.time_scale = 3
    
    
func _process(delta: float) -> void:
    var old_progress_ratio = progress_ratio
    progress += delta * speed
    if old_progress_ratio > progress_ratio:
        base.take_damage()
        set_process(false)
        queue_free()
