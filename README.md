# Bonsaiswap V3 Periphery

This repository contains the periphery smart contracts for the Bonsaiswap V3 Protocol.

## Bug bounty

This repository is subject to the Bonsaiswap V3 bug bounty program,
per the terms defined [here](./bug-bounty.md).

## Local deployment

In order to deploy this code to a local testnet, you should install the npm package
`@bonsaiswapv3/periphery`
and import bytecode imported from artifacts located at
`@bonsaiswapv3/periphery/artifacts/contracts/*/*.json`.
For example:

```typescript
import {
  abi as SWAP_ROUTER_ABI,
  bytecode as SWAP_ROUTER_BYTECODE,
} from '@bonsaiswapv3/periphery/artifacts/contracts/SwapRouter.sol/SwapRouter.json'

// deploy the bytecode
```

This will ensure that you are testing against the same bytecode that is deployed to
mainnet and public testnets, and all Bonsaiswap code will correctly interoperate with
your local deployment.

## Using solidity interfaces

The Bonsaiswap v3 periphery interfaces are available for import into solidity smart contracts
via the npm artifact `@bonsaiswapv3/periphery`, e.g.:

```solidity
import '@bonsaiswapv3/periphery/contracts/interfaces/ISwapRouter.sol';

contract MyContract {
  ISwapRouter router;

  function doSomethingWithSwapRouter() {
    // router.exactInput(...);
  }
}

```
