pragma solidity >=0.5.0 <0.7.0;

import "./ServiceProgramState.sol";
import "./ServiceProgramInterface.sol";

contract ServiceProgramImpl is ServiceProgramState, ServiceProgramInterface{
    
    
    constructor() public{
        
        
    }
    
    function init(bytes32 _title, bytes8 _from, bytes8 _to) public{
        title = _title;
        from = _from;
        to = _to;
    }
    
    function getTitle() public returns (bytes32){
        return title;
    }
    
    function getInterval() public returns (bytes8, bytes8){
        return (from, to);
    }
    
    function setInterval(bytes8 from, bytes8 to) public{
        from = from;
        to = to;
    }

    
}