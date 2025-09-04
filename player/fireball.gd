extends AnimatedSprite2D

const FIREBALL_IMPACT_EFFECT = preload("res://player/FireballImpactEffect.tscn")

var speed : int = 500
var direction : int

@onready var fireball: AnimatedSprite2D = $"."
# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	print(direction)
	move_local_x(direction * speed * delta)
	fireball_animation()
	

func _on_timer_timeout() -> void:
	queue_free()

func fireball_animation():
	if direction != 0:
		fireball.flip_h = false if direction > 0 else true
	


func _on_hitbox_area_entered(area: Area2D) -> void:
	print("Fireball area entered")
	fireball_impact()

func _on_hitbox_body_entered(body: Node2D) -> void:
	print("Fireball body entered")
	fireball_impact()

func fireball_impact():
	var fireball_impact_effect_instance = FIREBALL_IMPACT_EFFECT.instantiate() as Node2D
	fireball_impact_effect_instance.global_position = global_position
	get_parent().add_child(fireball_impact_effect_instance)
	
	queue_free()
