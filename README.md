chainFlyer
==========

Bindings to chainFlyer's API.

```haskell
main :: IO ()
main = do
    block <- getLatestBlock
    tx    <- getTransaction $ head $ blockTxHashes block
    addr  <- getAddress $ txoAddress $ head $ txOutputs tx
    putStrLn $ "The rest balance of the address is "
        ++ show (unconfirmedBalance addr + confirmedBalance addr)
        ++ " satoshi."
```
