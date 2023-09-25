extends CharacterBody2D
class_name myplayer

var enemy_in_attack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true

var SPEED = 80
const walk=50
const run=100
var current_dir= "none"


func _physics_process(delta):
	player_movement(delta)
	
	enemy_attacks()
	if(health<=0):
		player_alive=false;
		health=0;
		print("player has been killed")

func player_movement(delta):
	
	if Input.is_action_pressed("run"):
		SPEED=run
	else:
		SPEED=walk
		
	
	if Input.is_action_pressed("ui_right"):
		play_anim(1)
		current_dir="right"
		velocity.x=SPEED
		velocity.y=0
	
	elif Input.is_action_pressed("ui_left"):
		current_dir="left"
		play_anim(1)
		velocity.x=-SPEED
		velocity.y=0
	
	elif Input.is_action_pressed("ui_up"):
		play_anim(1)
		current_dir="up"		
		velocity.y=-SPEED
		velocity.x=0
	
	elif Input.is_action_pressed("ui_down"):
		play_anim(1)		
		current_dir="down"		
		velocity.y=SPEED
		velocity.x=0
		
	else:
		play_anim(0)		
		velocity.x=0
		velocity.y=0
	
	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim =$LPCAnimatedSprite2D as LPCAnimatedSprite2D
	
	
	if dir =="right":
		
		if movement==1:
			anim.play(LPCAnimatedSprite2D.LPCAnimation.WALK_RIGHT)
		elif movement == 0:
			anim.play(LPCAnimatedSprite2D.LPCAnimation.IDLE_RIGHT)
	
	if dir =="left":
		
		if movement==1:
			anim.play(LPCAnimatedSprite2D.LPCAnimation.WALK_LEFT)
		elif movement == 0:
			anim.play(LPCAnimatedSprite2D.LPCAnimation.IDLE_LEFT)

	if dir =="up":
	
		if movement==1:
			anim.play(LPCAnimatedSprite2D.LPCAnimation.WALK_UP)
		elif movement == 0:
			anim.play(LPCAnimatedSprite2D.LPCAnimation.IDLE_UP)
				
	if dir =="down":
		
		if movement==1:
			anim.play(LPCAnimatedSprite2D.LPCAnimation.WALK_DOWN)
		elif movement == 0:
			anim.play(LPCAnimatedSprite2D.LPCAnimation.IDLE_DOWN)


func _on_hitbox_body_entered(body):
	if body.has_method('enemy'):
		enemy_in_attack_range = true;


func _on_hitbox_body_exited(body):
	if body.has_method('enemy'):
		enemy_in_attack_range = false;


func enemy_attacks():
	if enemy_in_attack_range == true and enemy_attack_cooldown==true:
		health -= 10;
		enemy_attack_cooldown=false;
		$Attack_Cool_Down.start()
		print(health)

	
func player():
	pass


func _on_attack_cool_down_timeout():
	enemy_attack_cooldown=true;	

