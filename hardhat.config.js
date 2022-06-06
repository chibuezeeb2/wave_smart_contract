require("@nomiclabs/hardhat-waffle");
require ("dotenv").config();

module.exports = {
  solidity: "0.8.0",
  networks: {
    rinkeby: {
      url: process.env.STAGING_ALCHEMY_URLII,
      accounts: [process.env.PRIVATE_KEY]
    },
    mainnet: {
      chainId: 1,
      url: process.env.PROD_ALCHEMY_KEYII,
      accounts: [process.env.PRIVATE_KEY]
    },
  },
};
