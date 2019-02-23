pragma solidity ^0.4.19;
pragma experimental ABIEncoderV2;

contract Anticorruption{
    
    struct BasicInfoOfEntity{
        // Basic info of every entity
        string Name;
        uint BankAccountNo;
        bool Validity;
        
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
        bool Validity;

    }
    
    mapping(uint => BasicInfoOfEntity) EntityInfo;
    mapping(uint => SchemesInfo) Schemes; 
    mapping(uint => uint) TotalMoney;
    mapping(uint => bool) BankAccount;
    
    function AddEntity(uint AdharcardNo, string _name, uint _BankAccountNo)  returns (string Status ) { 
        // Add new Entity
        if (EntityInfo[AdharcardNo].Validity==false && BankAccount[_BankAccountNo] == false){ 
        EntityInfo[AdharcardNo].Name = _name;
        EntityInfo[AdharcardNo].BankAccountNo = _BankAccountNo;
        EntityInfo[AdharcardNo].Validity = true;
        return(" Entity Added Successfully.");
       }
       else{
        return(" Entity Already present.");
       }
    }
    
    function GetEntity(uint AdharcardNo) view returns (string Name ,uint BankAccountNo ) {
        // Get info About Entity
        require(EntityInfo[AdharcardNo].Validity==true);
        return(EntityInfo[AdharcardNo].Name,EntityInfo[AdharcardNo].BankAccountNo);
    }
    
    function AddScheme(string SID,string _name,string _Description,uint _amount,uint _BankAccountNo)  returns (string Status)  {
        // Add new Schemes
        uint sid = uint(keccak256(SID));
        if (Schemes[sid].Validity==false && BankAccount[_BankAccountNo] == false ){
            Schemes[sid].Name = _name;
            Schemes[sid].Description = _Description;
            Schemes[sid].TotalAmount = _amount;
            Schemes[sid].BankAccountNo = _BankAccountNo;
            Schemes[sid].Validity = true;
            return(" Scheme Created Successfully.");
        }
        else{
            return(" Scheme ID Already Present.");
        }
    }
    
    function GetScheme(string SID) view returns (string Description ,uint TotalAmount , uint BankAccountNo, uint [] Authorized) {
        // Get Schemes
        uint sid = uint(keccak256(SID));
        require(Schemes[sid].Validity==true);
        return(Schemes[sid].Description,Schemes[sid].TotalAmount,Schemes[sid].BankAccountNo,Schemes[sid].Authorized);
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