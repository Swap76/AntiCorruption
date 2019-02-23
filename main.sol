pragma solidity ^0.4.19;
pragma experimental ABIEncoderV2;

contract Anticorruption{
    
    struct BasicInfoOfEntity{
        // Basic info of every entity
        string Name;
        uint BankAccountNo;
        bool Validity;
    }
    
    struct StaticEntitiy{
        // Basic info of entities like state , District etc.
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
        mapping(uint => uint) MoneyAtPresent;
        uint [] Authorized; 
        bool Validity;
    }
    
    mapping(uint => bool) StaticORNOt;
    mapping(uint => StaticEntitiy) StaticEntities;
    mapping(uint => BasicInfoOfEntity) EntityInfo;
    mapping(uint => SchemesInfo) Schemes; 
    mapping(uint => uint) TotalMoney;
    mapping(uint => bool) BankAccount;
    
    function AddStaticEntity(string UniqueCode, string _name, uint _BankAccountNo)  returns (string Status ) { 
        // Add new Entity
        uint UID = uint(keccak256(UniqueCode));
        if (StaticEntities[UID].Validity==false && BankAccount[_BankAccountNo] == false){ 
        StaticEntities[UID].Name = _name;
        StaticEntities[UID].BankAccountNo = _BankAccountNo;
        StaticEntities[UID].Validity = true;
        StaticORNOt[UID] = true;
        return(" Entity Added Successfully.");
       }
       else{
        return(" Entity Already present.");
       }
    }
    
    function GetStaticEntity(string UniqueCode) view returns (string Name ,uint BankAccountNo ) {
        // Get info About Entity
        uint UID = uint(keccak256(UniqueCode));
        require(StaticORNOt[UID] == true);
        return(StaticEntities[UID].Name,StaticEntities[UID].BankAccountNo);
    }
    
    function AddEntity(uint AdharcardNo, string _name, uint _BankAccountNo,uint _Tag)  returns (string Status ) { 
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
    
    function AddAuthorizedPerson(string SID,uint AdharcardNo, uint _money)  returns (string Status) {
        // AddAuthorizedPerson
        uint sid = uint(keccak256(SID));
        require(Schemes[sid].Validity==true);
        Schemes[sid].AuthorizedEntity[AdharcardNo] = true;
        Schemes[sid].MoneyAllocatedForEntityForPerticularEntity[AdharcardNo] = _money;
        Schemes[sid].Authorized.push(AdharcardNo);
        return("Person Added Successfully");
    }
    
    function AddAuthorizedCompany(string SID, uint CIN, uint _money)  returns (string Status) {
        // AddAuthorizedCompany
        uint sid = uint(keccak256(SID));
        require(Schemes[sid].Validity==true);
        Schemes[sid].AuthorizedEntity[CIN] = true;
        Schemes[sid].MoneyAllocatedForEntityForPerticularEntity[CIN] = _money;
        Schemes[sid].Authorized.push(CIN);
        return("Company Added Successfully");

    }
    
    function MoneyAPersonGetting(string SID,uint AdharcardNo) view returns (uint Money) {
        // GetMoneyForEntityForPerticularSchemes
        uint sid = uint(keccak256(SID));
        require(Schemes[sid].Validity==true);
        return(Schemes[sid].MoneyAllocatedForEntityForPerticularEntity[AdharcardNo]);
    }   
    
    function TotalMoneyForEntity(uint UID) view returns (uint Money) {
        // TotalMoneyForEntity
        return(TotalMoney[UID]);
    }
    
    function MoneyReceivedInScheme(string SID,uint UID) returns (uint Money){
        uint sid = uint(keccak256(SID));
        require(Schemes[sid].Validity==true);
        return(Schemes[sid].MoneyReceived[UID]);
    }
    
    function MoneyATPresent(string SID, uint UID) view returns (uint Money) {
        // MoneyAPersonGetting
        uint sid = uint(keccak256(SID));
        require(Schemes[sid].Validity==true);
        return(Schemes[sid].MoneyAtPresent[UID]);
    }
    
    function TransferMoneyStaticToNormal(string SID,string FromUID, uint To,uint money)  returns (string Status) {
        // TransferMoney Dont ristrict ststic entities
        uint sid = uint(keccak256(SID));
        uint fromUID = uint(keccak256(FromUID));
        require(Schemes[sid].Validity==true && StaticORNOt[fromUID] == true);
        if (Schemes[sid].MoneyAllocatedForEntityForPerticularEntity[To] <= money && Schemes[sid].AuthorizedEntity[To] == true){
            Schemes[sid].MoneyAtPresent[To] = Schemes[sid].MoneyAtPresent[To] + money;
            Schemes[sid].MoneyAtPresent[fromUID] = Schemes[sid].MoneyAtPresent[fromUID] - money;
            Schemes[sid].MoneyReceived[To] = money;
            TotalMoney[fromUID] = TotalMoney[fromUID] - money;
            TotalMoney[To] = TotalMoney[To] + money;
        }
    } 
    
    function TransferMoneyStaticToStatic(string SID,string FromUID,string ToUID,uint money) returns (string Status){
        uint sid = uint(keccak256(SID));
        uint fromUID = uint(keccak256(fromUID));
        uint toUID = uint(keccak256(ToUID));
        require(Schemes[sid].Validity==true  && StaticORNOt[fromUID] == true  && StaticORNOt[toUID] == true);
        Schemes[sid].MoneyAtPresent[toUID] = Schemes[sid].MoneyAtPresent[toUID] + money;
        Schemes[sid].MoneyAtPresent[fromUID] = Schemes[sid].MoneyAtPresent[fromUID] - money;
        Schemes[sid].MoneyReceived[toUID] = money;
        TotalMoney[fromUID] = TotalMoney[fromUID] - money;
        TotalMoney[toUID] = TotalMoney[toUID] + money;
    }
    
    function TransferMoneyNormalToNormal(string SID,uint From, uint To,uint money){
        uint sid = uint(keccak256(SID));
        require(Schemes[sid].Validity==true);
        if (Schemes[sid].MoneyAllocatedForEntityForPerticularEntity[To] <= money && Schemes[sid].AuthorizedEntity[To] == true){
            Schemes[sid].MoneyAtPresent[To] = Schemes[sid].MoneyAtPresent[To] + money;
            Schemes[sid].MoneyAtPresent[From] = Schemes[sid].MoneyAtPresent[From] - money;
            Schemes[sid].MoneyReceived[To] = money;
            TotalMoney[From] = TotalMoney[From] - money;
            TotalMoney[To] = TotalMoney[To] + money;
        }
    }
}
































