extends AnimatedSprite2D

var speed : int = 600
var direction : int

@onready var fireball: AnimatedSprite2D = $"."

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	move_local_x(direction * speed * delta)
	fireball_animation()

func _on_timer_timeout() -> void:
	queue_free()

func fireball_animation():
	if direction != 0:
		fireball.flip_h = false if direction > 0 else true
