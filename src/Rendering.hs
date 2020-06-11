module Rendering where

import           GameLogic
import           Graphics.Gloss
import           Utils

tileSize = 30 :: Float --tile size 30 px

calculateNumberOfTiles (low, high) = abs low + abs high --calculate number of tiles

numberOfTiles = calculateNumberOfTiles $ toFloats gridCoordinatesRange 

totalScreenSize = numberOfTiles * tileSize -- calculate window size with tiles(20x20 px each)

width, height, offset :: Int
width = toInt totalScreenSize --window width

height = toInt totalScreenSize --window height

offset = 0

window = InWindow "Snake" (width, height) (offset, offset) --initialise window

backgroundColor = greyN 0.8 --black background

fps = 5 :: Int --refresh window every 5 frames

type Shape = (Float -> Float -> Picture)

draw :: Color -> Shape -> Float -> Point -> Picture
draw col shape size (x, y) = translate x y $ color col $ shape size size --draw shape/picture

getPoint :: Location -> Point
getPoint = mapTuple ((+ tileSize / 2) . (* tileSize)) . toFloats --calculate coordinate from window

drawGame :: SnakeGame -> Picture
drawGame game = pictures [snakepicture, foodpicture] --draw initial window
  where
    snakepicture = drawSnakeBody (map getPoint $ snakeBody game)
    foodpicture = drawFood $ getPoint $ food game

drawFood :: Point -> Picture --draw cherry(red dot)
drawFood = draw red rectangleSolid tileSize

drawSnakeBody :: [Point] -> Picture --draw snake body
drawSnakeBody = pictures . map drawSnakeBodyPart

drawSnakeBodyPart :: Point -> Picture --draw snake body part(yellow dot)
drawSnakeBodyPart = draw (yellow) rectangleSolid tileSize


