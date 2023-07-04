import { abi as POOL_ABI } from '@bonsaiswap/v3-core/artifacts/contracts/BonsaiswapV3Pool.sol/BonsaiswapV3Pool.json'
import { Contract, Wallet } from 'ethers'
import { IBonsaiswapV3Pool } from '../../typechain'

export default function poolAtAddress(address: string, wallet: Wallet): IBonsaiswapV3Pool {
  return new Contract(address, POOL_ABI, wallet) as IBonsaiswapV3Pool
}
