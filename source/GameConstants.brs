function GameConstants() as Object
    constants = {
        title: "Empanada Game",
        backgroundColor: &hFFFFFF,
        width: 1280,
        height: 720,
        numGrass: 20,
        controlPressed: { up: 2, down: 3, left: 4, right: 5 },
        controlReleased: { up: 102, down: 103, left: 104, right: 105 },
        player: {xPadding: 50, yPadding: 10},
        pickups: {pickup0: {x: 200, y: 560}, pickup1: {x: 450, y: 530}, pickup2: {x: 600, y: 560}, pickup3: {x: 900, y: 520} },
        enemies: { enemy0: 300, enemy1: 530, enemy2: 820 }
    }
    return constants
end function