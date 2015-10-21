module ChainFlyer (
    getBlock
  , getBlockLatest
  , getBlockHeight
  , getTransaction
  , getAddress
) where

import ChainFlyer.Types
import Data.Aeson
import Network.HTTP.Conduit

baseUrl :: String
baseUrl = "https://chainflyer.bitflyer.jp/v1"

getBlock :: String -> IO (Maybe Block)
getBlock hash = decode <$> simpleHttp (baseUrl ++ "/block/" ++ hash)

getBlockLatest :: IO Block
getBlockLatest = (\(Just x) -> x) . decode <$> simpleHttp (baseUrl ++ "/block/latest")

getBlockHeight :: Int -> IO (Maybe Block)
getBlockHeight height = decode <$> simpleHttp (baseUrl ++ "/block/height/" ++ show height)

getTransaction :: String -> IO (Maybe Transaction)
getTransaction hash = decode <$> simpleHttp (baseUrl ++ "/tx/" ++ hash)

getAddress :: String -> IO (Maybe Address)
getAddress address = decode <$> simpleHttp (baseUrl ++ "/address/" ++ address)
