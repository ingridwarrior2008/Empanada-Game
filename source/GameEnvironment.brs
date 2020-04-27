function GameEnvironment(object)

	object.x = 0
	object.y = invalid

	object.width = invalid
	object.height = invalid

	object.bounds = { top: 50, bottom: 720 - 50 }

	object.grassBitmap = invalid

	object.onCreate = function(args)
		
		m.y = m.game.getCanvas().GetHeight() - 15

		grassBitmap = m.game.getBitmap("grass")

		if grassBitmap <> invalid
			m.width = grassBitmap.GetWidth()
			m.height = grassBitmap.GetHeight()

			m.addColliderRectangle("grassBitmap", - grassBitmap.GetWidth() / 2, - grassBitmap.GetHeight() / 2, grassBitmap.GetWidth(), grassBitmap.GetHeight())

			region = CreateObject("roRegion", grassBitmap, 0, 0, m.width, m.height)
			region.SetPretranslation( - m.width / 2, - m.height / 2)
			m.addImage("main", region)
		end if
	end function

	object.onUpdate = function(dt)

	end function

end function
