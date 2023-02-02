// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./_Vehicle.sol";

contract Manufacturer{
    struct VehicleDepoly{
        Vehicle vehicle;
        uint CreatedTime;
    }

    VehicleDepoly[] public VehicleDepolyList;
    mapping(string => Vehicle) public FindVehicleContractAddress;

    function CreateRegistrationContract(
        string memory RegisterId,
        string memory CarBrand,
        string memory CarModel,
        string memory CarColor,
        string memory Merikelrootvalue
    ) public{
        Vehicle vehicle = new Vehicle();
        vehicle.AddVehicle(RegisterId,CarBrand,CarModel,CarColor,Merikelrootvalue);
        VehicleDepolyList.push(VehicleDepoly(
            vehicle,
            getCurrentTime()
        ));
        FindVehicleContractAddress[RegisterId] = vehicle;

    }

    function getCurrentTime() internal view returns(uint){
        return block.timestamp;
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