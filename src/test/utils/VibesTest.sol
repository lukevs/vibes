// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "ds-test/test.sol";

import "../../Vibes.sol";
import "./Hevm.sol";

contract User {
    Vibes internal vibes;

    constructor(address _vibes) {
        vibes = Vibes(_vibes);
    }

    function mint(address to, uint256 amount) external {
        vibes.mint(to, amount);
    }

    function burn(address account, uint256 amount) external {
        vibes.burn(account, amount);
    }
}

abstract contract VibesTest is DSTest {
    Hevm internal constant hevm = Hevm(HEVM_ADDRESS);

    // contracts
    Vibes internal vibes;

    // users
    User internal alice;
    User internal bob;

    function setUp() public virtual {
        vibes = new Vibes();
        alice = new User(address(vibes));
        bob = new User(address(vibes));
        vibes.transferOwnership(address(alice));
    }
}
