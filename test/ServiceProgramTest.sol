pragma solidity >=0.5.0 <0.7.0;

import "truffle/Assert.sol";
import "../contracts/ServiceProgram.sol";
import "../contracts/ServiceProgramImpl.sol";

contract ServiceProgramTest{

    ServiceProgram testee;
    bytes32 constant title = "The January Program";
    bytes8 constant from = "20190125";
    bytes8 constant to = "20190129";
    
    function beforeEach() public {
        // Creating Contracts via new - https://solidity.readthedocs.io/en/v0.5.8/control-structures.html#creating-contracts-via-new
        testee = new ServiceProgram(title, from, to); 
    } 
    

    function testGetTitleGetInterval() public{
        
        bytes32 _title = testee.getTitle();
        (bytes8 _from, bytes8 _to) = testee.getInterval();
        
        Assert.equal(_title, title, "The 'getTitle' doesn't say the title specified when constructing.");
        Assert.equal(_from, from, "The 'getInterval' doesn't say the starting date specified when constructing.");
        Assert.equal(_to, to, "The 'getInterval' doesn't say the starting date specified when constructing.");
    }
    
    function testReplaceImpl() public{
        
        bytes32 _title1 = testee.getTitle();
        (bytes8 _from1, bytes8 _to1) = testee.getInterval();
        
        ServiceProgramInterface impl = new ServiceProgramImpl();
        impl.transferOwnership(0x99322780C19B664e9902Ff1031549da575De8F3B); //2nd account from deterministic wallets
        
        testee.replaceImpl(address(impl));
        
        bytes32 _title2 = testee.getTitle();
        (bytes8 _from2, bytes8 _to2) = testee.getInterval();
        
        Assert.equal(_title2, _title1, "The 'title' state isn't preseved during before and after impl. replacement.");
        Assert.equal(_from2, _from1, "The 'from' state isn't preseved during before and after impl. replacement.");
        Assert.equal(_to2, _to1, "The 'to' doesn't isn't preseved during before and after impl. replacement.");
    }
    
    function testSetIntervalAndReplaceImpl() public{

        bytes8 _from = "20190325";
        bytes8 _to = "20190329";
        
        bytes32 _title1 = testee.getTitle();
        (bytes8 _from1, bytes8 _to1) = testee.getInterval();
        testee.setInterval(_from, _to);

        ServiceProgramInterface impl = new ServiceProgramImpl();
        impl.transferOwnership(0x99322780C19B664e9902Ff1031549da575De8F3B); //2nd account from deterministic wallets
        
        testee.replaceImpl(address(impl));
        
        bytes32 _title2 = testee.getTitle();
        (bytes8 _from2, bytes8 _to2) = testee.getInterval();

        Assert.equal(_from1, from, "...");
        Assert.equal(_to1, to, "...");

        Assert.equal(_title2, _title1, "The 'title' state isn't preseved during before and after impl. replacement.");
        Assert.equal(_from2, _from, "The 'from' state isn't preseved during before and after impl. replacement.");
        Assert.equal(_to2, _to, "The 'to' doesn't isn't preseved during before and after impl. replacement.");
                
    }
    
    function testGetTitleAndGetIntervalOnArchivedImpl() public{

        bytes8 _from = "20190325";
        bytes8 _to = "20190329";

        ServiceProgramInterface impl1 = new ServiceProgramImpl();
        impl1.transferOwnership(0x99322780C19B664e9902Ff1031549da575De8F3B); //2nd account from deterministic wallets
        testee.replaceImpl(address(impl1));
        testee.setInterval(_from, _to);
        
        ServiceProgramInterface impl2 = new ServiceProgramImpl();
        impl2.transferOwnership(0x99322780C19B664e9902Ff1031549da575De8F3B); //2nd account from deterministic wallets
        testee.replaceImpl(address(impl2));
        
        bytes32 _title1 = impl1.getTitle();
        (bytes8 _from1, bytes8 _to1) = impl1.getInterval();

        Assert.equal(_title1, hex"0000000000000000000000000000000000000000000000000000000000000000", "The 'title' state isn't preseved during before and after impl. replacement.");
        Assert.equal(_from1, hex"0000000000000000", "The state of implementation is expected not to be changed.");
        Assert.equal(_to1, hex"0000000000000000", "The state of implementation is expected not to be changed.");        
        
    }
    
    function testSetIntervalOnArchivedImplToFail() public{
        
        bytes8 _from = "20190325";
        bytes8 _to = "20190329";

        ServiceProgramInterface impl1 = new ServiceProgramImpl();
        impl1.transferOwnership(0x99322780C19B664e9902Ff1031549da575De8F3B); //2nd account from deterministic wallets
        testee.replaceImpl(address(impl1));
        testee.setInterval(_from, _to);
        
        ServiceProgramInterface impl2 = new ServiceProgramImpl();
        impl2.transferOwnership(0x99322780C19B664e9902Ff1031549da575De8F3B);
        testee.replaceImpl(address(impl2));

        bytes8 _from1 = "20190425";
        bytes8 _to1 = "20190429";
        
        bool r;
        (r, ) = address(impl1).call(abi.encodeWithSelector(impl1.setInterval.selector, _from1, _to1));
        Assert.isFalse(r, "Onwer functions of implementation is expected not to be called directly.");
        
    }

}