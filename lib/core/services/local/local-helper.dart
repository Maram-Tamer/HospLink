import 'dart:convert';
import 'dart:developer';

import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';
import 'package:medigo/features/auth/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  static late SharedPreferences pref;

  static String kIsOnBoardingShown = 'isOnBoardingShown';
  static String kUserId = 'kUserId';
  static String kUserType = 'kUserType';
  static String kUserDataPatient = 'kUserDataP';
  static String kUserDataHospital = 'kUserDataH';
  static String kHospitalFavorit = 'kFavorit';

  static init() async {
    pref = await SharedPreferences.getInstance();
  }

//onboarding
  static isOnBoardingShown(bool isShown) async {
    await setData(kIsOnBoardingShown, isShown);
  }

  static bool? getIsOnBoardingShown() {
    return getData(kIsOnBoardingShown);
  }

//user id
  static setUserId(String uid) async {
    await setData(kUserId, uid);
  }

  static String? getUserId() {
    return getData(kUserId);
  }

//user type
  static setUserType(String? user) async {
    await setData(kUserType, user);
  }

  static String? getUserType() {
    return getData(kUserType);
  }

//user data(name,email,photo ,...) patient
  static setUserDataPatient(PatientModel? patient) async {
    if (patient == null) return;
    var DataAsjson = patient.toJson();

    var dataAsString = jsonEncode(DataAsjson);

    await pref.setString(kUserDataPatient, dataAsString);
  }

  static PatientModel? getUserDataPatient() {
    var data = pref.getString(kUserDataPatient);
    if (data == null) return null;

    var dataAsJson = jsonDecode(data);

    return PatientModel.fromJson(dataAsJson);
  }

//User Data Hospital
  static setUserDataHospital(HospitalModel? hospital) async {
    if (hospital == null) return;
    var DataAsjson = hospital.toJson();

    var dataAsString = jsonEncode(DataAsjson);

    await pref.setString(kUserDataHospital, dataAsString);
  }

  static HospitalModel? getUserDataHospital() {
    var data = pref.getString(kUserDataHospital);
    if (data == null) return null;

    var dataAsJson = jsonDecode(data);

    return HospitalModel.fromJson(dataAsJson);
  }

  static setData(String key, dynamic value) {
    if (value is int) {
      pref.setInt(key, value);
    } else if (value is bool) {
      pref.setBool(key, value);
    } else if (value is String) {
      pref.setString(key, value);
    } else if (value is double) {
      pref.setDouble(key, value);
    } else if (value is List<String>) {
      pref.setStringList(key, value);
    }
  }

  // static setHospitalFavorit(List<HospitalModel>? hospital) async {
  //   if (hospital == null) return;
  //   var listOfString = hospital.map((e) => jsonEncode(e.toJson())).toList();

  //   await pref.setStringList(kHospitalFavorit, listOfString);
  // }

  // static List<HospitalModel>? getHospitalFavorit() {
  //   var data = pref.getStringList(kHospitalFavorit); //list os string
  //   if (data == null) return null;
  //   var hospital =
  //       data.map((e) => HospitalModel.fromJson(jsonDecode(e))).toList();
  //   return hospital;
  // }

  static dynamic getData(String key) {
    return pref.get(key);
  }

  static Future<bool> clear() {
    return pref.clear();
  }

  static Future<bool> remove(String key) {
    return pref.remove(key);
  }
}
