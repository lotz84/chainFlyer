module Main where

import ChainFlyer
import ChainFlyer.Types

main :: IO ()
main = print =<< getBlockLatest
