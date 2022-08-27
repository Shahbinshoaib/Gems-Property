import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gemsproperty/services//auth.dart';

class DatabaseService{

  final CollectionReference buyPropertyCollection = Firestore.instance.collection('Buy Property Data');
  final CollectionReference rentPropertyCollection = Firestore.instance.collection('Rent Property Data');
  final CollectionReference agentCollection = Firestore.instance.collection('Agent Data');
  final CollectionReference sellerCollection = Firestore.instance.collection('Seller Form Data');
  final CollectionReference rentalCollection = Firestore.instance.collection('Rental Form Data');
  final CollectionReference bankingCollection = Firestore.instance.collection('Bank Form Data');
  final CollectionReference designCollection = Firestore.instance.collection('Construction Design Data');
  final CollectionReference buildingCollection = Firestore.instance.collection('Construction Building Data');
  final CollectionReference buyerCollection = Firestore.instance.collection('Buyer Data');
  final CollectionReference agentRequestCollection = Firestore.instance.collection('Agent Request Data');
  final CollectionReference contactCollection = Firestore.instance.collection('Contacted Users Data');





  Future updateBuyPropertyData(String type, String title, String area, String price, String pic, String bedrooms, String description, String face, String agentName, String agentNo, String id) async{
    return await buyPropertyCollection.document(id).setData({
      'Property Type' : type,
      'Post Title' : title,
      'Property Area' : area,
      'Property Price' : price,
      'Property Pic' : pic,
      'No. of Bedrooms' : bedrooms,
      'Description' : description,
      'House Facing' : face,
      'Agent Name' : agentName,
      'Agent No.' : agentNo,
      'Property Id' : id,
    });
  }
  Future updateRentPropertyData(String type, String title, String area, String price, String pic, String bedrooms, String description, String face, String agentName, String agentNo, String id) async{
    return await rentPropertyCollection.document(id).setData({
      'Property Type' : type,
      'Post Title' : title,
      'Property Area' : area,
      'Property Price' : price,
      'Property Pic' : pic,
      'No. of Bedrooms' : bedrooms,
      'Description' : description,
      'House Facing' : face,
      'Agent Name' : agentName,
      'Agent No.' : agentNo,
      'Property Id' : id,
    });
  }
  Future updateSellerFormData(String name, String address, String mobile, String landline, String email, String howSoon, String liveIn, String type, String constructionType, String type2, String certificate, String location, String area, String storey, String other, String area2, String room, String bathroom, String roadSize, String roadType, String parking, String price, String totalPrice, String reason, String feature, String name2, String designation, String date) async{
    return await sellerCollection.document('${date} - ${mobile}').setData({
      'Name' : name,
      'Address' : address,
      'Mobile' : mobile,
      'Landline' : landline,
      'Email': email,
      'HowSoon' : howSoon,
      'LiveIn' : liveIn,
      'Type' : type,
      'ConstructionType' : constructionType,
      'Type2' : type2,
      'Certificate' : certificate,
      'Location': location,
      'Area': area,
      'Storey':storey,
      'Other':other,
      'Area2':area2,
      'Room':room,
      'Bathroom':bathroom,
      'RoadSize': roadSize,
      'RoadType': roadType,
      'Parking': parking,
      'Price':price,
      'TotalPrice':totalPrice,
      'Reason':reason,
      'Feature':feature,
      'Name2': name2,
      'Designation':designation,
      "Date":date
    });
  }

  Future updateRentalFormData(String name, String address, String mobile, String landline, String email, String howSoon, String liveIn, String type, String constructionType, String type2, String location, String details, String area, String price, String area2, String room, String bathroom, String roadSize, String roadType, String parking, String feature, String date) async{
    return await rentalCollection.document('${date} - ${mobile}').setData({
      'Name' : name,
      'Address' : address,
      'Mobile' : mobile,
      'Landline' : landline,
      'Email': email,
      'HowSoon' : howSoon,
      'LiveIn' : liveIn,
      'Type' : type,
      'ConstructionType' : constructionType,
      'Type2' : type2,
      'Location': location,
      'Area': area,
      'Area2':area2,
      'Room':room,
      'Bathroom':bathroom,
      'RoadSize': roadSize,
      'RoadType': roadType,
      'Parking': parking,
      'Price':price,
      'Feature':feature,
      'Details' : details,
      "Date":date
    });
  }
  Future updateBankingData(String name, String dob, String pob, String status, String dependents, String children, String nationality, String father, String mother, String address, String sName, String city, String district, String state, String occu, String cost, String down, String down2, String loan, String repayment, String loanFor, String balance, String exp , String date) async{
    return await bankingCollection.document('${date} - ${name}').setData({
      'Name' : name,
      'DOB' : dob,
      'POB': pob,
      'Status' : status,
      'Dependents' :dependents,
      'Children' : children,
      'Nationality' : nationality,
      'Father': father,
      'Mother' : mother,
      'Address' : address,
      'SName' : sName,
      'City' : city,
      'District' : district,
      'State' : state,
      'Occu': occu,
      'Cost':cost,
      'Down' : down,
      'Down2' : down2,
      'Loan' : loan,
      'Repayment' : repayment,
      'LoanFor' : loanFor,
      'Balance': balance,
      'Exp':exp,
      'Date' :date
    });
  }

  Future updateDesignData(String name, String address, String mobile, String landline, String email, String landAddress, String landArea, String type, String sfMax, String sfMin, String storey, String room, String bathroom, String parking, String stairs, String roof, String pooja, String store, String underground, String extra, String additional, String date) async{
    return await designCollection.document('${date} - ${name}').setData({
      'Name' : name,
      'Address' :address,
      'Mobile': mobile,
      'Landline':landline,
      'Email':email,
      'LandAddress':landAddress,
      'LandArea':landArea,
      'Type':type,
      'SFMax':sfMax,
      'SFMin':sfMin,
      'Storey':storey,
      'Room':room,
      'Bathroom':bathroom,
      'Parking':parking,
      'Stairs':stairs,
      'Roof':roof,
      'Pooja' :pooja,
      'Store':store,
      'Underground':underground,
      'Extra':extra,
      'Additional':additional,
      'Date' :date
    });
  }
  Future updateBuildingData(String name2, String address2, String mobile2, String landline2, String email2, String newBuild, String extension, String renovation, String location2, String area2, String storey2, String budget, String description, String date) async{
    return await buildingCollection.document('${date} - ${name2}').setData({
      'Name2' : name2,
      'Address2' :address2,
      'Mobile2': mobile2,
      'Landline2':landline2,
      'Email2':email2,
      'NewBuild':newBuild,
      'Extension':extension,
      'Renovation':renovation,
      'Location2':location2,
      'Area2':area2,
      'Storey2':storey2,
      'Budget':budget,
      'Description':description,
      'Date' :date
    });
  }

  Future updateBuyerForm(String name, String email, String mobile, String type, String address, String budget, String date) async{
    return await buyerCollection.document('${date} - ${name}').setData({
      'Name' : name,
      'Address' : address,
      'Budget' : budget,
      'Email' : email,
      'Mobile' : mobile,
      'Type' : type,
      'Date' : date,
    });
  }

  Future updateAgentRequestForm(String name, String email, String fatherName, String gFatherName, String address, String city, String state, String vdc, String address2, String city2, String state2, String vdc2, String nationality, String dob, String pob, String identityType, String identityNo, String idate, String qualification, String language, String phone, String landline, String email2, String phone3, String landline3, String email3, String bank, String accNo, String accName, String message, String date) async{
    return await agentRequestCollection.document('${date} - ${name}').setData({
      'Name' : name,
      'Email': email,
      'Father Name': fatherName,
      'G Father Name': gFatherName,
      'Address':address,
      'City':city,
      'State':state,
      'VDC':vdc,
      'Address2':address2,
      'City2':city2,
      'State2': state2,
      'VDC2':vdc2,
      'Nationality':nationality,
      'DOB':dob,
      'POB':pob,
      'Identity Type': identityType,
      'Identity No.':identityNo,
      'Issue Date':idate,
      'Qualification':qualification,
      'Language':language,
      'Phone': phone,
      'Landline':landline,
      'Email2':email2,
      'Phone3':phone3,
      'Landline3':landline3,
      'Email3':email3,
      'Bank': bank,
      'Acc No.':accNo,
      'Acc Name': accName,
      'Message':message,
      'Date': date,
    });
  }

  Future updateAgent(String name, String designation, String area, String email, String phone, String pic, String date) async{
    return await agentCollection.document('${date} - ${name}').setData({
      'Name' : name,
      'Designation' : designation,
      'Area' : area,
      'Email' : email,
      'Phone' : phone,
      'Pic' : pic,
      'Date' :date
    });
  }

  Future updateContact(String name, String email, String message, String date, String phone) async{
    return await contactCollection.document('${date} - ${name}').setData({
      'Name' : name,
      'Email' : email,
      'Message' : message,
      'Date' : date,
      'Phone' :phone,
    });
  }





  Future delBuyPropertyDocument(String title) async{
    return await buyPropertyCollection.document(title).delete();
  }
  Future delRentPropertyDocument(String title) async{
    return await rentPropertyCollection.document(title).delete();
  }

  List<PropertyData> _userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return PropertyData(
        type: doc.data['Property Type'] ?? 'Not Available',
        title: doc.data['Post Title'] ?? 'Not Available',
        area: doc.data['Property Area'] ?? 'Not Available',
        price: doc.data['Property Price'] ?? '0.0',
        pic: doc.data['Property Pic'] ?? null,
        bedrooms: doc.data['No. of Bedrooms'] ?? 'Not Available',
        description: doc.data['Description'] ?? 'Not Available',
        face: doc.data['House Facing'] ?? 'Not Available',
        agentName: doc.data['Agent Name'] ?? null,
        agentNo: doc.data['Agent No.'] ?? 'Not Available',
        id: doc.data['Property Id'] ?? 'Not Available',

      );
    }).toList();
  }
  List<SellerFormData> _sellerFormListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return SellerFormData(
        name: doc.data['Name'] ?? 'Not Available',
        address: doc.data['Address'] ?? 'Not Available',
        mobile: doc.data['Mobile'] ?? 'Not Available',
        landline: doc.data['Landline'] ?? 'Not Available',
        email: doc.data['Email'] ?? 'Not Available',
        howSoon: doc.data['HowSoon'] ?? 'Not Available',
        liveIn: doc.data['LiveIn'] ?? 'Not Available',
        type: doc.data['Type'] ?? 'Not Available',
        constructionType: doc.data['ConstructionType'] ?? 'Not Available',
        type2: doc.data['Type2'] ?? 'Not Available',
        certificate: doc.data['Certificate'] ?? 'Not Available',
        location: doc.data['Location'] ?? 'Not Available',
        area: doc.data['Area'] ?? 'Not Available',
        storey: doc.data['Storey'] ?? 'Not Available',
        other: doc.data['Other'] ?? 'Not Available',
        area2: doc.data['Area2'] ?? 'Not Available',
        room: doc.data['Room'] ?? 'Not Available',
        bathroom: doc.data['Bathroom'] ?? 'Not Available',
        roadSize: doc.data['RoadSize'] ?? 'Not Available',
        roadType: doc.data['RoadType'] ?? 'Not Available',
        parking: doc.data['Parking'] ?? 'Not Available',
        price: doc.data['Price'] ?? 'Not Available',
        totalPrice: doc.data['TotalPrice'] ?? 'Not Available',
        reason: doc.data['Reason'] ?? 'Not Available',
        feature: doc.data['Feature'] ?? 'Not Available',
        name2: doc.data['Name2'] ?? 'Not Available',
        designation: doc.data['Designation'] ?? 'Not Available',
        date: doc.data['Date'] ?? 'Not Available',
        details: doc.data['Details'] ?? 'Not Available'

      );
    }).toList();
  }

  List<BankData> _bankFormListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return BankData(
          name: doc.data['Name'] ?? 'Not Available',
          dob: doc.data['BOB'] ?? 'Not Available',
          pob: doc.data['POB'] ?? 'Not Available',
          status: doc.data['Status'] ?? 'Not Available',
          dependents: doc.data['Dependents'] ?? 'Not Available',
          children: doc.data['Children'] ?? 'Not Available',
          nationality: doc.data['Nationality'] ?? 'Not Available',
          father: doc.data['Father'] ?? 'Not Available',
          mother: doc.data['Mother'] ?? 'Not Available',
          address: doc.data['Address'] ?? 'Not Available',
          sName: doc.data['SName'] ?? 'Not Available',
          city: doc.data['City'] ?? 'Not Available',
          district: doc.data['District'] ?? 'Not Available',
          state: doc.data['State'] ?? 'Not Available',
          occu: doc.data['Occu'] ?? 'Not Available',
          cost: doc.data['Cost'] ?? 'Not Available',
          down: doc.data['Down'] ?? 'Not Available',
          down2: doc.data['Down2'] ?? 'Not Available',
          loan: doc.data['Loan'] ?? 'Not Available',
          loanFor: doc.data['LoanFor'] ?? 'Not Available',
          repayment: doc.data['Repayment'] ?? 'Not Available',
          balance: doc.data['Balance'] ?? 'Not Available',
          exp: doc.data['Exp'] ?? 'Not Available',
          date: doc.data['Date'] ?? 'Not Available',
      );
    }).toList();
  }

  List<ConstructionData> _constructionFormListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return ConstructionData(
        name: doc.data['Name'] ?? 'Not Available',
        address: doc.data['Address'] ?? 'Not Available',
        mobile: doc.data['Mobile'] ?? 'Not Available',
        landline: doc.data['Landline'] ?? 'Not Available',
        email: doc.data['Email'] ?? 'Not Available',
        landAddress: doc.data['LandAddress'] ?? 'Not Available',
        landArea: doc.data['LandArea'] ?? 'Not Available',
        type: doc.data['Type'] ?? 'Not Available',
        sfMax: doc.data['SFMax'] ?? 'Not Available',
        sfMin: doc.data['SFMin'] ?? 'Not Available',
        storey: doc.data['Storey'] ?? 'Not Available',
        room: doc.data['Room'] ?? 'Not Available',
        bathroom: doc.data['Bathroom'] ?? 'Not Available',
        parking: doc.data['Parking'] ?? 'Not Available',
        stairs: doc.data['Stairs'] ?? 'Not Available',
        roof: doc.data['Roof'] ?? 'Not Available',
        pooja: doc.data['Pooja'] ?? '',
        store: doc.data['Store'] ?? '',
        underground: doc.data['Underground'] ?? 'Not Available',
        extra: doc.data['Extra'] ?? 'Not Available',
        additional: doc.data['Additional'] ?? 'Not Available',
        date: doc.data['Date'] ?? 'Not Available',
        name2: doc.data['Name2'] ?? 'Not Available',
        address2: doc.data['Address2'] ?? 'Not Available',
        mobile2: doc.data['Mobile2'] ?? 'Not Available',
        landline2: doc.data['Landline2'] ?? 'Not Available',
        email2: doc.data['Email2'] ?? '',
        newBuild: doc.data['NewBuild'] ?? '',
        extension: doc.data['Extension'] ?? 'Not Available',
        renovation: doc.data['Renovation'] ?? 'Not Available',
        location2: doc.data['Location2'] ?? 'Not Available',
        area2: doc.data['Area2'] ?? 'Not Available',
        storey2: doc.data['Storey2'] ?? 'Not Available',
        budget: doc.data['Budget'] ?? 'Not Available',
        description: doc.data['Description'] ?? 'Not Available',
        site2: doc.data['Site2'] ?? 'Not Available',
      );
    }).toList();
  }

  List<BuyerFormData> _buyerListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return BuyerFormData(
        name: doc.data['Name'] ?? '',
        mobile: doc.data['Mobile'] ?? '',
        type: doc.data['Type'] ??'',
        email: doc.data['Email'] ?? '',
        address: doc.data['Address'] ?? '',
        budget: doc.data['Budget'] ?? '',
        date: doc.data['Date'] ?? '',
      );
    }).toList();
  }

  List<AgentRequestData> _agentRequestFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return AgentRequestData(
        name: doc.data['Name'] ?? 'Not Available',
        email: doc.data['Email'] ?? 'Not Available',
        fatherName: doc.data['Father Name'] ?? 'Not Available',
        gFatherName: doc.data['G Father Name'] ?? 'Not Available',
        address: doc.data['Address'] ?? 'Not Available',
        city: doc.data['City'] ?? 'Not Available',
        state: doc.data['State'] ?? 'Not Available',
        vdc: doc.data['VDC'] ?? 'Not Available',
        address2: doc.data['Address2'] ?? 'Not Available',
        city2: doc.data['City2'] ?? 'Not Available',
        state2: doc.data['State2'] ?? 'Not Available',
        vdc2: doc.data['VDC2'] ?? 'Not Available',
        nationality: doc.data['Nationality'] ?? 'Not Available',
        dob: doc.data['DOB'] ?? 'Not Available',
        pob: doc.data['POB'] ?? 'Not Available',
        identityType: doc.data['Identity Type'] ?? 'Not Available',
        identityNo: doc.data['Identity No.'] ?? 'Not Available',
        idate: doc.data['Issue Date'] ?? 'Not Available',
        qualification: doc.data['Qualification'] ?? 'Not Available',
        language: doc.data['Language'] ?? 'Not Available',
        phone: doc.data['Phone'] ?? 'Not Available',
        landline: doc.data['Landline'] ?? 'Not Available',
        email2: doc.data['Email2'] ?? 'Not Available',
        phone3: doc.data['Phone3'] ?? 'Not Available',
        landline3: doc.data['Landline3'] ?? 'Not Available',
        email3: doc.data['Email3'] ?? 'Not Available',
        bank: doc.data['Bank'] ?? 'Not Available',
        accNo: doc.data['Acc No.'] ?? 'Not Available',
        accName: doc.data['Acc Name'] ?? 'Not Available',
        message: doc.data['Message'] ?? 'Not Available',
        date: doc.data['Date'] ?? 'Not Available',

      );
    }).toList();
  }

  List<AgentData> _agentListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return AgentData(
        name: doc.data['Name'] ?? '',
        designation: doc.data['Designation'] ?? '',
        area: doc.data['Area'] ??'',
        email: doc.data['Email'] ?? '',
        phone: doc.data['Phone'] ?? '',
        pic: doc.data['Pic'] ?? '',
      );
    }).toList();
  }
  List<ContactUserFormData> _contactListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return ContactUserFormData(
        name: doc.data['Name'] ?? '',
        email: doc.data['Email'] ?? '',
        message: doc.data['Message'] ?? '',
        phone: doc.data['Phone'] ?? '',
        date: doc.data['Date'] ?? '',
      );
    }).toList();
  }





  Stream<List<PropertyData>> get buyPropertyData {
    return buyPropertyCollection.snapshots()
        .map(_userListFromSnapshot);
  }
  Stream<List<PropertyData>> get rentPropertyData {
    return rentPropertyCollection.snapshots()
        .map(_userListFromSnapshot);
  }
  Stream<List<SellerFormData>> get sellerFormData {
    return sellerCollection.snapshots()
        .map(_sellerFormListFromSnapshot);
  }
  Stream<List<SellerFormData>> get rentalFormData {
    return rentalCollection.snapshots()
        .map(_sellerFormListFromSnapshot);
  }
  Stream<List<BankData>> get bankData {
    return bankingCollection.snapshots()
        .map(_bankFormListFromSnapshot);
  }
  Stream<List<ConstructionData>> get designData {
    return designCollection.snapshots()
        .map(_constructionFormListFromSnapshot);
  }
  Stream<List<ConstructionData>> get buildingData {
    return buildingCollection.snapshots()
        .map(_constructionFormListFromSnapshot);
  }
  Stream<List<BuyerFormData>> get buyerData {
    return buyerCollection.snapshots()
        .map(_buyerListFromSnapshot);
  }
  Stream<List<AgentRequestData>> get agentRequestData {
    return agentRequestCollection.snapshots()
        .map(_agentRequestFromSnapshot);
  }
  Stream<List<AgentData>> get agentData {
    return agentCollection.snapshots()
        .map(_agentListFromSnapshot);
  }
  Stream<List<ContactUserFormData>> get contactUserData {
    return contactCollection.snapshots()
        .map(_contactListFromSnapshot);
  }




}

class PropertyData{

  final String type;
  final String title;
  final String area;
  final String price;
  final String pic;
  final String bedrooms;
  final String description;
  final String face;
  final String agentName;
  final String agentNo;
  final String id;

  PropertyData({this.type, this.title, this.area, this.price, this.pic, this.bedrooms, this.description, this.face, this.agentName, this.agentNo, this.id});

}

class AgentData{

  final String name;
  final String designation;
  final String area;
  final String email;
  final String phone;
  final String pic;

  AgentData({this.name, this.designation, this.area, this.email, this.phone, this.pic});
}

class SellerFormData{

  final String name;
  final String address;
  final String mobile;
  final String landline;
  final String email;
  final String howSoon;
  final String liveIn;
  final String type;
  final String constructionType;
  final String type2;
  final String certificate;
  final String location;
  final String area;
  final String storey;
  final String other;
  final String area2;
  final String room;
  final String bathroom;
  final String roadSize;
  final String roadType;
  final String parking;
  final String price;
  final String totalPrice;
  final String reason;
  final String feature;
  final String name2;
  final String designation;
  final String date;
  final String details;

  SellerFormData({this.details,this.name, this.address, this.mobile, this.landline, this.email, this.howSoon, this.liveIn, this.type, this.constructionType, this.type2, this.certificate, this.location, this.area, this.storey, this.other, this.area2, this.room, this.bathroom, this.roadSize, this.roadType, this.parking, this.price, this.totalPrice, this.reason, this.feature, this.name2, this.designation, this.date});

}

class BankData{

  final String name;
  final String dob;
  final String pob;
  final String status;
  final String dependents;
  final String children;
  final String nationality;
  final String father;
  final String mother;
  final String address;
  final String sName;
  final String city;
  final String district;
  final String state;
  final String occu;
  final String cost;
  final String down;
  final String down2;
  final String loan;
  final String repayment;
  final String loanFor;
  final String balance;
  final String exp;
  final String date;

  BankData({this.name, this.dob, this.pob, this.status, this.dependents, this.children, this.nationality, this.father, this.mother, this.address, this.sName, this.city, this.district, this.state, this.occu, this.cost, this.down, this.down2, this.loan, this.repayment, this.loanFor, this.balance, this.exp, this.date});
}

class ConstructionData{

  final String name;
  final String address;
  final String mobile;
  final String landline;
  final String email;
  final String landAddress;
  final String landArea;
  final String type;
  final String sfMax;
  final String sfMin;
  final String storey;
  final String room;
  final String bathroom;
  final String parking;
  final String stairs;
  final String roof;
  final String pooja;
  final String store;
  final String underground;
  final String extra;
  final String additional;
  final String date;
  final String name2;
  final String address2;
  final String mobile2;
  final String landline2;
  final String email2;
  final String newBuild;
  final String extension;
  final String renovation;
  final String location2;
  final String area2;
  final String storey2;
  final String budget;
  final String description;
  final String site2;

  ConstructionData({this.name, this.address, this.mobile, this.landline, this.email, this.landAddress, this.landArea, this.type, this.sfMax, this.sfMin, this.storey, this.room, this.bathroom, this.parking, this.stairs, this.roof, this.pooja, this.store, this.underground, this.extra, this.additional, this.date, this.name2, this.address2, this.mobile2, this.landline2, this.email2, this.newBuild, this.extension, this.renovation, this.location2, this.area2, this.storey2, this.budget, this.description, this.site2});

}

class BuyerFormData{

  final String name;
  final String email;
  final String mobile;
  final String type;
  final String address;
  final String budget;
  final String date;

  BuyerFormData({this.name, this.email, this.mobile, this.type, this.address, this.budget, this.date});

}
class ContactUserFormData{

  final String name;
  final String email;
  final String message;
  final String date;
  final String phone;

  ContactUserFormData({this.name, this.email, this.message, this.date,this.phone});

}

class AgentRequestData {

  final String name;
  final String email;
  final String fatherName;
  final String gFatherName;
  final String address;
  final String city;
  final String state;
  final String vdc;
  final String address2;
  final String city2;
  final String state2;
  final String vdc2;
  final String nationality;
  final String dob;
  final String pob;
  final String identityType;
  final String identityNo;
  final String idate;
  final String qualification;
  final String language;
  final String phone;
  final String landline;
  final String email2;
  final String phone3;
  final String landline3;
  final String email3;
  final String bank;
  final String accNo;
  final String accName;
  final String message;
  final String date;

  AgentRequestData({this.name, this.email, this.fatherName, this.gFatherName, this.address, this.city, this.state, this.vdc, this.address2, this.city2, this.state2, this.vdc2, this.nationality, this.dob, this.pob, this.identityType, this.identityNo, this.idate, this.qualification, this.language, this.phone, this.landline, this.email2, this.phone3, this.landline3, this.email3, this.bank, this.accNo, this.accName, this.message, this.date});

}