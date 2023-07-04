// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity =0.7.6;

import '@bonsaiswap/v3-core/contracts/interfaces/IBonsaiswapV3Factory.sol';
import '@bonsaiswap/v3-core/contracts/interfaces/IBonsaiswapV3Pool.sol';

import './PeripheryImmutableState.sol';
import '../interfaces/IPoolInitializer.sol';

/// @title Creates and initializes V3 Pools
abstract contract PoolInitializer is IPoolInitializer, PeripheryImmutableState {
    /// @inheritdoc IPoolInitializer
    function createAndInitializePoolIfNecessary(
        address token0,
        address token1,
        uint24 fee,
        uint160 sqrtPriceX96
    ) external payable override returns (address pool) {
        require(token0 < token1);
        pool = IBonsaiswapV3Factory(factory).getPool(token0, token1, fee);

        if (pool == address(0)) {
            pool = IBonsaiswapV3Factory(factory).createPool(token0, token1, fee);
            IBonsaiswapV3Pool(pool).initialize(sqrtPriceX96);
        } else {
            (uint160 sqrtPriceX96Existing, , , , , , ) = IBonsaiswapV3Pool(pool).slot0();
            if (sqrtPriceX96Existing == 0) {
                IBonsaiswapV3Pool(pool).initialize(sqrtPriceX96);
            }
        }
    }
}
