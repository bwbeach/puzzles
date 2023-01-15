{-# OPTIONS_GHC -Wno-incomplete-uni-patterns #-}

module Main where

import Data.Char
import Data.Text (pack, replace, unpack)
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  template <- readFile "template.svg"
  putStr . replaceString "CONTENT" (render . head $ args) $ template

render :: String -> String
render = unlines . concat . zipWith renderOne coords . parseInput

parseInput :: String -> [(String, Char)]
parseInput [] = []
parseInput ('<' : c : cs) = ("lightgreen", c) : parseInput cs
parseInput ('>' : c : cs) = ("pink", c) : parseInput cs
parseInput ('-' : cs) = ("grey", '-') : parseInput cs
parseInput (' ' : cs) = parseInput cs
parseInput ('\n' : cs) = parseInput cs
parseInput (c : cs) = ("white", c) : parseInput cs

coords :: [(Int, Int)]
coords = [(x, y) | y <- [0, 20, 40], x <- [0, 20, 40, 60]]

renderOne :: (Int, Int) -> (String, Char) -> [String]
renderOne (x, y) (color, c) =
  [svgrect, svgtext]
  where
    svgrect =
      replaceString "$x" (show x)
        . replaceString "$y" (show y)
        . replaceString "$c" color
        $ "<rect class=\"box\" x=\"$x\" y=\"$y\" width=\"20\" height=\"20\" fill=\"$c\"/>"
    svgtext =
      replaceString "$x" (show (x + 10))
        . replaceString "$y" (show (y + 10))
        . replaceString "$c" [c]
        $ "<text class=\"letter\" x=\"$x\" y=\"$y\">$c</text>"

colorOf :: Char -> String
colorOf c = if isUpper c then "pink" else "white"

-- | Replaces one substring with another
replaceString :: String -> String -> String -> String
replaceString a b c = unpack (replace (pack a) (pack b) (pack c))
