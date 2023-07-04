// SPDX-License-Identifier: GPL-2.0-or-later
import '@bonsaiswap/v3-core/contracts/interfaces/IBonsaiswapV3Pool.sol';

pragma solidity >=0.6.0;

import '../libraries/PoolTicksCounter.sol';

contract PoolTicksCounterTest {
    using PoolTicksCounter for IBonsaiswapV3Pool;

    function countInitializedTicksCrossed(
        IBonsaiswapV3Pool pool,
        int24 tickBefore,
        int24 tickAfter
    ) external view returns (uint32 initializedTicksCrossed) {
        return pool.countInitializedTicksCrossed(tickBefore, tickAfter);
    }
}
