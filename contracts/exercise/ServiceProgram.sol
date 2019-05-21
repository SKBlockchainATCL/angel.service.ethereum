pragma solidity >=0.5.0 <0.7.0;

import "./ServiceLib.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract ServiceProgram is Ownable{
    using ServiceLib for ServiceLib.Program;
    
    ServiceLib.Program program;

    event CoordiChanged(address indexed prevCoordi, address indexed currentCoordi);
    
    event IntervalChanged(bytes8 from1, bytes8 to1, bytes8 from2, bytes8 to2);

    
    constructor(bytes32 title, bytes8 from, bytes8 to) public {
        program.title = title;
        program.coordi = msg.sender;
        program.from = from;
        program.to = to;
    }
    
    
    function changeCoordi(address addr) public onlyOwner{
        transferOwnership(addr);
        emit CoordiChanged(program.coordi, addr);
        program.coordi = addr;
    }
    
    function setInterval(bytes8 from, bytes8 to) public{
        //@TODO Need validation
        
        emit IntervalChanged(program.from, program.to, from, to);
        program.from = from;
        program.to = to;
        
    }
    
    
    



}