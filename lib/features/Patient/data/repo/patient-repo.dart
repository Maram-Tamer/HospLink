import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';

class PatientRepo {
  static getPatientDetails() async {
    log('--- 11 ---${FirebaseAuth.instance.currentUser!.uid}');

    QuerySnapshot snapshot = await FirebaseServices.getPatient(
        FirebaseAuth.instance.currentUser!.uid);
    log('--- 22 ---');
    Map<String, dynamic> data =
        snapshot.docs.first.data() as Map<String, dynamic>;

    PatientModel patient = PatientModel.fromJson(data);
    return patient;
  }

  static sendRequest(RequestModel request) {
    try {
      log('--- 33 ---');

      FirebaseServices.sendRequest(request);
    } on Exception catch (e) {
      log('--- 44 ---');

      log(e.toString());
    }
  }
}
