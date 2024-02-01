import React from 'react';

export default function ExtraInformation() {
  return (
    <>
      <div
        className="md:flex md:space-x-10 items-center p-5 md:p-0 mb-16"
      >
        <div
          className='w-full md:w-1/2'
          data-aos="zoom-in"
          data-aos-easing="ease-out-cubic"
        >
          <img
            src="/img3.jpeg"
            alt=""
            className="rounded object-cover h-full w-full max-h-[350px] md:max-w-1/2"
          />
        </div>
        <div
          className='w-full md:w-1/2'
          data-aos="zoom-out"
          data-aos-easing="ease-out-cubic"
        >
            <p className='text-gray-500 py-2'>
                Attempting to utilize an Action item without the proper Role granted will result in an error message pop-up.
            </p>

            <p className="text-gray-500 py-2">
                Special thanks to{' '}
                <a href="https://github.com/sciemesfin" target="_blank" rel="noreferrer" className="text-blue-500 hover:underline">
                Mesfin Tsegaye
                </a>{' '}
                on GitHub for providing a starting base for this project to expand upon. Original repository can be found{' '}
                <a href="https://github.com/sciemesfin/alchemy-decentalized-supply-chain" target="_blank" rel="noreferrer" className="text-blue-500 hover:underline">
                here
                </a>
                .
            </p>

          <p className="text-gray-500 py-2">
            OpenZeppelin's Smart Contract library additionally provided secure contracts for the implementation of Roles, specifically Ownable.sol and AccessControl.sol.
          </p>
        </div>
      </div>
    </>
  );
}
