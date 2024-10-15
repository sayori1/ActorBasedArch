import actor
import raylib

type Player* = ref object of Actor
    health*: float
    score: int

method onStart*(self: Player) =
    echo "Player on start"

method onUpdate*(self: Player) =
    drawCircle(int32(self.x), int32(self.y), self.r, Red)

    drawText($(self.score), 10, 10, 20, LightGray)

    if(isKeyDown(D)):
        self.x += 1
    if(isKeyDown(A)):
        self.x -= 1
    if(isKeyDown(S)):
        self.y += 1
    if(isKeyDown(W)):
        self.y -= 1

    
method onTouch*(self: Player, t: Actor) =
    self.score += int(t.r)
    self.r += t.r
    t.r = 0

# Singleton
let instance: Player = Player(x: 100, y: 100, r: 10, health: 100)

proc getInstance*(): Player = 
    return instance
