import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';
import 'package:medigo/features/auth/data/models/user.dart';

class AuthRepo {
   static createPatient(PatientModel patient) {
    try {
      FirebaseServices.createPatient(patient);
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static createHospital(HospitalModel hospital) {
    try {
      FirebaseServices.createHospital(hospital);
    } on Exception catch (e) {
      log(e.toString());
    }
  }
  static Future<Either<String,UserType>> login(String email, String password,) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(FirebaseAuth.instance.currentUser?.photoURL == UserType.hospital.name?UserType.hospital:UserType.patient);
    } on FirebaseAuthException catch (e) {
      log(e.code);
      if (e.code == 'user-not-found') {
        return Left('There is no user with this email');
      } else if (e.code == 'wrong-password') {
        return Left('wrong password');
      } else {
        return Left('something went wrong');
      }
    } catch (e) {
      return Left('something went wrong');
    }
    }
  static Future<Either<String, bool>> signup(String email, String password,UserType userType) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
     FirebaseAuth.instance.currentUser!.updatePhotoURL(userType.name);
      return right(true);
    } on FirebaseAuthException catch (e) {
      
       if (e.code == 'weak-password') {
        return Left('password is too weak');
      } else if (e.code == 'email-already-in-use') {
        return Left('email already in use');
      } else {
        return Left('something went wrong');
      }
    } catch (e) {
      return Left('something went wrong');
    }
  }
  static Future<Either<String, bool>> resetPassword(String email) async {
    try {
      log(email);
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      return right(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left('There is no user with this email');
      } else {
        return Left('something went wrong');
      }
    } catch (e) {
      return Left('something went wrong');
    }
  }
}
