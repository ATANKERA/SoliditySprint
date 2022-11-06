// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../lib/forge-std/src/Test.sol";
import "../src/ExampleSoliditySprint2022.sol";
import "../lib/forge-std/src/console2.sol";

contract ExampleSoliditySprint2022Test is Test {
    ExampleSoliditySprint2022 public sprint;
    address constant ray_address = 0xcFe07ea6D74aa97a996277600f9A26F7e076Ffc6; 

    constructor() {
        sprint = new ExampleSoliditySprint2022("https://www.youtube.com/watch?v=dQw4w9WgXcQ?id=");
        sprint.start();
        // console2.log("Owner address:", sprint.owner());
    }

    modifier pointsIncreased(address addr) {
        uint prePoints = sprint.scores(addr);
        _;
        uint afterPoints = sprint.scores(addr);
        require(afterPoints > prePoints, "points didn't increase");
    }

    function setUp() public {
    }

    function test_solve_f0() public pointsIncreased(address(this)) {
        sprint.f0(false);
    }

    function test_solve_f1() public pointsIncreased(address(this)) {
        sprint.f1{value: 1}();
    }

    function test_solve_f2() public pointsIncreased(address(ray_address)) {
        vm.prank(ray_address);
        for(uint val = 0; val < type(uint).max; val++) {
            uint256 guess = uint256(keccak256(abi.encodePacked(val, ray_address)));
            if (guess % 5 == 0) {
                sprint.f2(val);
                console.log("f2 solution: ", val);
                break;
            }
        }
    }

    function test_solve_f3() public pointsIncreased(address(this)) {
        uint val = 0x123456789 ^ 0xdeadbeef;
        sprint.f3(val);
        console.log("f3 solution: ", val);
    }

    function test_solve_f4() public pointsIncreased(address(this)) {
        sprint.f4(address(sprint));
        console.log("f4 solution: ", address(sprint));
    }

    function test_solve_f5() public pointsIncreased(ray_address) {
        vm.prank(ray_address);
        sprint.f5(ray_address);
    }

    function test_solve_f6() public pointsIncreased(address(this)) {
        sprint.f6(sprint.owner());
    }

    function test_solve_f7() public pointsIncreased(address(this)) {
        sprint.f7{gas: 8_000_000}();
    }

    function test_solve_f8() public pointsIncreased(address(this)) {
        bytes memory data = "AAAAAAAAAAAAAAAA"; // 16 'A's
        sprint.f8(data);
    }

    function test_solve_f9() public pointsIncreased(address(this)) {
        // Since msg.sig is 4 bytes long
        bytes memory data = "AAAAAAAAAAAA"; // 12 'A's
        sprint.f9(data);
    }

    function test_solve_f10() public pointsIncreased(address(this)) {
        // https://ethereum.stackexchange.com/questions/107980/what-does-int-x-typeint-min-mean-in-solidity
        sprint.f10(type(int).min, 5);
    }

    function test_solve_f11() public pointsIncreased(address(this)) {
        // https://ethereum.stackexchange.com/questions/107980/what-does-int-x-typeint-min-mean-in-solidity
        sprint.f11(type(int).max, 5);
    }

    function test_solve_f12() public pointsIncreased(address(this)) {
        // https://ethereum.stackexchange.com/questions/96685/how-to-use-address-call-in-solidity
        bytes memory val = bytes(abi.encodeWithSignature("challengeHook()"));
        console2.logBytes(val);
        sprint.f12(val);
    }

    function test_solve_f13() public pointsIncreased(address(this)) {
        // Need to deploy a smart contract that has a fallback to call f13
        sprint.f13();
    }

    fallback() external {
        sprint.f13();
    }

    // function test_solve_f14() public pointsIncreased(address(this)) {
    //     console2.log(block.timestamp);
    // }

    function testf_solve_15() public pointsIncreased(address(this)) {
        // TODO: Learn how to get block.difficulty
        sprint.f15(0);
    }


    // function testf_solve_17() public pointsIncreased(address(this)) {
    //     // TODO: Learn how to get block.difficulty
    //     bytes memory signature = hex;
    //     sprint.f15(address(this), recover(keccak256("Have you ever heard the tragedy of Darth Plageus the wise?"), signature), signature);
    // }

    // function test_solve_f18() public pointsIncreased(address(this)) {
    //     sprint.f18(5, address(this), address(this));
    // }

    function test_solve_f19() public pointsIncreased(address(this)) {
        // Need to deploy a smart contract that implements the interface
        // sprint.f19(5, address(this), address(this));
    }


    function recover(bytes32 hash, bytes memory sig) internal pure returns (address) {
        bytes32 r;
        bytes32 s;
        uint8 v;

        //Check the signature length
        if (sig.length != 65) {
        return (address(0));
        }

        // Divide the signature in r, s and v variables
        assembly {
        r := mload(add(sig, 32))
        s := mload(add(sig, 64))
        v := byte(0, mload(add(sig, 96)))
        }

        // Version of signature should be 27 or 28, but 0 and 1 are also possible versions
        if (v < 27) {
        v += 27;
        }

        // If the version is correct return the signer address
        if (v != 27 && v != 28) {
            return (address(0));
        } else {
            return ecrecover(hash, v, r, s);
        }
    }


}

contract tempAttacker {

    address public immutable teamAddr;
    address public immutable currSprint;

    constructor(address _teamAddr, address _currSprint) {
        teamAddr = _teamAddr;
        currSprint = _currSprint;
        ExampleSoliditySprint2022(currSprint).f16(teamAddr);
    }

    fallback() external {
        ExampleSoliditySprint2022(currSprint).f16(teamAddr);
    }
}