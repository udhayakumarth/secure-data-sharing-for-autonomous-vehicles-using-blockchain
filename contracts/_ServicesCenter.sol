// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./_Vehicle.sol";


contract ServicesCenter{
    
    function updateMerikelrootvalue(address vehicleContactAddress,string memory currentMerikelrootvalue) public{
         Vehicle VehicleDetails = Vehicle(vehicleContactAddress);
         VehicleDetails.updateMerikelrootvalue(currentMerikelrootvalue);
    }

    function getVehicleDetails(address vehicleContactAddress) public view returns (string memory){
        Vehicle VehicleDetails = Vehicle(vehicleContactAddress);
        return string(abi.encodePacked(
            "RegID:",VehicleDetails.getvehicleRegisterId()," | ",
            "Brand:",VehicleDetails.getvehicleBrand()," | ",
            "Model:",VehicleDetails.getvehicleModel()," | ",
            "Color:",VehicleDetails.getvehicleColor()," | ",
            "Merikelrootvalue:",VehicleDetails.getvehicleMerikelrootvalue()," | ",
            "OwendBy:",VehicleDetails.getvehicleOwendBy()," | ",
            "CreatedTime:",VehicleDetails.getvehicleCreatedTime()
            ));
    }
}