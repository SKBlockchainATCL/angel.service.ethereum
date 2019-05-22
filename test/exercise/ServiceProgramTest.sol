pragma solidity >=0.4.22 <0.7.0;
pragma experimental ABIEncoderV2;

import "truffle/Assert.sol";
import "../../contracts/exercise/ServiceProgram.sol";
import "../../contracts/exercise/ServiceLib.sol";

// https://github.com/trufflesuite/truffle/blob/develop/packages/truffle-core/lib/testing/Assert.sol
contract ServiceProgramTest{
    using ServiceLib for ServiceLib.Program;
    
    ServiceProgram testee;
    bytes32 constant title = "The January Program";
    bytes8 constant from = "20190125";
    bytes8 constant to = "20190129";
    
    function beforeEach() public {
        // Creating Contracts via new - https://solidity.readthedocs.io/en/v0.5.8/control-structures.html#creating-contracts-via-new
        testee = new ServiceProgram(title, address(this), from, to); 
    } 

    function testGetValue() public {
        ServiceLib.Program memory p1 = testee.getValue();
        
        Assert.equal(p1.title, title, "Title is not assigned as expected.");
        Assert.equal(p1.coordi, address(this), "Assigning coordinator has failed");
        Assert.equal(p1.from, from, "Starting date is not assigned as expected.");
        Assert.equal(p1.to, to, "Ending date is not assigned as expected.");

        p1.title = "The Feb Program";
        
        ServiceLib.Program memory p2 = testee.getValue();
        
        Assert.equal(p1.title, "The Feb Program", "Assigning struct member has failed.");
        Assert.notEqual(p1.title, p2.title, "Copied return value is refrencing the contract which is never expected.");

    }
    
    function testSetInterval() public {
        bytes8 from2 = "20190127";
        bytes8 to2 = "20190131";
        
        testee.setInterval(from2, to2);
        
        ServiceLib.Program memory p = testee.getValue();
        
        Assert.equal(p.from, from2, "Function setValue has failed to update starting date.");
        Assert.equal(p.to, to2, "Function setValue has failed to update ending date.");
    }
    
    
    function testChangeCoordiByOwner() public {
        address addr = 0xC5776C5d4ba76dD38424A160927c6B7054b55edD;
        
        testee.changeCoordi(addr);
        
        ServiceLib.Program memory p = testee.getValue();
        
        Assert.equal(p.coordi, addr, "Function changeCoordi has failed to change coordinator.");
    }
    
    function testChangeCoordiByNonOwner() public{
        address addr1 = 0xC5776C5d4ba76dD38424A160927c6B7054b55edD;
        address addr2 = 0x99322780C19B664e9902Ff1031549da575De8F3B;
        
        bool r1; 
        bool r2;
        
        // 1st, change coordinator from the owner
        (r1, ) = address(this).delegatecall(abi.encodePacked(testee.changeCoordi.selector, addr1));
        Assert.isTrue(r1, "Function changeCoordi has failed to change coordinator, although called by onwer.");
        
        // 2nd, try to change coordinator from a non-owner - Exception expected
        (r2, ) = address(this).delegatecall(abi.encodePacked(testee.changeCoordi.selector, addr2));
        Assert.isFalse(r2, "Function changeCoordi dosen't raise exception, although called by non-owner.");
    }
    
    
}