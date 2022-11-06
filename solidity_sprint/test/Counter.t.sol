// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../lib/forge-std/src/Test.sol";
import "../src/Counter.sol";
import "../lib/forge-std/src/console2.sol";

/*
forge test -vvvvv
You can run forge test in various verbose levels. Increase the amount of v's up to 5:

2: Print logs for all tests
3: Print execution traces for failing tests
4: Print execution traces for all tests, and setup traces for failing tests
5: Print execution and setup traces for all tests
*/

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    // function testIncrement() public {
    //     counter.increment();
    //     assertEq(counter.number(), 1);
    // }

    // function testSetNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }
}
