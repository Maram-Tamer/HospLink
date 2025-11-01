import 'package:medigo/features/auth/data/models/user.dart';

class AuthState {}

class AuthInatialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
   UserType? userType;
  AuthSuccessState({ this.userType});
}

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState({required this.error});
}
