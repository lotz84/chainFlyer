chainFlyer
==========

Bindings to [chainFlyer's API](https://chainflyer.bitflyer.jp/API/docs).

```haskell
main = void . runEitherT $ do
  block <- getLatestBlock
  tx    <- getTransaction $ head $ Block.tx_hashes block
  addr  <- getAddress $ Tx.out_address $ head $ Tx.outputs tx
  liftIO . putStrLn $ "The rest balance of the address is "
                ++ show (Address.unconfirmed_balance addr + Address.confirmed_balance addr)
                ++ " satoshi."
```

If you want to use this library with stack, add to `stack.yaml` this repo location as below.

```yaml
packages:
- location:
    git: git@github.com:lotz84/chainFlyer.git
    commit: 70a3121363887fa576a4219c50506f6637b43178
```
