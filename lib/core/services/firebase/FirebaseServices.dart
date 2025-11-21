import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medigo/core/services/local/local-helper.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';

class FirebaseServices {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final CollectionReference _collectionPatient =
      _firestore.collection('patient');
  static final CollectionReference _collectionHospital =
      _firestore.collection('hospital');
  static final CollectionReference _collectionRequest =
      _firestore.collection('requests');

  static createPatient(PatientModel patient) {
    _collectionPatient.doc(patient.uid).set(patient.toJson());
  }

  static createHospital(HospitalModel hospital) {
    _collectionHospital.doc(hospital.uid).set(hospital.toJson());
  }

  static sendRequest(RequestModel request) {
    _collectionRequest.doc(request.requestID).set(request.toJson());
  }

  static updatePatient(PatientModel patient) {
    _collectionPatient.doc(patient.uid).update(patient.toUpdateData());
  }

  static updateHospital(HospitalModel hospital) {
    _collectionHospital.doc(hospital.uid).update(hospital.toUpdateData());
  }

  static getHospitals() {
    return _collectionHospital.get();
  }

  static Future<QuerySnapshot> getPatient(String uid) {

    return _collectionPatient.where('uid', isEqualTo: uid).get();
  }

//search hospitals
  static Future<QuerySnapshot> searchHospitals(String text) async {
    return _collectionHospital.orderBy('name').get();
  }

//get top rated hospitals
  static Future<QuerySnapshot> getTopRatedHospitals({int limit = 10}) async {
    return _collectionHospital
        .orderBy('rate', descending: true)
        .limit(limit)
        .get();
  }

//get nearest hospitals
  static Future<QuerySnapshot> getNearestHospitals() async {
    return _collectionHospital.limit(15).get();
  }

  static getHospitalsById(String id) async {}

  static Future<QuerySnapshot> getRequests() {
    String hospitalID = LocalHelper.getUserId()!;
    return _collectionRequest.where('hospitalID', isEqualTo: hospitalID).get();
  }
}
