pragma solidity >=0.5.0 <0.7.0;

import "./ServiceProgramState2.sol";
import "./ServiceProgramInterface2.sol";

contract ServiceProgramImpl2 is ServiceProgramState2, ServiceProgramInterface2{
    
    event Created(bytes32 name, bytes32 title, bytes8 from, bytes8 to);
    
    constructor() public{
        
        emit Created('ServiceProgramImpl2', title, from, to);
        
    }
    
    function init() public{
        //@TODO Check if the starting and ending dates are proper.
    }
    
    function getTitle() public returns (bytes32){
        return title;
    }
    
    function getInterval() public returns (bytes8, bytes8){
        return (from, to);
    }
    
    function setInterval(bytes8 _from, bytes8 _to) public{
        from = _from;
        to = _to;
    }
    

    
}