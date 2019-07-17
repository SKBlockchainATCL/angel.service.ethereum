pragma solidity >=0.5.0 <0.7.0;

import "./ServiceProgramState.sol";
import "./ServiceProgramImpl.sol";
import "./ServiceProgramInterface.sol";


contract ServiceProgram is ServiceProgramState, ServiceProgramInterface{
    
    ServiceProgramInterface impl;
    
    bool initialized = false;
    
    event Created(bytes32 name, bytes32 title, bytes8 from, bytes8 to);
    
    event ImplReplaced(address addr, bytes32 title, bytes8 from, bytes8 to);

    constructor(bytes32 _title, bytes8 _from, bytes8 _to) public{
        impl = new ServiceProgramImpl();
        
        title = _title;
        from = _from;
        to = _to;

        bool r;
        (r, ) = address(impl).delegatecall(abi.encodeWithSelector(impl.init.selector));
        require(r);
        initialized = true;
        
        emit Created('ServiceProgram', title, from, to);

    }
    
    function replaceImpl(address addr) public onlyOwner{
        impl = ServiceProgramImpl(addr);

        emit ImplReplaced(addr, title, from, to);
    }
    
    function getTitle() public returns (bytes32){
        bool r; bytes memory d;
        (r, d) = address(impl).delegatecall(abi.encodeWithSelector(impl.getTitle.selector));
        require(r);
        return abi.decode(d, (bytes32)); 
    }
    
    function init() public initAware{
        
    }
    
    function getInterval() public returns (bytes8, bytes8){
        bool r; bytes memory d;
        (r, d) = address(impl).delegatecall(abi.encodeWithSelector(impl.getInterval.selector));
        require(r);
        return abi.decode(d, (bytes8, bytes8));
        
    }

    function setInterval(bytes8 from, bytes8 to) public onlyOwner{
        bool r; bytes memory d;
        (r, d) = address(impl).delegatecall(abi.encodeWithSelector(impl.setInterval.selector, from, to));
        require(r);
    }
}