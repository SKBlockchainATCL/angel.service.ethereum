pragma solidity >=0.5.0 <0.7.0;

contract Initializable{
    
    bool internal initialized = false;

    modifier initAware(){
        require(!initialized, "Already initialized and duplicate initialization is disallowed.");
        _;
    }
    
    
    function init() external;
    
    
}