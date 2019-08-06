pragma solidity >=0.5.0 <0.7.0;


import "truffle/Assert.sol";

contract ArrayTest{

  function testBytes1() public{
    uint a = 0x1573593ab3;
    
    bytes32 b = bytes32(a);
    
    Assert.equal(uint(b.length), uint(32), "The length of 'bytes32' type variable should always be 32");
  }
  
  // Causes compile-time error
  function testDynamicArray1() public{
    uint[] memory v;
    
    //v.length = 1;
    //v.push(1);
    
    Assert.equal(uint(v.length), uint(1), "The length of dynamic array should be increased as pushed member.");  
  }

}