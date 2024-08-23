// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract HuffContractTest is Test {
    /// @dev Address of the SimpleStore contract.
    SimpleStore public simpleStore;

    /// @dev Address of the AddTwo contract.
    AddTwo public addTwo;

    /// @dev Setup the testing environment.
    function setUp() public {
        simpleStore = SimpleStore(HuffDeployer.deploy("SimpleStore"));
        addTwo = AddTwo(HuffDeployer.deploy("addTwo"));
    }

    /// @dev Ensure that you can set and get the value.
    function testSetAndGetValue() public {
        uint256 value = 500;
        simpleStore.setValue(value);
        console.log(value);
        console.log(simpleStore.getValue());
        assertEq(value, simpleStore.getValue());
    }

    /// @dev Ensure that you can add two numbers.
    function testAddTwo() public {
        uint256 num1 = 1500;
        uint256 num2 = 1500;
        uint256 res = addTwo.addTwo(num1, num2);
        console.log(num1, num2);
        assertEq(num1 + num2, res);
    }
}

interface SimpleStore {
    function setValue(uint256) external;

    function getValue() external returns (uint256);
}

interface AddTwo {
    function addTwo(uint256, uint256) external returns (uint256);
}
