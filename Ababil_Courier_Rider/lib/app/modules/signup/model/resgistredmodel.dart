import 'dart:io';



class RegistredModel {
  String? name;
  String? mobile;
  String? email;
  String? password;
  String? presentAddress;
  String? permanentAddress;
  String? fathersName;
  String? fathersPhoneNo;
  String? voterIdNo;
  String? fatherVoterIdNo;
  String? district;
  String? area;
  String? zoneId;
  File? profilePhoto;
  File? userVoterIdPhoto;
  File? fathersVoterIdPhoto;
  RegistredModel({
    required this.name,
    required this.mobile,
    required this.email,
    required this.password,
    required this.presentAddress,
    required this.permanentAddress,
    required this.fathersName,
    required this.fathersPhoneNo,
    required this.voterIdNo,
    required this.fatherVoterIdNo,
    required this.district,
    required this.area,
    required this.zoneId,
    required this.profilePhoto,
    required this.userVoterIdPhoto,
    required this.fathersVoterIdPhoto,
  });

  

  String get getname => name!;


  String get getmobile => mobile!;


  String get getemail => email!;
 

  String get getpassword => password!;
 

  String get getpresentAddress => presentAddress!;

  String get getpermanentAddress => permanentAddress!;
 
  String get getfathersName => fathersName!;


  String get getfathersPhoneNo => fathersPhoneNo!;
 

  String get getvoterIdNo => voterIdNo!;


  String get getfatherVoterIdNo => fatherVoterIdNo!;
  

  String get getdistrict => district!;
 

  String get getarea => area!;
  String get getzoneId => zoneId!;
  

  File get getprofilePhoto => profilePhoto!;
  

  File get getuserVoterIdPhoto => userVoterIdPhoto!;
  

  File get getfathersVoterIdPhoto => fathersVoterIdPhoto!;

  

}
