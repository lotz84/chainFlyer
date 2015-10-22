chainFlyer
==========

Bindings to [chainFlyer's API](https://chainflyer.bitflyer.jp/API/docs).

```haskell
main = do
    block <- getLatestBlock
    tx    <- getTransaction $ head $ blockTxHashes block
    addr  <- getAddress $ txoAddress $ head $ txOutputs tx
    putStrLn $ "The rest balance of the address is "
        ++ show (unconfirmedBalance addr + confirmedBalance addr)
        ++ " satoshi."
```

If you want to use this library with stack, add to `stack.yaml` this repo location as below.

```yaml
packages:
- location:
    git: git@github.com:lotz84/chainFlyer.git
    commit: 70a3121363887fa576a4219c50506f6637b43178
```
