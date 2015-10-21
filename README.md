chainFlyer
==========

Bindings to [chainFlyer's API](https://chainflyer.bitflyer.jp/API/docs).

[Document](http://lotz84.github.io/chainFlyer/)


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

If you want to use this library with stack, [this document](https://github.com/commercialhaskell/stack/blob/master/doc/faq.md#i-need-to-use-a-package-or-version-of-a-package-that-is-not-available-on-hackage-what-should-i-do) is very helpful.
