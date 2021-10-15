// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./utils/VibesTest.sol";

contract Mint is VibesTest {
    function testMint() public {
        alice.mint(address(bob), 10);
        assertEq(vibes.balanceOf(address(bob)), 10);
    }

    function testCannotMint() public {
        try bob.mint(address(alice), 10) {
            fail();
        } catch Error(string memory error) {
            assertEq(error, "Ownable: caller is not the owner");
        }
    }
}
