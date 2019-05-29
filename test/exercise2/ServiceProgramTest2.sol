pragma solidity >=0.5.0 <0.7.0;

import "truffle/Assert.sol";
import "../../contracts/exercise2/ServiceProgram2.sol";
import "../../contracts/exercise2/ServiceProgramImpl2.sol";

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
    
    function testReplaceImpl() public{
        
        bytes32 _title1 = testee.getTitle();
        (bytes32 _from1, bytes32 _to1) = testee.getInterval();
        
        ServiceProgramInterface2 impl = new ServiceProgramImpl2();
        
        testee.replaceImpl(address(impl));
        
        bytes32 _title2 = testee.getTitle();
        (bytes32 _from2, bytes32 _to2) = testee.getInterval();
        
        Assert.equal(_title2, _title1, "The 'title' state isn't preseved during before and after impl. replacement.");
        Assert.equal(_from2, _from1, "The 'from' state isn't preseved during before and after impl. replacement.");
        Assert.equal(_to2, _to1, "The 'to' doesn't isn't preseved during before and after impl. replacement.");
        
    }

    
    
    
}    
    