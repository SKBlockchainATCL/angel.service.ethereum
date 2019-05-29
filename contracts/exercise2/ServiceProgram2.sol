pragma solidity >=0.5.0 <0.7.0;

import "./ServiceProgramState2.sol";
import "./ServiceProgramImpl2.sol";
import "./ServiceProgramInterface2.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract ServiceProgram2 is ServiceProgramState2, ServiceProgramInterface2, Ownable{
    
    ServiceProgramInterface2 impl;
    
    bool initialized = false;
    
    event Created(bytes32 name, bytes32 title, bytes8 from, bytes8 to);
    
    event ImplReplaced(address addr, bytes32 title, bytes8 from, bytes8 to);

    constructor(bytes32 _title, bytes8 _from, bytes8 _to) public{
        impl = new ServiceProgramImpl2();
        
        title = _title;
        from = _from;
        to = _to;

        bool r;
        (r, ) = address(impl).delegatecall(abi.encodeWithSelector(impl.init.selector));
        require(r);
        initialized = true;
        
        emit Created('ServiceProgram2', title, from, to);

    }
    
    function replaceImpl(address addr) public onlyOwner{
        impl = ServiceProgramImpl2(addr);
        
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

    function setInterval(bytes8 from, bytes8 to) public{
        bool r; bytes memory d;
        (r, d) = address(impl).delegatecall(abi.encodeWithSelector(impl.setInterval.selector, from, to));
        require(r);
    }
}