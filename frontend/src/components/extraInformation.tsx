import React from 'react'

export default function ExtraInformation() {
    return (
        <>
        <div>
        <p className='text-gray-500 py-2'>
                        .
                    </p>
                    <p className="text-gray-500 py-2">
                        .
                    </p>
                    <p className="text-gray-500 py-2">
                        .
                    </p>
        </div>
            <div className="md:flex md:space-x-10 items-center p-5 md:p-0 mb-16"
            >
                <div className='w-full md:w-1/2'
                    data-aos="zoom-in"
                    data-aos-easing="ease-out-cubic"
                >
                    <img src="/img3.jpeg" alt=""
                        className="rounded object-cover h-full w-full max-h-[350px] md:max-w-1/2"
                    />
                </div>
                <div className='w-full md:w-1/2' data-aos="zoom-out"
                    data-aos-easing="ease-out-cubic">
                        
                    <p className="text-gray-500  py-2">
                        .
                    </p>
                    <p className="text-gray-500  py-2">
                        .
                    </p>
                    <p className="text-gray-500  py-2">
                        .
                    </p>
                </div>
            </div>
        </>
    )
}
