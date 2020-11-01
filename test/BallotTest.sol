pragma solidity >=0.4.22 <0.7.0;

import "truffle/Assert.sol";
// import "truffle/build/DeployedAddresses.sol"; // Dynamically generated source, Never supported by Remix
import "../contracts/samples/Ballot.sol";

// References
//   - https://truffleframework.com/docs/truffle/testing/writing-tests-in-solidity
contract BallotTest{

    function testConstructor() public{
        Ballot ba = Ballot(0xCbc2a3cECeE9Fdf0A843d996E08EDF1892D68b14);
        
        address cm = ba.chairpersion();
        
        Assert.equal(cm, 0xC5776C5d4ba76dD38424A160927c6B7054b55edD, "???");
        
    }



}