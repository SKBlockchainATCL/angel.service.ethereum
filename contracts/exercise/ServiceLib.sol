pragma solidity >=0.5.0 <0.7.0;

library ServiceLib{
    
    struct Program{
        bytes32 title;
        address coordi;
        bytes8 from;  // yyyyMMdd, GMT0
        bytes8 to;    // yyyyMMdd, GMT0
    }
    
}