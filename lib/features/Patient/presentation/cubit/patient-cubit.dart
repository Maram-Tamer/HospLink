import 'package:bloc/bloc.dart';
import 'package:medigo/features/Patient/presentation/cubit/patient-state.dart';

class PatientCubit extends Cubit {
  PatientCubit() : super(PatientInatialState());
}
