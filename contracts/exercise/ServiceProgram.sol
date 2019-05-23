pragma solidity >=0.5.0 <0.7.0;
pragma experimental ABIEncoderV2;

import "./ServiceLib.sol";
import "./ServiceProgramImpl.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract ServiceProgram is Ownable{
    using ServiceLib for ServiceLib.Program;
    using ServiceLib for ServiceLib.ProgramEntry;
    
    ServiceLib.Program program;
    
    mapping(address => ServiceLib.ProgramEntry) entries;
    
    event CoordiChanged(address indexed prevCoordi, address indexed currentCoordi);
    
    event IntervalChanged(bytes8 from1, bytes8 to1, bytes8 from2, bytes8 to2);

    constructor(bytes32 title, address coordi, bytes8 from, bytes8 to) public {
        program.title = title;
        program.coordi = coordi;
        program.from = from;
        program.to = to;
    }
    
    function getValue() public view returns (ServiceLib.Program memory){
        return program;
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
    
    function addApplication() public{
        ServiceLib.ProgramEntry memory entry;
        
        //@TODO Need validation for applicant
        
        //@TODO Check if the applicant already have entry
        
        entry.doer = msg.sender;
        entry.state = ServiceLib.ProgramEntryStates.Applied;
        
        //@TODO How to determine applied date... 

        entries[msg.sender] = entry;
    }
    
    function cancelApplication() public{
        
        
    }
    
    function decideApplication() public onlyOwner{
        
        
    }
    
    function findEntry() public{
        
    }
    
    function finishEntry() public onlyOwner{
        
        
    }
    
    function reviewEntry() public onlyOwner{
        
    }

}