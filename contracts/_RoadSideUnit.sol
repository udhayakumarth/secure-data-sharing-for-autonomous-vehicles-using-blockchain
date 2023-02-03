// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./_Vehicle.sol";


contract RodeSideUnit{
    
    function verifyMerikelrootvalue(address vehicleContactAddress,string memory currentMerikelrootvalue) public view returns (bool){
         Vehicle VehicleDetails = Vehicle(vehicleContactAddress);
        return VehicleDetails.verifyMerikelrootvalue(currentMerikelrootvalue);
    }
}
