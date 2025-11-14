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

  static getHospitals() {
    return _collectionHospital.get();
  }


//search hospitals
 static Future<QuerySnapshot> searchHospitals(String text) async {
  return _collectionHospital
      .orderBy('name')
      .startAt([text])
      .endAt(['$text\uf8ff'])
      .get();
}

//get top rated hospitals
static Future<QuerySnapshot> getTopRatedHospitals({int limit = 5}) async {
  return _collectionHospital
      .orderBy('rating', descending: true) 
      .limit(limit)
      .get();
}

//get nearest hospitals
static Future<QuerySnapshot> getNearestHospitals() async {
  return _collectionHospital
      .orderBy('distance') // store distance in Firestore or calculate on client
      .limit(10)
      .get();
}
}


