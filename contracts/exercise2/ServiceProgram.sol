pragma solidity >=0.5.0 <0.7.0;

import "./ServiceProgramState.sol";
import "./ServiceProgramImpl.sol";

contract ServiceProgram is ServiceProgramState{
    
    ServiceProgramInterface impl;
    
    constructor(bytes32 title, bytes8 from, bytes8 to) public{
        impl = new ServiceProgramImpl();
        
        address(impl).delegatecall(abi.encodeWithSelector(impl.init.selector, title, from, to));
    }
    
    function changeImpl(address addr) public{
        impl = ServiceProgramImpl(addr);
    }
    
    
    
    
}