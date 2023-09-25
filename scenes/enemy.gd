extends CharacterBody2D

var speed =  50
var player_chase = false
var player = null

func _physics_process(delta):
	if(player_chase):
		position += (player.position - position)/speed
		#move_and_collide(Vector2(0,0))
		move_and_slide()
		$AnimatedSprite2D.play("Walk_right")
		$AnimatedSprite2D.flip_h=(player.position.x - position.x)<0
		
		
		
	else:
		$AnimatedSprite2D.play("idle")


func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
	
	
func enemy():
	pass
