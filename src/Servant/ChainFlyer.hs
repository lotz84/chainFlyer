{-|
Module      : ChainFlyer
Copyright   : (c) Tatsuya Hirose, 2015
License     : BSD3
Maintainer  : tatsuya.hirose.0804@gmail.com
-}

{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Servant.ChainFlyer
( BaseURL
, ChainFlyerAPI
, chainFlyerAPI
, BlockAPI
, blockAPI
, BlockHeightAPI
, blockHeightAPI
, LatestBlockAPI
, latestBlockAPI
, TransactionAPI
, transactionAPI
, AddressAPI
, addressAPI
) where

import Data.Proxy
import Servant.API
import Servant.ChainFlyer.Types.Block
import Servant.ChainFlyer.Types.Transaction
import Servant.ChainFlyer.Types.Address

-- | Common API root.
type BaseURL = "v1"

-- | ChainFlyer's all API
type ChainFlyerAPI = BlockAPI
                   :<|> BlockHeightAPI
                   :<|> LatestBlockAPI
                   :<|> TransactionAPI
                   :<|> AddressAPI

-- | Proxy
chainFlyerAPI :: Proxy ChainFlyerAPI
chainFlyerAPI = Proxy

-- | GET \/block\/:hash
type BlockAPI = BaseURL :> "block" :> Capture "hash" String :> Get '[JSON] Block

-- | Proxy
blockAPI :: Proxy BlockAPI
blockAPI = Proxy

-- | GET \/block\/height\/:height
type BlockHeightAPI = BaseURL :> "block" :> "height" :> Capture "height" Int :> Get '[JSON] Block

-- | Proxy
blockHeightAPI :: Proxy BlockHeightAPI
blockHeightAPI = Proxy

-- | GET \/block\/latest
type LatestBlockAPI = BaseURL :> "block" :> "latest" :> Get '[JSON] Block

-- | Proxy
latestBlockAPI :: Proxy LatestBlockAPI
latestBlockAPI = Proxy

-- | GET \/tx\/:hash
type TransactionAPI = BaseURL :> "tx" :> Capture "hash" String :> Get '[JSON] Transaction

-- | Proxy
transactionAPI :: Proxy TransactionAPI
transactionAPI = Proxy

-- | GET \/address\/:address
type AddressAPI = BaseURL :> "address" :> Capture "address" String :> Get '[JSON] Address

-- | Proxy
addressAPI :: Proxy AddressAPI
addressAPI = Proxy
