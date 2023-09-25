extends Player

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
