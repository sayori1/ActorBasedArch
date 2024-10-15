import actor
import raylib, random

type Food* = ref object of Actor

proc newRandomFood*(): Food =
    let newFood = Food(x: float(rand(1000)), y: float(rand(100)), r: 5)
    return newFood

method onStart*(self: Food) =
    echo "Player on start"

method onUpdate*(self: Food) =
    drawCircle(int32(self.x), int32(self.y), self.r, Green)
