export default function Information() {
    return (
        <>
            <div className="md:flex md:space-x-10 items-center">
                <div className='p-5 md:p-0 w-full' data-aos="fade-down"
                    data-aos-easing="ease-out-cubic"
                    data-aos-duration="2000">
                    <p className='text-gray-500 py-2'
                    >
                        This is a decentralized application (dApp) built to interact with the SupplyChain smart contract on a blockchain. Users are able to interact with the smart contract by accessing various Action items base on their Access Role.
                    </p>

                    <p className='text-gray-500 py-2'
                    >
                        Users can connect their wallet by either clicking on the "Connect Wallet" button, or use MetaMask's Chrome extension.
                    </p>
                </div>
            </div>
        </>

    )
}
