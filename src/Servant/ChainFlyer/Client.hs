{-|
Module      : ChainFlyer
Copyright   : (c) Tatsuya Hirose, 2015
License     : BSD3
Maintainer  : tatsuya.hirose.0804@gmail.com
-}

module Servant.ChainFlyer.Client
( getBlock
, getBlockHeight
, getLatestBlock
, getTransaction
, getAddress
) where

import Control.Monad.Trans.Either
import Servant.API
import Servant.Client
import Servant.ChainFlyer
import Servant.ChainFlyer.Types.Block
import Servant.ChainFlyer.Types.Transaction
import Servant.ChainFlyer.Types.Address

-- | Servant client of `BlockAPI`
getBlock :: String -> EitherT ServantError IO Block

-- | Servant client of `BlockHeightAPI`
getBlockHeight :: Int -> EitherT ServantError IO Block

-- | Servant client of `LatestBlockAPI`
getLatestBlock :: EitherT ServantError IO Block

-- | Servant client of `TransactionAPI`
getTransaction :: String -> EitherT ServantError IO Transaction

-- | Servant client of `AddressAPI`
getAddress :: String -> EitherT ServantError IO Address

(getBlock :<|> getBlockHeight :<|> getLatestBlock :<|> getTransaction :<|> getAddress) =
  client chainFlyerAPI $ BaseUrl Https "chainflyer.bitflyer.jp" 443
