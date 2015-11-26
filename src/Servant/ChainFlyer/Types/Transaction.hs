{-|
Module      : ChainFlyer
Copyright   : (c) Tatsuya Hirose, 2015
License     : BSD3
Maintainer  : tatsuya.hirose.0804@gmail.com
-}

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Servant.ChainFlyer.Types.Transaction
( TransactionInput(..)
, TransactionOutput(..)
, Transaction(..)
) where

import Control.Monad (mzero)
import Data.Aeson
import Data.Time.Clock
import Data.Time.Format
import GHC.Generics

-- | Input of a transaction.
data TransactionInput = TransactionInput
  { prev_hash  :: String
  , prev_index :: Integer
  , in_value   :: Integer
  , in_script  :: String
  , in_address :: String
  , sequence   :: Integer
  } deriving (Show, Generic)

instance FromJSON TransactionInput where
  parseJSON (Object v) = TransactionInput
                       <$> v .: "prev_hash"
                       <*> v .: "prev_index"
                       <*> v .: "value"
                       <*> v .: "script"
                       <*> v .: "address"
                       <*> v .: "sequence"
  parseJSON _          = mzero

instance ToJSON TransactionInput where
  toJSON (TransactionInput prev_hash prev_index value script address sequence) =
    object [ "prev_hash"  .= prev_hash
           , "prev_index" .= prev_index
           , "value"      .= value
           , "script"     .= script
           , "address"    .= address
           , "sequence"   .= sequence
           ]

-- | Output of a transaction.
data TransactionOutput = TransactionOutput
    { out_value    :: Integer
    , out_script  :: String
    , out_address :: String
    } deriving (Show, Generic)

instance FromJSON TransactionOutput where
  parseJSON (Object v) = TransactionOutput
                       <$> v .: "value"
                       <*> v .: "script"
                       <*> v .: "address"
  parseJSON _          = mzero

instance ToJSON TransactionOutput where
  toJSON (TransactionOutput value script address) =
    object [ "value"   .= value
           , "script"  .= script
           , "address" .= address
           ]

-- | Transaction.
data Transaction = Transaction
    { tx_hash       :: String
    , block_height  :: Int
    , confirmed     :: Int
    , fees          :: Integer
    , size          :: Int
    , received_date :: UTCTime
    , version       :: Int
    , lock_time     :: Int
    , inputs        :: [TransactionInput]
    , outputs       :: [TransactionOutput]
    } deriving (Show, Generic)

instance FromJSON Transaction where
    parseJSON (Object v) = Transaction
                       <$> v .: "tx_hash"
                       <*> v .: "block_height"
                       <*> v .: "confirmed"
                       <*> v .: "fees"
                       <*> v .: "size"
                       <*> (v .: "received_date" >>= parseTimeM True defaultTimeLocale "%Y-%m-%dT%H:%M:%S" . takeWhile (/='.'))
                       <*> v .: "version"
                       <*> v .: "lock_time"
                       <*> v .: "inputs"
                       <*> v .: "outputs"
    parseJSON _          = mzero

instance ToJSON Transaction
