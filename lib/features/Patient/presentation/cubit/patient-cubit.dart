import 'package:bloc/bloc.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/Patient/presentation/cubit/patient-state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInatialState());
  List<HospitalModel> hospitals = [];
  void getHospitals() {
    emit(PatientInatialState());
    FirebaseServices.getHospitals().then((value) => hospitals = value.docs.map((e) {
      return HospitalModel.fromJson(e as Map<String, dynamic>);
    }).toList());
  }
}
