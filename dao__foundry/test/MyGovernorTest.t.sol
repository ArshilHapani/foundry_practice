// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Test, console} from "forge-std/Test.sol";

import {MyGovernor} from "src/MyGovernor.sol";
import {GovernanceToken} from "src/GovernanceToken.sol";
import {TimeLock} from "src/TimeLock.sol";
import {Box} from "src/Box.sol";

contract MyGovernorTest is Test {
    MyGovernor governor;
    GovernanceToken token;
    TimeLock timeLock;
    Box box;

    uint256 constant INITIAL_SUPPLY = 100 ether;
    uint256 constant MIN_DELAY = 1 hours;
    uint256 constant VOTING_DELAY = 1; // 1 block
    uint256 constant VOTING_PERIOD = 50400; // 1 week

    address USER = makeAddr("user");
    address[] proposers;
    address[] executors;
    uint256[] values;
    bytes[] callDatas;
    address[] targets;

    function setUp() external {
        token = new GovernanceToken();
        token.mint(USER, INITIAL_SUPPLY);

        vm.startPrank(USER);

        token.delegate(USER); // delegate voting power to USER
        timeLock = new TimeLock(MIN_DELAY, proposers, executors, USER);
        governor = new MyGovernor(token, timeLock);
        bytes32 proposerRole = timeLock.PROPOSER_ROLE();
        bytes32 executorRole = timeLock.EXECUTOR_ROLE();
        bytes32 adminRole = timeLock.DEFAULT_ADMIN_ROLE();

        timeLock.grantRole(proposerRole, address(governor));
        timeLock.grantRole(executorRole, address(0));
        timeLock.revokeRole(adminRole, USER);

        vm.stopPrank();

        box = new Box();
        box.transferOwnership(address(timeLock));
    }

    function testCantUpdateBoxWithoutGovernance() external {
        vm.expectRevert();
        box.setNumber(10);
    }

    function testGovernanceUpdateBox() external {
        uint256 valueToSet = 10;
        string memory desc = "Set number to 10";
        bytes memory encodedFunctionCall = abi.encodeWithSignature("setNumber(uint256)", valueToSet);
        values.push(0);
        callDatas.push(encodedFunctionCall);
        targets.push(address(box));

        // propose to the dao
        uint256 proposalId = governor.propose(targets, values, callDatas, desc);
        console.log("Proposal State: ", uint256(governor.state(proposalId)));

        vm.warp(block.timestamp + VOTING_DELAY + 1);
        vm.roll(block.number + VOTING_DELAY + 1);

        console.log("Proposal State: ", uint256(governor.state(proposalId)));

        // vote on the proposal
        string memory reason = "I want to set the number to 10 because nami is awesome";

        uint8 voteWay = 1; // yes

        vm.prank(USER);
        governor.castVoteWithReason(proposalId, voteWay, reason);

        vm.warp(block.timestamp + VOTING_PERIOD + 1);
        vm.roll(block.number + VOTING_PERIOD + 1);

        // 3. Queue the tx
        bytes32 descriptionHash = keccak256(abi.encodePacked(desc));
        governor.queue(targets, values, callDatas, descriptionHash);

        vm.warp(block.timestamp + MIN_DELAY + 1);
        vm.roll(block.number + MIN_DELAY + 1);

        // 4. Execute the tx
        governor.execute(targets, values, callDatas, descriptionHash);

        assertEq(box.getNumber(), valueToSet);
    }
}
