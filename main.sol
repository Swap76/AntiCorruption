pragma solidity ^0.4.19;
pragma experimental ABIEncoderV2;

contract Anticorruption{
    
    struct BasicInfoOfEntity{
        // Basic info of every entity
        string Name;
        uint BankAccountNo;
        uint Validity;
        
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
        uint [] Authorized; 
        uint Validity;

    }
    
    mapping(uint => BasicInfoOfEntity) EntityInfo;
    mapping(uint => SchemesInfo) Schemes; 
    mapping(uint => uint) TotalMoney;
    
    function AddEntity(uint AdharcardNo, string _name, uint _BankAccountNo)  returns (string Status) { 
        // Add new Entity
        if (EntityInfo[AdharcardNo].Validity==0){ 
        EntityInfo[AdharcardNo].Name = _name;
        EntityInfo[AdharcardNo].BankAccountNo = _BankAccountNo;
        EntityInfo[AdharcardNo].Validity = 1;
        return("  Entity Added Successfully.");
       }
       else{
        return("  Entity Already present.");
       }
    }
    
    function GetEntity(uint AdharcardNo) view returns (string Name ,uint BankAccountNo ) {
        // Get info About Entity
        require(EntityInfo[AdharcardNo].Validity==1);
        return(EntityInfo[AdharcardNo].Name,EntityInfo[AdharcardNo].BankAccountNo);
    }
    
    function AddScheme(string _name,uint _amount)  returns (string Status)  {
        // Add new Schemes
        
        
    }
    
    function GetScheme(string name) view returns (string Description ,uint TotalAmount , uint BankAccountNo, uint []) {
        // Get Schemes
    }
    
    function AddAuthorizedPerson(uint AdharcardNo)  returns (string Status) {
        // AddAuthorizedPerson
    }
    
    function AddAuthorizedCompany(uint CIN)  returns (string Status) {
        // AddAuthorizedCompany
    }
    
    function MoneyForEntityForPerticularSchemes(string name) view returns (uint Money) {
        // GetMoneyForEntityForPerticularSchemes
    }
    
    function TotalMoneyForEntity(string name) view returns (uint Money) {
        // TotalMoneyForEntity
    }
    
    
    function MoneyToNextLevel()  returns  (string Status) {
        // MoneyToNextLevel
    }
    
    function MoneyAPersonGetting() view returns (uint Money) {
        // MoneyAPersonGetting
    }
    
    function TransferMoney(uint From, uint To)  returns (string Status) {
        // TransferMoney
    } 
}