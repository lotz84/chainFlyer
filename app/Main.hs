module Main where

import Control.Monad (void)
import Control.Monad.Trans.Either (runEitherT)
import Control.Monad.IO.Class (liftIO)
import Servant.ChainFlyer.Client
import qualified Servant.ChainFlyer.Types.Block as Block
import qualified Servant.ChainFlyer.Types.Transaction as Tx
import qualified Servant.ChainFlyer.Types.Address as Address

main :: IO ()
main = void . runEitherT $ do
  block <- getLatestBlock
  tx    <- getTransaction $ head $ Block.tx_hashes block
  addr  <- getAddress $ Tx.out_address $ head $ Tx.outputs tx
  liftIO . putStrLn $ "The rest balance of the address is "
                ++ show (Address.unconfirmed_balance addr + Address.confirmed_balance addr)
                ++ " satoshi."
