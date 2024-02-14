extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var enemy_names=$AnimatedSprite2D.sprite_frames.get_animation_names()
	#สุ่ม Animation
	var select = enemy_names[randi() % enemy_names.size()] #0-2
	#เล่น Animation
	$AnimatedSprite2D.play(select)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() #ลบ node
