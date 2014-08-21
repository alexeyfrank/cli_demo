module Main where

import Control.Monad (when, unless)
import System.Console.Docopt

import Hexlet.Commands.Login

main :: IO()
main = do
    opts <- optionsWithUsageFileDebug "USAGE.txt"

    -- print opts
    -- putStrLn ""

    when (opts `isPresent` (command "login")) $ do
        apiKey <- getArg opts $ argument "<apikey>"
        Hexlet.Commands.Login.run $ show apiKey

    when (opts `isPresent` (longOption "version")) $ do
        putStrLn "Hexlet haskell cli demo v0.0.0.0.0.1.0"
    when (opts `isPresent` (longOption "help")) $ do
        putStrLn =<< readFile "USAGE.txt"
