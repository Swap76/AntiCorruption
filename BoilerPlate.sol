pragma solidity ^0.4.19;
pragma experimental ABIEncoderV2;

contract Anticorruption{
    
    struct BasicInfo{
        // Basic info of every entity
    }
    
    struct SchemesInfo{
        // Schemes basic Info
    }
    
    function AddScheme(string _name,uint _amount) returns (string Status) {
        // Add new Schemes
    }
    
    function GetScheme(string name) {
        // Get Schemes
    }
    
    function AddAuthorizedPerson(uint AdharcardNo) returns (string Status) {
        // AddAuthorizedPerson
    }
    
    function AddAuthorizedCompany(uint CIN) returns (string Status) {
        // AddAuthorizedCompany
    }
    
    function MoneyForEntityForPerticularSchemes(string name) returns (uint Money) {
        // GetMoneyForEntityForPerticularSchemes
    }
    
    function TotalMoneyForEntity(string name) returns (uint Money) {
        // TotalMoneyForEntity
    }
    
    
    function MoneyToNextLevel() returns (string Status){
        // MoneyToNextLevel
    }
    
    function MoneyAPersonGetting() returns (uint Money){
        // MoneyAPersonGetting
    }

    function TransferMoney(uint From, uint To) returns (string Status){
        // TransferMoney
    } 

}

