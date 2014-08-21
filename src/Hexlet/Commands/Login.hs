module Hexlet.Commands.Login(run) where

import System.Directory
import Control.Exception

saveApiKey :: String -> IO()
saveApiKey key = do
     createDirectoryIfMissing True ".hexlet"
     writeFile ".hexlet/key.hexlet" key

run :: String -> IO()
run apiKey = do
    putStrLn $ "Try to login with api key " ++ apiKey

    result <- try $ saveApiKey apiKey :: IO (Either SomeException ())

    case result of
        Left ex -> putStrLn $ "Something went wrong! " ++ show ex
        Right _ -> putStrLn "Login success"
