pragma solidity >=0.5.0 <0.7.0;
pragma experimental ABIEncoderV2;

import "./ServiceLib.sol";
import "./ServiceProgram.sol";

contract ServiceProgramFactory{

    mapping(address => ServiceProgram) programs;
    address[] programAddresses;
    
    event ServiceProgramCreated(bytes32 title, bytes8 from, bytes8 to);
    
    event ServiceProgramCounted(uint cnt);
    
    
    
    struct ServiceProgramValue{
        address addr;
        bytes32 title;
        bytes8 from;  // yyyyMMdd, GMT0
        bytes8 to;    // yyyyMMdd, GMT0
        ServiceProgramState.Status status;
    }

    function addServiceProgram(bytes32 _title, bytes8 _from, bytes8 _to) public returns (address _addr){

        ServiceProgram program = new ServiceProgram(_title, _from, _to);
        
        _addr = address(program);
        programs[_addr] = program;
        programAddresses.push(_addr);
        
        emit ServiceProgramCreated(_title, _from, _to);
        
    }

    function countServicePrograms() public returns (uint){
        emit ServiceProgramCounted(programAddresses.length);
        
        return programAddresses.length;
        
        
    }

    function updateServiceProgramStatus(address addr, ServiceProgramState.Status status) public{
        
    }
    
    
    function findServiceProgramsByOrder(uint _from, uint _to) public returns (ServiceProgramValue[]  memory _programs){
        assert(_from > 0);
        assert(_to > _from);
        
        uint len = programAddresses.length;
        assert(_from <= len);
        
        uint n = len > _to ? ( _to - _from + 1) : (len - _from + 1);
        _programs = new ServiceProgramValue[](n);
        
        address addr;
        ServiceProgram program;
        ServiceProgramValue memory value;
        bytes8 from;
        bytes8 to;
        for(uint i = 0; i < n; i++ ){
            addr = programAddresses[_from - 1 + i];
            program = ServiceProgram(addr);
            (from, to) = program.getInterval();
            value = ServiceProgramValue(addr, program.getTitle(), from, to, program.getStatus());
            
            _programs[i] = value;
        }

    }
    

}