import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';

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

  static getHospitals(){
    return _collectionHospital.get();
  }
}
