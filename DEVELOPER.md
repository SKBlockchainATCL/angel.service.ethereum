### Core Concepts

#### `Program`

  | Property | Type | ConstraintFormat | Solidity Type | Is Mandatory | Is Mutable | Remarks |
  | -------  | ---- | ----------------- | ------------- | ------------ | ---------- | ------- |
  | `title`  | String |                 | bytes32       | Y | X |         |
  | `coordinator` | Address |            | Address      | Y | Y |         |
  | `from` | Date | yyyy-MM-dd          |               | Y | Y | TimeZone ?        |
  | `to`   | Date | yyyy-MM-dd          |               | Y | Y | TimeZone ?        |
  | `duration` | int |                  |               | N | Y | Unit ?            |
  
    