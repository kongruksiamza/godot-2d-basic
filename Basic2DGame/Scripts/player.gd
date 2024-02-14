extends Area2D

var speed=280 #ความเร็ว
var display_size #ขนาดหน้าจอเกม
signal take_damage

func _ready():
	display_size=get_viewport_rect().size
	hide()
	
func _process(delta):
	var velocity = Vector2.ZERO #(x,y)
	#รับ Input จาก keyboard
	if Input.is_action_pressed("move_right"):
		velocity.x+=1
	if Input.is_action_pressed("move_left"):
		velocity.x-=1
	if Input.is_action_pressed("move_down"):
		velocity.y+=1
	if Input.is_action_pressed("move_up"):
		velocity.y-=1
	#เคลื่อนไหว
	if velocity.length()>0:
		velocity=velocity.normalized()*speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	#เคลื่อนที่	
	position+=velocity*delta
	#ตั้งค่าขอบเขตการเคลื่อนที่
	position=position.clamp(Vector2.ZERO,display_size)
	#flip animation
	if velocity.x!=0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v=false #ไม่สามารถพลิกตัวในแนวตั้งได้
		$AnimatedSprite2D.flip_h=velocity.x<0
	
	if velocity.y!=0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v=velocity.y>0


func _on_body_entered(body):
	print("ผู้เล่นโดนชน")
	hide()
	take_damage.emit()
	$CollisionShape2D.set_deferred("disabled",true)
	
func create_player(point):
	position=point
	show()
	$CollisionShape2D.disabled=false
