pragma solidity >=0.5.0 <0.7.0;

import "./Initializable.sol";

contract ServiceProgramInterface is Initializable{

    function getTitle() external returns (bytes32);
    
    function getInterval() external returns (bytes8, bytes8);
    
    function setInterval(bytes8 from, bytes8 to) external;
    
    
}