// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";
import {TransparentUpgradeableProxy} from
    "../lib/openzeppelin-contracts/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

contract CounterScript is Script {
    function setUp() public {
        Counter counterImpl = new Counter();
        console.log("resource length");

        console.log(address(counterImpl).code.length);
        TransparentUpgradeableProxy proxy = new TransparentUpgradeableProxy(
            address(counterImpl), msg.sender, abi.encodePacked(Counter.initialize.selector)
        );
    }

    function run() public {
        vm.startBroadcast();

        setUp();

        vm.stopBroadcast();
    }
}
