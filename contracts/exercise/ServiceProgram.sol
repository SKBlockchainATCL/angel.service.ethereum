pragma solidity >=0.5.0 <0.7.0;

contract ServiceProgram{
    
    
    struct Period {
        bytes32 from;
        bytes32 to;
    }
    
    struct Program {
        bytes32 title;
        Period p;
        
    }

    Program[] programs;
    
    
    
    //Proram getProgram(byte32 name) public;
    
    



}