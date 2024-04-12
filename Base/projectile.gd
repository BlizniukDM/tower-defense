extends Area3D

@export var speed : float


var direction := Vector3.FORWARD


func _physics_process(delta: float) -> void:
    position += speed * direction * delta


func _on_timer_timeout() -> void:
    queue_free()


func _on_area_entered(area: Area3D) -> void:
    if area.is_in_group("enemy_area"):
        area.get_parent().current_health -= 18
        queue_free()
