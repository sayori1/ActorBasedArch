
import raylib, src/player, src/actor, src/food, src/utils


var actors*: seq[Actor]



const
  screenWidth = 800
  screenHeight = 450


proc main =
  initWindow(screenWidth, screenHeight, "raylib [core] example - basic window")
  setTargetFPS(60) 

  
  actors.add(getInstance())
  actors.add(newRandomFood())
  actors.add(newRandomFood())
  actors.add(newRandomFood())
  actors.add(newRandomFood())
  actors.add(newRandomFood())

  for actor in actors:
    actor.onStart()

  while not windowShouldClose(): 
    beginDrawing()

    for actor in actors:
      actor.onUpdate()

    for actorA in actors:
      for actorB in actors:
        if(actorA == actorB):
          continue
        if(distanceBetweenActors(actorA, actorB) < actorA.r + actorB.r):
          actorA.onTouch(actorB)
          actorB.onTouch(actorA)

    clearBackground(RayWhite)
    endDrawing()

  closeWindow() 
main()