function Pickups(object)

	object.constants = GameConstants()
	
	object.x = 500
	object.y = invalid

	object.width = invalid
	object.height = invalid

	object.bounds = { top: 50, bottom: 720 - 50 }

	object.pickupsBitmap = invalid
	
	object.onCreate = function(args)
		m.y = m.game.getCanvas().GetHeight() - 20

		pickupsBitmap = m.game.getBitmap("empanada")

		if pickupsBitmap <> invalid
			m.width = pickupsBitmap.GetWidth()
			m.height = pickupsBitmap.GetHeight()

			m.addColliderRectangle("empanada", - pickupsBitmap.GetWidth() / 2, - pickupsBitmap.GetHeight() / 2, pickupsBitmap.GetWidth(), pickupsBitmap.GetHeight())

			region = CreateObject("roRegion", pickupsBitmap, 0, 0, m.width, m.height)
			region.SetPretranslation( - m.width / 2, - m.height / 2)
			m.addImage("main", region)
		end if

	end function

	object.onCollision = function(collider_name as string, other_collider_name as string, other_instance as object)
		need_to_play_hit_sound = false

		if other_collider_name = "player"
			m.game.postGameEvent("score", {})
			m.game.destroyInstance(m)
		end if

	end function

	object.onUpdate = function(dt)

	end function

end function
