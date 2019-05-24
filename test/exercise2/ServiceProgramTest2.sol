pragma solidity >=0.5.0 <0.7.0;

import "truffle/Assert.sol";
import "../../contracts/exercise2/ServiceProgram2.sol";

contract ServiceProgramTest2{

    ServiceProgram2 testee;
    bytes32 constant title = "The January Program";
    bytes8 constant from = "20190125";
    bytes8 constant to = "20190129";
    
    function beforeEach() public {
        // Creating Contracts via new - https://solidity.readthedocs.io/en/v0.5.8/control-structures.html#creating-contracts-via-new
        testee = new ServiceProgram2(title, from, to); 
    } 
    

    function testGetTitleGetInterval() public{
        
        bytes32 _title = testee.getTitle();
        (bytes32 _from, bytes32 _to) = testee.getInterval();
        
        Assert.equal(_title, title, "The 'getTitle' doesn't say the title specified when constructing.");
        Assert.equal(_from, from, "The 'getInterval' doesn't say the starting date specified when constructing.");
        Assert.equal(_to, to, "The 'getInterval' doesn't say the starting date specified when constructing.");

    }

    
    
    
}    
    