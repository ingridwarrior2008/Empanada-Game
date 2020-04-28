function Enemy(object)

	object.constants = GameConstants()

	object.x = 0
	object.y = invalid

	object.width = invalid
	object.height = invalid
    object.totalMaxFrames = 8

	object.bounds = { top: 50, bottom: 720 - 50 }

	object.onCreate = function(args)
		enemyBitmpas = CreateObject("roArray", 9, true)
		regions = CreateObject("roArray", 9, true)

		for i = 0 to m.totalMaxFrames
			enemyBitmpas.Push(m.game.getBitmap("enemy" + i.ToStr()))
		end for

        if enemyBitmpas.Count() > m.totalMaxFrames
			
            m.width = enemyBitmpas[0].GetWidth()
			m.height = enemyBitmpas[0].GetHeight()
			m.y = m.game.getCanvas().GetHeight() - m.height - m.constants.player.yPadding

			m.addColliderRectangle("enemy", - m.width / 2, - m.height / 2, m.width, m.height)

			for each bitmap in enemyBitmpas
				region = CreateObject("roRegion", bitmap, 0, 0, bitmap.GetWidth(), bitmap.GetWidth())
				region.SetPretranslation( - m.width / 2, - m.height / 2)
				regions.Push(region)
			end for
		
		m.imageReference = m.addAnimatedImage("enemy", regions, { animation_speed: 0 })
		end if
		
	end function

	object.onUpdate = function(dt)

		
	end function


end function
