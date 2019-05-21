const MetaCoin = artifacts.require("MetaCoin");
const Ballot = artifacts.require("Ballot");
const ServiceProgram = artifacts.require("ServiceProgram");

module.exports = function(deployer) {
  deployer.deploy(MetaCoin);

  var proposals=[web3.utils.asciiToHex('Apple', 32),
    web3.utils.fromAscii('Banana'),
    web3.utils.fromAscii('Orange')];
  //deployer.deploy(Ballot, ['Apple', 'Banana', 'Orange']);
  deployer.deploy(Ballot, proposals, {gas : 5000000});
  
  
  var title1 = web3.utils.asciiToHex('The 1st Program', 32);
  var from1 = web3.utils.asciiToHex('20190125', 8); 
  var to1 = web3.utils.asciiToHex('20190131', 8);
  
  deployer.deploy(ServiceProgram, title1, from1, to1, {gas : 5000000});
  
  var title2 = web3.utils.asciiToHex('The 2nd Program', 32);
  var from2 = web3.utils.asciiToHex('20190223', 8);
  var to2 = web3.utils.asciiToHex('20190228', 8);
  
  deployer.deploy(ServiceProgram, title2, from2, to2, {gas : 5000000});
  
  
};