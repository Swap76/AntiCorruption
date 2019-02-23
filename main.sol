pragma solidity ^0.4.19;
pragma experimental ABIEncoderV2;

contract Anticorruption{
    
    struct BasicInfoOfEntity{
        // Basic info of every entity
        string Name;
        uint BankAccountNo;
        
    }
    
    struct SchemesInfo{
        // Schemes basic Info
        string Name;
        string Description;
        uint TotalAmount;
        uint BankAccountNo;
        mapping(uint => bool) AuthorizedEntity;
        mapping(uint => uint) MoneyAllocatedForEntityForPerticularEntity;
        mapping(uint => uint) MoneyReceived;
    }
    
    mapping(uint => BasicInfoOfEntity) EntityInfo;
    mapping(uint => SchemesInfo) Schemes; 
    mapping(uint => uint) TotalMoney;
    
    function AddEntity(uint AdharcardNo, string name, address BankAccountNo) { 
        // Add new Entity
    }
    
    function GetEntity(uint AdharcardNo) returns (string Name ,uint BankAccountNo ) {
        // Get info About Entity
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
    
    
    function MoneyToNextLevel() returns (string Status) {
        // MoneyToNextLevel
    }
    
    function MoneyAPersonGetting() returns (uint Money) {
        // MoneyAPersonGetting
    }
    
    function TransferMoney(uint From, uint To) returns (string Status) {
        // TransferMoney
    } 
}