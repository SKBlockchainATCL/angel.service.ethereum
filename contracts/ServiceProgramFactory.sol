pragma solidity >=0.5.0 <0.7.0;

import "./ServiceProgram.sol";

contract ServiceProgramFactory{


    mapping(address => ServiceProgram) programs;
    address[] programAddresses;



    function addServiceProgram(bytes32 _title, bytes8 _from, bytes8 _to) public{

        ServiceProgram program = new ServiceProgram(_title, _from, _to);

        programs[address(program)] = program;
        programAddresses.push(address(program));
    }

    function countServicePrograms() public returns (uint){
        return programAddresses.length;
    }

}