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

	object.bounds = { top: 50, bottom: 720 - 50 }


	object.onCreate = function(args)

		playerBitmpas = CreateObject("roArray", 9, true)
		regions = CreateObject("roArray", 9, true)

		for i = 0 to 8
			playerBitmpas.Push(m.game.getBitmap("player" + i.ToStr()))
		end for


		if playerBitmpas.Count() > 8
			m.width = playerBitmpas[0].GetWidth()
			m.height = playerBitmpas[0].GetHeight()

		
			m.x = m.constants.player.xPadding
			m.y = m.game.getCanvas().GetHeight() - m.height - m.constants.player.yPadding
			m.initialY = m.y

			m.addColliderRectangle("player", -m.width / 2, -m.height / 2, m.width, m.height)

			for each bitmap in playerBitmpas
				region = CreateObject("roRegion", bitmap, 0, 0, bitmap.GetWidth(), bitmap.GetWidth())
				region.SetPretranslation( - m.width / 2, - m.height / 2)
				regions.Push(region)
			end for
			m.addAnimatedImage("player", regions, {animation_speed: 10})
		end if
	end function

	object.onUpdate = function(dt)

		if  m.y < 500.0 and m.addGravity = true
			m.yspeed = m.gravityDownSpeed * dt
			m.addGravity = false
		else if m.addGravity
			m.yspeed = -m.gravityUpSpeed * dt
		end if 

		if m.y >= m.initialY and m.addGravity = false
			m.y = m.initialY
			m.canJump = true
		end if 

	end function

	object.onButton = function(code as integer)
		if code = m.constants.controlPressed.up and m.canJump = true
			m.canJump = false
			m.addGravity = true
		else if code = m.constants.controlPressed.right
			m.xspeed = 2
		else if code = m.constants.controlReleased.right
			m.xspeed = 0
		else if code = m.constants.controlPressed.left
			m.xspeed = -2
		else if code = m.constants.controlReleased.left
			m.xspeed = 0
		end if

	end function

end function
