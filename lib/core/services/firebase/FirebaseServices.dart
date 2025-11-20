import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseServices {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final CollectionReference _collectionPatient =
      _firestore.collection('patient');
  static final CollectionReference _collectionHospital =
      _firestore.collection('hospital');

  static createPatient(PatientModel patient) {
    _collectionPatient.doc(patient.uid).set(patient.toJson());
  }

  static createHospital(HospitalModel hospital) {
    _collectionHospital.doc(hospital.uid).set(hospital.toJson());
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

  static Future<String> uploadPatientImage(String uid, File imageFile) async {
    final storageRef = FirebaseStorage.instance.ref().child(
        "patients/$uid/profile_${DateTime.now().millisecondsSinceEpoch}.jpg");

    // Upload file
    await storageRef.putFile(imageFile);

    // Return download URL
    return await storageRef.getDownloadURL();
  }
}
