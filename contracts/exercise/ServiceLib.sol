pragma solidity >=0.5.0 <0.7.0;

library ServiceLib{
    
    enum ProgramStates{
        Open, Started, Finished, Reviewed
    }
    
    struct Program{
        bytes32 title;
        address coordi;
        bytes8 from;  // yyyyMMdd, GMT0
        bytes8 to;    // yyyyMMdd, GMT0
        bytes8 deadline; // deadline for application, yyyyMMdd, GMT0
    }
    
    // * -----> Applied
    //              +-----> Canceled
    //              +-----> Rejected
    //              +-----> Accepted
    //                           +-----> Finished -----> Reviewed (Evaluated)
    enum ProgramEntryStates{
        Applied, Canceled, Accepted, Rejected, Finished, Reviwed
    }
    
    struct ProgramEntry{
        address doer;
        ProgramEntryStates state;
        bytes8 appliedAt;    // yyyyMMdd, GMT0
        bytes8 canceledAt;   // yyyyMMdd, GMT0
        bytes8 decidedAt;    // yyyyMMdd, GMT0

    }
}