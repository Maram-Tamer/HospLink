import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';

class FirebaseServices {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final CollectionReference _colectionPatient =
      _firestore.collection('patient');
  static final CollectionReference _colectionHospital =
      _firestore.collection('hospital');

  static createPatient(PatientModel patient) {
    _colectionPatient.doc(patient.uid).set(patient.toJson());
  }

  static createHospital(HospitalModel hospital) {
    _colectionHospital.doc(hospital.uid).set(hospital.toJson());
  }
}
