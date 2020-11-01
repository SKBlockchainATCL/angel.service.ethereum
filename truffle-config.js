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
      from : '0xC5776C5d4ba76dD38424A160927c6B7054b55edD',
      gas : 6e6, // Gas limit used for deploys - 6000000.
  	  gasPrice : 100e9 // Gas price used for deploys - 100000000000 wei, 100 Gwei(Sharron)
    }
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
