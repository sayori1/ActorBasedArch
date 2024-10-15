import actor, math

proc distanceBetweenActors*(actor: Actor, actor1: Actor): float=
    var dx = actor.x - actor1.x
    var dy = actor.y - actor1.y

    return sqrt(pow(dx, 2) + pow(dy, 2))