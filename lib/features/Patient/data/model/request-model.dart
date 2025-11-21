class RequestModel {
  String? name;
  String? age;
  String? gender;
  String? phone;
  String? address;
  String? blood;
  String? description;
  String? nationalID;
  String? state;
  String? hospitalID;
  String? patientID;
  String? requestID;
  String? imageProfilePath;
  String? imageDamagePath;

  RequestModel({
    this.name,
    this.age,
    this.gender,
    this.phone,
    this.address,
    this.blood,
    this.description,
    this.nationalID,
    this.state,
    this.hospitalID,
    this.requestID,
    this.patientID,
    this.imageProfilePath,
    this.imageDamagePath,
  });

  // From JSON
  RequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    phone = json['phone'];
    address = json['address'];
    blood = json['blood'];
    description = json['description'];
    nationalID = json['nationalId'];
    state = json['state'];
    hospitalID = json['hospitalID'];
    requestID = json['requestID'];
    patientID = json['patientID'];
    imageProfilePath = json['imageProfilePath'];
    imageDamagePath = json['imageDamagePath'];
  }

  // To JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['gender'] = gender;
    data['phone'] = phone;
    data['address'] = address;
    data['blood'] = blood;
    data['description'] = description;
    data['nationalId'] = nationalID;
    data['state'] = state;
    data['hospitalID'] = hospitalID;
    data['patientID'] = patientID;
    data['requestID'] = requestID;
    data['imageProfilePath'] = imageProfilePath;
    data['imageDamagePath'] = imageDamagePath;
    return data;
  }

  // To Update Only Non-null Fields
  Map<String, dynamic> toUpdateData() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (age != null) data['age'] = age;
    if (gender != null) data['gender'] = gender;
    if (phone != null) data['phone'] = phone;
    if (address != null) data['address'] = address;
    if (blood != null) data['blood'] = blood;
    if (description != null) data['description'] = description;
    if (nationalID != null) data['nationalId'] = nationalID;
    if (state != null) data['state'] = state;
    if (hospitalID != null) data['hospitalID'] = hospitalID;
    if (requestID != null) data['requestID'] = requestID;
    if (patientID != null) data['patientID'] = patientID;
    if (imageProfilePath != null) data['imageProfilePath'] = imageProfilePath;
    if (imageDamagePath != null) data['imageDamagePath'] = imageDamagePath;

    return data;
  }
}
