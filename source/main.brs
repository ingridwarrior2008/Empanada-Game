sub Main()
	constants = GameConstants()
	game = new_game(constants.width, constants.height, true, constants.backgroundColor) ' This initializes the game engine

	game.loadBitmap("empanada", "pkg:/images/sprites/empanada.png")
	game.loadBitmap("grass", "pkg:/images/sprites/grass.png")
	
	game.loadBitmap("player0", "pkg:/images/sprites/player0.png")
	game.loadBitmap("player1", "pkg:/images/sprites/player1.png")
	game.loadBitmap("player2", "pkg:/images/sprites/player2.png")
	game.loadBitmap("player3", "pkg:/images/sprites/player3.png")
	game.loadBitmap("player4", "pkg:/images/sprites/player4.png")
	game.loadBitmap("player5", "pkg:/images/sprites/player5.png")
	game.loadBitmap("player6", "pkg:/images/sprites/player6.png")
	game.loadBitmap("player7", "pkg:/images/sprites/player7.png")
	game.loadBitmap("player8", "pkg:/images/sprites/player8.png")

	game.loadBitmap("enemy0", "pkg:/images/sprites/enemy0.png")
	game.loadBitmap("enemy1", "pkg:/images/sprites/enemy1.png")
	game.loadBitmap("enemy2", "pkg:/images/sprites/enemy2.png")
	game.loadBitmap("enemy3", "pkg:/images/sprites/enemy3.png")
	game.loadBitmap("enemy4", "pkg:/images/sprites/enemy4.png")
	game.loadBitmap("enemy5", "pkg:/images/sprites/enemy5.png")
	game.loadBitmap("enemy6", "pkg:/images/sprites/enemy6.png")
	game.loadBitmap("enemy7", "pkg:/images/sprites/enemy7.png")
	game.loadBitmap("enemy8", "pkg:/images/sprites/enemy8.png")
    
	game.defineRoom("MainRoom", MainRoom)
	
    game.defineObject("MainCharacter", MainCharacter)
	game.defineObject("Score", Score)
	
		for i = 0 to constants.numGrass
			game.defineObject("GameEnvironment" + i.ToStr(), GameEnvironment)
		end for	

		for i = 0 to constants.pickups.Count()
			game.defineObject("Pickups" + i.ToStr(), Pickups)
		end for	

		for i = 0 to constants.enemies.Count() - 1
			game.defineObject("Enemy" + i.ToStr(), Enemy)
		end for	

	game.changeRoom("MainRoom")
	
    game.Play()
end sub