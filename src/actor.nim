type Actor* = ref object of RootObj
    name*: string
    x*: float
    y*: float
    r*: float
    active: bool = true


method onStart*(self: Actor) =
    echo "On start"

method onUpdate*(self: Actor) =
    echo "On update"

method onTouch*(self: Actor, another: Actor) =
    echo "On touch"
    