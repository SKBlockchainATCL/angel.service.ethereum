pragma solidity >=0.5.0 <0.7.0;

import "truffle/Assert.sol";
import "../../contracts/exercise/ServiceProgramTitle.sol";

// https://github.com/trufflesuite/truffle/blob/develop/packages/truffle-core/lib/testing/Assert.sol
contract ServiceProgramTitleTest{
    
    function testConstructor() public {
        ServiceProgramTitle testee = new ServiceProgramTitle("Happy New Year");
        Assert.equal(testee.title(), "Haapy New Year", "The title of contract should be the one specified at the constructor.");

    }
    
    
}