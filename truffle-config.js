const mnemonic = "";
const HDWalletProvider = require("truffle-hdwallet-provider");

// Read properties for local standalone network from
// 'src/main/resources/application-default.properties' file.
//const fs = require('fs');
//const props = fs.readFileSync(
//    'src/main/resources/application-default.properties').toString();
//const netVersion = props.match(/ethereum\.netVersion=.*/g)[0].substring(20);
//const host = props.match(/ethereum\.host=.*/g)[0].substring(14);
//const port = props.match(/ethereum\.port=.*/g)[0].substring(14);
//const from = props.match(/ethereum\.from=.*/g)[0].substring(14);

/*
 * References - Truffle Configuration:
 * https://truffleframework.com/docs/truffle/reference/configuration - Truffle
 * Commands:
 * https://truffleframework.com/docs/truffle/reference/truffle-commands -
 * web3.js 1.0 API : https://web3js.readthedocs.io/en/1.0/
 */
module.exports = {
  contracts_directory : "./contracts",
  contracts_build_directory : "./build/contracts",
  migrations_directory : "./migrations",

  networks : {
    development : {
      host : '127.0.0.1',
      port : 8070, 
      network_id : 37,
      from : '0xc5776c5d4ba76dd38424a160927c6b7054b55edd',
      gas : 6000000, // Gas limit used for deploys.
  	  gasPrice : 10000000000 // Gas price used for deploys
    },
  },

  ropsten : {
    provider : function() {
      return new HDWalletProvider(mnemonic,
          "https://ropsten.infura.io/Sqj6qg9ix47UK1EBQQb0");
    },
    network_id : 3,
  },

  rinkeby : {
    provider : function() {
      return new HDWalletProvider(mnemonic,
          "https://rinkeby.infura.io/Sqj6qg9ix47UK1EBQQb0");
    },
    network_id : 4,
  },

  kovan : {
    provider : function() {
      return new HDWalletProvider(mnemonic,
          "https://kovan.infura.io/Sqj6qg9ix47UK1EBQQb0");
    },
    network_id : 6,
  },

  mocha : {
    useColors : true
  },

  compilers : {
    solc : {
      version : "^0.5.4",
      settings : {
        optimizer : {
          enabled : true,
          runs : 200
        }
      }
    }
  }
};
