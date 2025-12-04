import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:medigo/core/services/local/local-helper.dart';
import 'package:medigo/features/Hospital/data/model/hospital-model.dart';
import 'package:medigo/features/Patient/data/model/getRequestModel.dart';
import 'package:medigo/features/Patient/data/model/history_model.dart';
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
  static final CollectionReference _collectionHistory =
      _firestore.collection('history');

  static createPatient(PatientModel patient) {
    _collectionPatient.doc(patient.uid).set(patient.toJson());
  }

  static createHospital(HospitalModel hospital) {
    _collectionHospital.doc(hospital.uid).set(hospital.toJson());
  }

  static createHistory(HistoryModel history) {
    _collectionHistory.doc(history.historyId).set(history.toJson());
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

  static Future<QuerySnapshot<Object?>> getHospitals() {
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

  static Future<HospitalModel> getHospitalById(String hospitalId) async {
    try {
      DocumentSnapshot doc = await _collectionHospital.doc(hospitalId).get();

      if (doc.exists) {
        return HospitalModel.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Hospital not found');
      }
    } catch (e) {
      throw Exception('Error fetching hospital: $e');
    }
  }

  static Future<QuerySnapshot> getRequests() {
    String hospitalID = LocalHelper.getUserId()!;
    return _collectionRequest.where('hospitalID', isEqualTo: hospitalID).get();
  }

  static updateRequest(String requestId, RequestModel request) {
    _collectionRequest.doc(requestId).update(request.toUpdateData());
  }

  static Future<String> uploadPatientImage(String uid, File imageFile) async {
    final storageRef = FirebaseStorage.instance.ref().child(
        "patients/$uid/profile_${DateTime.now().millisecondsSinceEpoch}.jpg");

    // Upload file
    await storageRef.putFile(imageFile);

    // Return download URL
    return await storageRef.getDownloadURL();
  }

  static deleteRequest(String requestId) {
    _collectionRequest.doc(requestId).delete();
  }

  static Future<void> deleteRequestsForPatient(
      String patientId, String requesrId) async {
    final querySnapshot =
        await _collectionRequest.where('patientID', isEqualTo: patientId).get();

    for (var doc in querySnapshot.docs) {
      if (doc.id != requesrId) await doc.reference.delete();
    }
  }

  static Stream<List<RequestWithHospital>> getRequestsPatient() {
    String patientID = LocalHelper.getUserId()!;

    return _collectionRequest
        .where('patientID', isEqualTo: patientID)
        .snapshots()
        .asyncMap((snapshot) async {
      List<RequestWithHospital> results = [];

      for (var doc in snapshot.docs) {
        final requestData = doc.data() as Map<String, dynamic>;
        final hospitalId = requestData['hospitalID'];

        // Fetch hospital data
        final hospitalDoc = await FirebaseFirestore.instance
            .collection('hospital')
            .doc(hospitalId)
            .get();

        final hospitalData = hospitalDoc.data() ?? {};

        results.add(
          RequestWithHospital(
            request: requestData,
            hospital: hospitalData,
          ),
        );
      }
      //log('${results}');

      return results;
    });
  }

  static updateHospitalRate(String hospitalId, double rate, num totalPatient) {
    _collectionHospital.doc(hospitalId).update({
      'rate': rate.toString(),
      'totalPatient': totalPatient.toString(),
    });
  }
  static Future<QuerySnapshot> getHistory() {
    String patientID = LocalHelper.getUserId()!;
    return _collectionHistory.where('patientID', isEqualTo: patientID).get();
  }
}
