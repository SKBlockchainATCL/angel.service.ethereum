pragma solidity >=0.5.0 <0.7.0;

import "./ServiceLib.sol";

contract ServiceProgramState{
    
    enum Status{
        Open, Closed, Started, Ended, Reviewed, Canceled
    }    
    
    bytes32 internal title;
    bytes8 internal from;
    bytes8 internal to;
    
    Status status;

}