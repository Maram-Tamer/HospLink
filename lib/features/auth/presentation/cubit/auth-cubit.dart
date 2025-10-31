
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medigo/features/auth/data/models/user.dart';
import 'package:medigo/features/auth/data/repo/auth_repo.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInatialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late UserType userType;
  UserCredential? userCredential;
  
  login() {
    log('load');
    emit(AuthLoadingState());
    AuthRepo.login(emailController.text, passwordController.text).then((value) {
      value.fold((l) {
        log(l);
        emit(AuthErrorState(error: l));
      }, (r) {
        emit(AuthSuccessState(userType: r));
      });
    });
  }

  signup() {
    emit(AuthLoadingState());
    AuthRepo.signup(emailController.text, passwordController.text,userType).then((value) {
      value.fold((l) {
        emit(AuthErrorState(error: l));
      }, (r) {
        emit(AuthSuccessState());
      });
    });
  }
  resetPassword() {
    emit(AuthLoadingState());
    AuthRepo.resetPassword(emailController.text).then((value) {
      value.fold((l) {
        emit(AuthErrorState(error: l));
      }, (r) {
        emit(AuthSuccessState());
      });
    });
  }
  
}
