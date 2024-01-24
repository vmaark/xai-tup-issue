// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";
import {TransparentUpgradeableProxy} from
    "../lib/openzeppelin-contracts/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

contract CounterScript is Script {
    function setUp() public {
        Counter counterImpl = new Counter();
        console2.log("resource length");

        console2.log(address(counterImpl).code.length);
        TransparentUpgradeableProxy proxy = new TransparentUpgradeableProxy(
            address(counterImpl),
            address(proxyAdmin),
            abi.encodePacked(
                GoblinTownResources.initialize.selector,
                abi.encode(config) // init parameters
            )
        );
    }

    function run() public {
        vm.startBroadcast();

        setUp();

        vm.stopBroadcast();
    }
}
