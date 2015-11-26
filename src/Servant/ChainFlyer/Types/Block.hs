{-|
Module      : ChainFlyer
Copyright   : (c) Tatsuya Hirose, 2015
License     : BSD3
Maintainer  : tatsuya.hirose.0804@gmail.com
-}

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Servant.ChainFlyer.Types.Block
( Block(..)
) where

import Control.Monad (mzero)
import Data.Aeson
import Data.Time.Clock
import Data.Time.Format
import GHC.Generics

-- | Block.
data Block = Block
  { block_hash  :: String
  , height      :: Int
  , is_main     :: Bool
  , version     :: Int
  , prev_block  :: String
  , markle_root :: String
  , timestamp   :: UTCTime
  , bits        :: Integer
  , nonce       :: Integer
  , txnum       :: Int
  , total_fees  :: Integer
  , tx_hashes   :: [String]
  } deriving (Show, Generic)

instance FromJSON Block where
    parseJSON (Object v) = Block
                       <$> v .: "block_hash"
                       <*> v .: "height"
                       <*> v .: "is_main"
                       <*> v .: "version"
                       <*> v .: "prev_block"
                       <*> v .: "merkle_root"
                       <*> (v .: "timestamp" >>= parseTimeM True defaultTimeLocale "%Y-%m-%dT%H:%M:%SZ")
                       <*> v .: "bits"
                       <*> v .: "nonce"
                       <*> v .: "txnum"
                       <*> v .: "total_fees"
                       <*> v .: "tx_hashes"
    parseJSON _          = mzero

instance ToJSON Block
