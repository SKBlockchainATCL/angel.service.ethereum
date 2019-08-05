pragma solidity >=0.5.0 <0.7.0;

import "./ServiceProgramState.sol";
import "./ServiceProgramInterface.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract ServiceProgramImpl is ServiceProgramState, ServiceProgramInterface{
    
    event Created(bytes32 name, bytes32 title, bytes8 from, bytes8 to);
    
    constructor() public{
        
        emit Created('ServiceProgramImpl', title, from, to);
        
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
    
    function setInterval(bytes8 _from, bytes8 _to) public onlyOwner{
        from = _from;
        to = _to;
    }
    
    function getStatus() public returns (ServiceProgramState.Status status){
        return status;
    }
    
    function setStatus(ServiceProgramState.Status _status) public{
        status = _status;
    }

    
}