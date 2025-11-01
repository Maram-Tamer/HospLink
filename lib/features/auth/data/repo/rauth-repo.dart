import 'dart:developer';

import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';

class AuthRepo {
  static createPatient(PatientModel patient) {
    try {
      FirebaseServices.createPatient(patient);
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static createHospital(HospitalModel hospital) {
    try {
      FirebaseServices.createHospital(hospital);
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
