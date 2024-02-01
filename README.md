Back-End:

Currently use remix.ethereum.org to compile and deploy smart contract; alternative measures such as HardHat/Truffle/Solc can also be tested out

Compiling:
- Use remix UI to deploy onto blockchain; use account 0x69 for Owner, 0xBfE for role demo
- Populate frontend/src/components/SupplyChain.json with the compiled ABI from remix
- Update `contractAddress` in frontend/src/compoenents/form.tsx

`npm run install` to install packages for first time
`npm run start` to open app in development mode on http://localhost:3000.

TODO:
- Make an actual README
