pragma solidity >=0.4.22 <0.7.0;

import "truffle/Assert.sol";
import "../../contracts/exercise/ServiceProgram.sol";

contract ServiceProgramTest{
    
    
    
    function testConstructor() public {
        bytes32 title = "The Jan Program";
        bytes8 from = "20190125";
        bytes8 to = "20190125"; 
        
        // Creating Contracts via new - https://solidity.readthedocs.io/en/v0.5.8/control-structures.html#creating-contracts-via-new
        ServiceProgram testee = new ServiceProgram(title, from, to); 
        
        
    }
    
    
}