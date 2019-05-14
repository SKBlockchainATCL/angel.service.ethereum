pragma solidity >=0.4.22 <0.7.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/samples/Ballot.sol";

// References
//   - https://truffleframework.com/docs/truffle/testing/writing-tests-in-solidity
contract BallotTest{

    function testConstructor() public{
        Ballot ba = Ballot(DeployedAddresses.Ballot());
        
        
    }



}