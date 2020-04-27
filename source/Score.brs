function Score(object)

    object.pickupCount = 0

    object.onCreate = function(args)
    end function

    object.onGameEvent = function(event as string, data as object)
        if event = "score"
            m.pickupCount++
        end if
    end function

    object.onDrawEnd = function(canvas as object)
        font = m.game.getFont("default")
        DrawText(canvas, m.pickupCount.ToStr(), canvas.GetWidth() - 100, 100, font, "center", &h0000FFFF)
    end function

end function