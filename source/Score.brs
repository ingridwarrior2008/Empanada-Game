function Score(object)

    object.pickupCount = 0
    object.gameover = false

    object.onCreate = function(args)
    end function

    object.onGameEvent = function(event as string, data as object)
        if event = "score"
            m.pickupCount++
        else if event = "gameover"
            m.gameover = true
        end if
    end function

    object.onDrawEnd = function(canvas as object)
        font = m.game.getFont("default")
        DrawText(canvas, "Empanadas: " + m.pickupCount.ToStr(), canvas.GetWidth() - 200, 100, font, "center", &h0000FFFF)
        if m.gameover
            DrawText(canvas, "Game Over!", canvas.GetWidth()/2, canvas.GetHeight() / 2, font, "center", &h0000FFFF)
        end if
    end function

end function