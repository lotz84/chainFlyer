{-|
Module      : ChainFlyer
Description : Bindings to chainFlyer's API.
Copyright   : (c) Tatsuya Hirose, 2015
License     : BSD3
Maintainer  : tatsuya.hirose.0804@gmail.com
-}

module ChainFlyer (
    getBlock
  , getBlockHeight
  , getLatestBlock
  , getTransaction
  , getAddress
) where

import ChainFlyer.Types
import Data.Aeson
import Data.Maybe (fromJust)
import Network.HTTP.Conduit

baseUrl :: String
baseUrl = "https://chainflyer.bitflyer.jp/v1"

-- | Get block info of given hash.
getBlock :: String -> IO Block
getBlock hash = fromJust . decode <$> simpleHttp (baseUrl ++ "/block/" ++ hash)

-- | Get block info of given height.
getBlockHeight :: Int -> IO Block
getBlockHeight height = fromJust . decode <$> simpleHttp (baseUrl ++ "/block/height/" ++ show height)

-- | Get latest block info.
getLatestBlock :: IO Block
getLatestBlock = fromJust . decode <$> simpleHttp (baseUrl ++ "/block/latest")

-- | Get transaction info of given hash.
getTransaction :: String -> IO Transaction
getTransaction hash = fromJust . decode <$> simpleHttp (baseUrl ++ "/tx/" ++ hash)

-- | Get address info of given hash.
getAddress :: String -> IO Address
getAddress address = fromJust . decode <$> simpleHttp (baseUrl ++ "/address/" ++ address)
