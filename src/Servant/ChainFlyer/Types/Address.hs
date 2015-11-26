{-|
Module      : ChainFlyer
Copyright   : (c) Tatsuya Hirose, 2015
License     : BSD3
Maintainer  : tatsuya.hirose.0804@gmail.com
-}

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Servant.ChainFlyer.Types.Address
( Address(..)
) where

import Data.Aeson
import GHC.Generics

-- | Address.
data Address = Address
    { address            :: String
    , unconfirmed_balance :: Integer
    , confirmed_balance   :: Integer
    } deriving (Show, Generic)

instance FromJSON Address
instance ToJSON Address
