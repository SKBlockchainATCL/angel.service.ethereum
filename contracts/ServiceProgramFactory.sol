pragma solidity >=0.5.0 <0.7.0;

import "./ServiceLib.sol";
import "./ServiceProgram.sol";

contract ServiceProgramFactory{


    mapping(uint => address[]) programMapByState;
    mapping(address => ServiceProgram) programs;
    address[] programAddresses;



    function addServiceProgram(bytes32 _title, bytes8 _from, bytes8 _to) public{

        ServiceProgram program = new ServiceProgram(_title, _from, _to);
        
        address addr = address(program);
        programs[addr] = program;
        programAddresses.push(addr);
        programMapByState[uint(ServiceLib.ProgramStatus.Open)].push(addr);
        
    }

    function countServicePrograms() public returns (uint){
        return programAddresses.length;
    }
    
    
    function updateServiceStatus(address addr, ServiceProgramState.Status status) public{
        
    }
    
    

}