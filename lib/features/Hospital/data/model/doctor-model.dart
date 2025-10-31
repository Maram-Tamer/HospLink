class HospitalModel {
  String? uid;
  String? email;
  String? name;
  String? hospitalType;
  String? date;
  String? phone;
  String? secondPhone;
  String? officelEmail;
  String? address;
  String? IDnumber;
  String? description;
  String? website;
  String? imageUri;
  String? fileUri;
  String? locationLong;
  String? locationLati;

  HospitalModel({
    this.uid,
    this.email,
    this.name,
    this.hospitalType,
    this.date,
    this.phone,
    this.secondPhone,
    this.officelEmail,
    this.address,
    this.IDnumber,
    this.description,
    this.website,
    this.imageUri,
    this.fileUri,
    this.locationLong,
    this.locationLati,
  });

  HospitalModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    hospitalType = json['hospitalType'];
    date = json['date'];
    phone = json['phone'];
    secondPhone = json['secondPhone'];
    officelEmail = json['officelEmail'];
    address = json['address'];
    IDnumber = json['IDnumber'];
    description = json['description'];
    website = json['website'];
    imageUri = json['imageUri'];
    fileUri = json['fileUri'];
    locationLong = json['locationLong'];
    locationLati = json['locationLati'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['name'] = name;
    data['hospitalType'] = hospitalType;
    data['date'] = date;
    data['phone'] = phone;
    data['secondPhone'] = secondPhone;
    data['officelEmail'] = officelEmail;
    data['address'] = address;
    data['IDnumber'] = IDnumber;
    data['description'] = description;
    data['website'] = website;
    data['imageUri'] = imageUri;
    data['fileUri'] = fileUri;
    data['locationLong'] = locationLong;
    data['locationLati'] = locationLati;
    return data;
  }

  Map<String, dynamic> toUpdateData() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uid != null) data['uid'] = uid;
    if (email != null) data['email'] = email;
    if (name != null) data['name'] = name;
    if (hospitalType != null) data['hospitalType'] = hospitalType;
    if (date != null) data['date'] = date;
    if (phone != null) data['phone'] = phone;
    if (secondPhone != null) data['secondPhone'] = secondPhone;
    if (officelEmail != null) data['officelEmail'] = officelEmail;
    if (address != null) data['address'] = address;
    if (IDnumber != null) data['IDnumber'] = IDnumber;
    if (description != null) data['description'] = description;
    if (website != null) data['website'] = website;
    if (imageUri != null) data['imageUri'] = imageUri;
    if (fileUri != null) data['fileUri'] = fileUri;
    if (locationLong != null) data['locationLong'] = locationLong;
    if (locationLati != null) data['locationLati'] = locationLati;
    return data;
  }
}
