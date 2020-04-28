function MainCharacter(object)

	object.constants = GameConstants()

	object.x = invalid
	object.y = invalid
	object.initialY = invalid

	object.canJump = true
	object.addGravity = false

	object.width = invalid
	object.height = invalid
	object.gravityUpSpeed = 400
	object.gravityDownSpeed = 200

	object.playerBitmap = invalid
	object.imageReference = invalid

	object.bounds = { top: 50, bottom: 720 - 50 }

	object.totalMaxFrames = 8
	object.animationPerFrame = 0
	object.currentFrame = 0
	object.elipseTime = 0
	object.Animate = invalid
	object.canRunAnimation = false

	object.onCreate = function(args)
		m.animationPerFrame = 1.0 / m.totalMaxFrames		
		
		playerBitmpas = CreateObject("roArray", 9, true)
		regions = CreateObject("roArray", 9, true)

		for i = 0 to m.totalMaxFrames
			playerBitmpas.Push(m.game.getBitmap("player" + i.ToStr()))
		end for

		if playerBitmpas.Count() > m.totalMaxFrames
			m.width = playerBitmpas[0].GetWidth()
			m.height = playerBitmpas[0].GetHeight()

			m.x = m.constants.player.xPadding
			m.y = m.game.getCanvas().GetHeight() - m.height - m.constants.player.yPadding
			m.initialY = m.y

			m.addColliderRectangle("player", - m.width / 2, - m.height / 2, m.width, m.height)

			for each bitmap in playerBitmpas
				region = CreateObject("roRegion", bitmap, 0, 0, bitmap.GetWidth(), bitmap.GetWidth())
				region.SetPretranslation( - m.width / 2, - m.height / 2)
				regions.Push(region)
			end for
		
		m.imageReference = m.addAnimatedImage("player", regions, { animation_speed: 0 })
		end if
	end function

	object.onUpdate = function(dt)

		if m.y < 470.0 and m.addGravity = true
			m.yspeed = m.gravityDownSpeed * dt
			m.addGravity = false
		else if m.addGravity
			m.yspeed = - m.gravityUpSpeed * dt
		end if

		if m.y >= m.initialY and m.addGravity = false
			m.y = m.initialY
			m.canJump = true
		end if

		m.imageReference.index = m.currentFrame
		
		if m.canRunAnimation = true
			m.Animate(dt)
		end if 
	end function

	object.Animate = function(dt)

		m.elipseTime += dt
		if m.elipseTime >= m.animationPerFrame
			m.elipseTime = 0
			m.currentFrame++
			if m.currentFrame >= m.totalMaxFrames
				m.currentFrame = 0
			end if
		end if
	end function

	object.onButton = function(code as integer)
		if code = m.constants.controlPressed.up and m.canJump = true
			m.canJump = false
			m.addGravity = true
		else if code = m.constants.controlPressed.right
			m.xspeed = 2
			m.canRunAnimation = true
		else if code = m.constants.controlReleased.right
			m.xspeed = 0
			m.canRunAnimation = false
			m.currentFrame = 0
		else if code = m.constants.controlPressed.left
			m.xspeed = -2
			m.canRunAnimation = true
		else if code = m.constants.controlReleased.left
			m.xspeed = 0
			m.currentFrame = 0
			m.canRunAnimation = false
		end if

	end function

	 object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)
		need_to_play_hit_sound = false

		if other_collider_name = "enemy"
			m.game.postGameEvent("gameover", {})
			' m.game.destroyInstance(m)
		end if

	end function

end function
