// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


import "@openzeppelin/contracts/utils/Strings.sol";

contract Vehicle{
    string registerId;
    string carBrand;
    string carModel;
    string carColor;
    string merikelrootvalue;
    string owendBy;
    uint CreatedTime;

    function AddVehicle (
        string memory _registerId,
        string memory _carBrand,
        string memory _carModel,
        string memory _carColor,
        string memory _merikelrootvalue
    ) public {
        registerId = _registerId;
        carBrand = _carBrand;
        carModel = _carModel;
        carColor = _carColor;
        merikelrootvalue = _merikelrootvalue;
        CreatedTime = getCurrentTime();
    }

    function setOwnerShip(string memory oweraddress)public {
        owendBy = oweraddress;
    }

    function verifyMerikelrootvalue(string memory currentMerikelrootvalue) public view returns (bool){
        return keccak256(abi.encodePacked(currentMerikelrootvalue)) == keccak256(abi.encodePacked(merikelrootvalue));
    }

    function updateMerikelrootvalue(string memory currentMerikelrootvalue) public{
        merikelrootvalue = currentMerikelrootvalue;
    }

    function getCurrentTime() internal view returns(uint){
        return block.timestamp;
    }

    function getvehicleBrand() public view returns(string memory) {
        return carBrand;
    }

    function getvehicleModel() public view returns(string memory) {
        return carModel;
    }

    function getvehicleColor() public view returns(string memory) {
        return carColor;
    }

    function getvehicleRegisterId() public view returns(string memory) {
        return registerId;
    }

    function getvehicleMerikelrootvalue() public view returns(string memory) {
        return merikelrootvalue;
    }

    function getvehicleCreatedTime() public view returns(string memory) {
        return Strings.toString(CreatedTime);
    }

    function getvehicleOwendBy() public view returns(string memory) {
        return owendBy;
    }
 


}