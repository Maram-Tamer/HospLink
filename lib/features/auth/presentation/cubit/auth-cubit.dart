import 'package:bloc/bloc.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInatialState());
}
