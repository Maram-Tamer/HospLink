class PatientModel {
  String? uid;
  String? email;
  String? name;
  String? gender;
  String? date;
  String? phone;
  String? address;
  String? nationalID;
  String? nameFriend;
  String? phoneFriend;
  String? blood;
  String? imageUri;
  List<String>? illnesses;

  PatientModel({
    this.uid,
    this.email,
    this.name,
    this.gender,
    this.date,
    this.phone,
    this.address,
    this.nationalID,
    this.nameFriend,
    this.phoneFriend,
    this.blood,
    this.imageUri,
    this.illnesses,
  });

  PatientModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    gender = json['gender'];
    date = json['date'];
    phone = json['phone'];
    address = json['address'];
    nationalID = json['nationalID'];
    nameFriend = json['nameFriend'];
    phoneFriend = json['phoneFriend'];
    blood = json['blood'];
    imageUri = json['imageUri'];
    illnesses = json['illnesses'] != null
        ? List<String>.from(json['illnesses'])
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['name'] = name;
    data['gender'] = gender;
    data['date'] = date;
    data['phone'] = phone;
    data['address'] = address;
    data['nationalID'] = nationalID;
    data['nameFriend'] = nameFriend;
    data['phoneFriend'] = phoneFriend;
    data['blood'] = blood;
    data['imageUri'] = imageUri;
    data['illnesses'] = illnesses;
    return data;
  }

  Map<String, dynamic> toUpdateData() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uid != null) data['uid'] = uid;
    if (email != null) data['email'] = email;
    if (name != null) data['name'] = name;
    if (gender != null) data['gender'] = gender;
    if (date != null) data['date'] = date;
    if (phone != null) data['phone'] = phone;
    if (address != null) data['address'] = address;
    if (nationalID != null) data['nationalID'] = nationalID;
    if (nameFriend != null) data['nameFriend'] = nameFriend;
    if (phoneFriend != null) data['phoneFriend'] = phoneFriend;
    if (blood != null) data['blood'] = blood;
    if (imageUri != null) data['imageUri'] = imageUri;
    if (illnesses != null) data['illnesses'] = illnesses;
    return data;
  }
}
