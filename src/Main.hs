module Main where

import           GameLogic
import           Graphics.Gloss
import           Graphics.Gloss.Interface.Pure.Game
import           Rendering
import           System.Random
--main driver program
main :: IO ()
main = do
  seed <- getStdGen --random seed
  play --start game 
    window
    backgroundColor
    fps
    (initialState seed)
    drawGame
    handleInputEvents
    nextFrame
  where --handle key input
    handleInputEvents (EventKey (SpecialKey KeyUp) _ _ _) game =
      keyPressed "ArrowUp" game
    handleInputEvents (EventKey (SpecialKey KeyDown) _ _ _) game =
      keyPressed "ArrowDown" game
    handleInputEvents (EventKey (SpecialKey KeyLeft) _ _ _) game =
      keyPressed "ArrowLeft" game
    handleInputEvents (EventKey (SpecialKey KeyRight) _ _ _) game =
      keyPressed "ArrowRight" game
    handleInputEvents (EventKey (Char 'r') _ _ _) game = keyPressed "r" game
    handleInputEvents _ game = game
