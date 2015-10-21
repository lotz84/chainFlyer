{-# LANGUAGE OverloadedStrings #-}

module ChainFlyer.Types (
    Block(..)
  , TransactionInput(..)
  , TransactionOutput(..)
  , Transaction(..)
  , Address(..)
) where

import Control.Monad (mzero)
import Data.Aeson

data Block = Block
    { blockHash       :: String
    , blockHeight     :: Int
    , blockIsMain     :: Bool
    , blockVersion    :: Int
    , blockPrevBlock  :: String
    , blockMerkleRoot :: String
    , blockTimestamp  :: String -- TODO
    , blockBits       :: Integer
    , blockNonce      :: Integer
    , blockTxnum      :: Int
    , blockTotalFees  :: Integer
    , blockTxHashes   :: [String]
    } deriving Show

instance FromJSON Block where
    parseJSON (Object v) = Block
                       <$> v .: "block_hash"
                       <*> v .: "height"
                       <*> v .: "is_main"
                       <*> v .: "version"
                       <*> v .: "prev_block"
                       <*> v .: "merkle_root"
                       <*> v .: "timestamp"
                       <*> v .: "bits"
                       <*> v .: "nonce"
                       <*> v .: "txnum"
                       <*> v .: "total_fees"
                       <*> v .: "tx_hashes"
    parseJSON _          = mzero

data TransactionInput = TransactionInput
    { txiPrevHash  :: String
    , txiPrevIndex :: Integer
    , txiValue     :: Integer
    , txiScript    :: String
    , txiAddress   :: String
    , txiSequence  :: Integer
    } deriving Show

instance FromJSON TransactionInput where
    parseJSON (Object v) = TransactionInput
                       <$> v .: "prev_hash"
                       <*> v .: "prev_index"
                       <*> v .: "value"
                       <*> v .: "script"
                       <*> v .: "address"
                       <*> v .: "sequence"
    parseJSON _          = mzero

data TransactionOutput = TransactionOutput
    { txoValue   :: Integer
    , txoScript  :: String
    , txoAddress :: String
    } deriving Show

instance FromJSON TransactionOutput where
    parseJSON (Object v) = TransactionOutput
                       <$> v .: "value"
                       <*> v .: "script"
                       <*> v .: "address"
    parseJSON _          = mzero

data Transaction = Transaction
    { txHash         :: String
    , txBlockHeight  :: Int
    , txConfirmed    :: Int
    , txFees         :: Integer
    , txSize         :: Int
    , txReceivedDate :: String -- TODO
    , txVersion      :: Int
    , txLockTime     :: Int
    , txInputs       :: [TransactionInput]
    , txOutputs      :: [TransactionOutput]
    } deriving Show

instance FromJSON Transaction where
    parseJSON (Object v) = Transaction
                       <$> v .: "tx_hash"
                       <*> v .: "block_height"
                       <*> v .: "confirmed"
                       <*> v .: "fees"
                       <*> v .: "size"
                       <*> v .: "received_date"
                       <*> v .: "version"
                       <*> v .: "lock_time"
                       <*> v .: "inputs"
                       <*> v .: "outputs"
    parseJSON _          = mzero

data Address = Address
    { address            :: String
    , unconfirmedBalance :: Integer
    , confirmedBalance   :: Integer
    } deriving Show

instance FromJSON Address where
    parseJSON (Object v) = Address
                       <$> v .: "address"
                       <*> v .: "unconfirmed_balance"
                       <*> v .: "confirmed_balance"
    parseJSON _          = mzero
