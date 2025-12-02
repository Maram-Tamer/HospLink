class HistoryModel {
  String? date;
  String? patientId;
  String? hospitalId;
  String? historyId;
  String? namePatient;
  String? phonePatient;
  String? rateFromPatient;
  String? profilePatient;
  String? profileHospital;
  String? addressHospital;
  String? message;

  HistoryModel({
    this.date,
    this.patientId,
    this.hospitalId,
    this.historyId,
    this.namePatient,
    this.phonePatient,
    this.rateFromPatient,
    this.profilePatient,
    this.profileHospital,
    this.addressHospital,
    this.message,
  });

  HistoryModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    patientId = json['patientId'];
    hospitalId = json['hospitalId'];
    historyId = json['historyId'];
    namePatient = json['namePatient'];
    phonePatient = json['phonePatient'];
    rateFromPatient = json['rateFromPatient'];
    profilePatient = json['profilePatient'];
    profileHospital = json['profileHospital'];
    addressHospital = json['addressHospital'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['patientId'] = patientId;
    data['hospitalId'] = hospitalId;
    data['historyId'] = historyId;
    data['namePatient'] = namePatient;
    data['phonePatient'] = phonePatient;
    data['rateFromPatient'] = rateFromPatient;
    data['profilePatient'] = profilePatient;
    data['profileHospital'] = profileHospital;
    data['addressHospital'] = addressHospital;
    data['message'] = message;

    return data;
  }

  Map<String, dynamic> toUpdateData() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (date != null) data['date'] = date;
    if (patientId != null) data['patientId'] = patientId;
    if (hospitalId != null) data['hospitalId'] = hospitalId;
    if (historyId != null) data['historyId'] = historyId;
    if (namePatient != null) data['namePatient'] = namePatient;
    if (phonePatient != null) data['phonePatient'] = phonePatient;
    if (rateFromPatient != null) data['rateFromPatient'] = rateFromPatient;
    if (profilePatient != null) data['profilePatient'] = profilePatient;
    if (profileHospital != null) data['profileHospital'] = profileHospital;
    if (addressHospital != null) data['addressHospital'] = addressHospital;
    if (message != null) data['message'] = message;

    return data;
  }
}
