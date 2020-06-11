module Utils where

mapTuple :: (a -> b) -> (a, a) -> (b, b) --https://stackoverflow.com/questions/9722689/haskell-how-to-map-a-tuple
mapTuple f (a1, a2) = (f a1, f a2)

toInt :: Float -> Int --convert float to int
toInt = floor

toFloats :: (Int, Int) -> (Float, Float) --convert int tuple to float tuple
toFloats = mapTuple fromIntegral

toInts :: (Float, Float) -> (Int, Int) --convert float tuple to int tuple
toInts = mapTuple toInt 
