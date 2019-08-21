pragma solidity >=0.5.0 <0.7.0;
pragma experimental ABIEncoderV2;

import "truffle/Assert.sol";
import "../contracts/ServiceProgramFactory.sol";
import "../contracts/ServiceProgram.sol";
import "../contracts/ServiceProgramImpl.sol";

contract ServiceProgramFactoryTest{
  
  ServiceProgramFactory testee;
  
  
  function beforeEach() public {
      
    testee = new ServiceProgramFactory();
  }
  
  function testAddAndCountServiceProgram() public{
      
    bytes32 _title = "The January Program";
    bytes8 _from = "20190125";
    bytes8 _to = "20190129";
      
    address addr = testee.addServiceProgram(_title, _from, _to);

    uint cnt = testee.countServicePrograms();
    
    Assert.equal(cnt, 1, "...");
    
  }
  
  function testFindServiceProgramsByOrder() public{

    bytes32[4] memory titles = [bytes32("Progam 1"), bytes32("Program 2"), bytes32("Program 3"), bytes32("Program 4")];
    bytes8[4] memory froms = [bytes8("20190110"), bytes8("20190210"), bytes8("20190310"), bytes8("20190410")];
    bytes8[4] memory tos = [bytes8("20190120"), bytes8("20190220"), bytes8("20190320"), bytes8("20190420")];
    
    // addresses for created ServiceProgram contract intances by 'ServiceProgramFactory.addServiceProgram()'
    address[] memory addrs = new address[](4);
    
    address addr;
    for(uint i = 0; i < titles.length; i++){
        addr = testee.addServiceProgram(titles[i], froms[i], tos[i]);
        addrs[i] = addr;
    }
    
    uint cnt = testee.countServicePrograms();
    Assert.equal(uint(cnt), uint(titles.length), "Count unmatched");
    
    
    ServiceProgramFactory.ServiceProgramValue[] memory programs;
    programs = testee.findServiceProgramsByOrder(1, 3);
    
    for(uint i = 0; i < programs.length; i++){
      Assert.equal(programs[i].addr, addrs[i], "Address unmatched"); 
        
    }
  }
  
  
}
