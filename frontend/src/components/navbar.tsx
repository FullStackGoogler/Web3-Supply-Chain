import React from 'react';

import Button from './button';

export default function Navbar() {
  const connectToMetaMask = async () => {
    try {
      await window.ethereum.request({ method: 'eth_requestAccounts' });
      console.log('Connected to MetaMask');
    } catch (error) {
      console.error('Error connecting to MetaMask:', error);
    }
  };

  return (
    <>
      <div className="fixed bg-white w-full border-b p-5 z-50">
        <div className="md:max-w-7xl mx-auto">
          <div className="flex justify-between items-center space-x-5 md:space-x-10">
            <div className="flex space-x-2 md:space-x-3 items-center font-extrabold">
              <span className="text-2xl md:text-4xl text-blue-600">
                Supply Chain Management{' '}
              </span>
            </div>

            <Button
              title="Connect Wallet"
              onClick={connectToMetaMask}
            />
          </div>
        </div>
      </div>
    </>
  );
}
