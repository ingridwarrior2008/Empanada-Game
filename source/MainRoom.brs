function MainRoom(object)

    object.onCreate = function(args)

        m.constants = GameConstants()
        m.game.createInstance("MainCharacter")
        m.game.createInstance("Pickups")
        m.game.createInstance("Score")

        padding = 0
		for i = 0 to m.constants.numGrass
			grass = m.game.createInstance("GameEnvironment" + i.ToStr())
            grass.x = padding + grass.width
            padding = grass.x
		end for

        for i = 0 to m.constants.pickups.Count() - 1
			pickup = m.game.createInstance("Pickups" + i.ToStr())
            pickup.x = m.constants.pickups.Lookup("pickup"+ i.ToStr()).x
            pickup.y = m.constants.pickups.Lookup("pickup"+ i.ToStr()).y
		end for	


    end function

    object.onUpdate = function(dt)
        
    end function

    object.onDrawBegin = function(canvas)
        ' canvas.DrawRect(0, 0, 1280, 50, &hFFFFFFFF)
        ' canvas.DrawRect(0, 720 - 50, 1280, 50, &hFFFFFFFF)
        
        DrawText(canvas, m.constants.title, canvas.GetWidth() / 2, 20, m.game.getFont("default"), "center", &h0000FFFF)
    end function

end function