import 'package:bloc/bloc.dart';
import 'package:medigo/features/Hospital/presentation/cubit/hospital-state.dart';

class HospitalCubit extends Cubit<HospitalState> {
  HospitalCubit() : super(HospitalInatialState());
}
