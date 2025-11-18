import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medigo/components/calcAge/calcAge.dart';
import 'package:medigo/core/constatnts/Lists.dart';
import 'package:medigo/core/extentions/show_dialoges.dart';
import 'package:medigo/core/extentions/uploadCloudinary.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';
import 'package:medigo/features/Patient/data/repo/patient-repo.dart';
import 'package:medigo/features/Patient/presentation/cubit/patient-state.dart';
import 'package:medigo/features/auth/data/repo/auth_repo.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInatialState());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controllers  send request
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedGender = "Male";
  String selectedBloodType = Boold[0];
  PatientType selectedPatientType = PatientType.iAmPatient;

  String? imageUri;
  File? imagFeile;
  List<HospitalModel> hospitals = [];

  void getHospitals() {
    emit(PatientInatialState());
    FirebaseServices.getHospitals()
        .then((value) => hospitals = value.docs.map((e) {
              return HospitalModel.fromJson(e as Map<String, dynamic>);
            }).toList());
  }

  void sendRequest(BuildContext context, String hospitalId) async {
    log('--- 1 ---');
    emit(PatientLoadingState());
    try {
      log('--- 2 ---');

      imageUri = await uploadFileToCloudinary(
            //uplad image for patient or hospital
            imagFeile!,
            "dislsl3sa",
            "se77ty",
            context,
          ) ??
          '';
      log('--- 3 ---');
    } on Exception catch (e) {
      log('--- 4 ---');
      emit(PatientErrorState());

      return showMyDialog(context, 'لم يتم رفع الصور');
    }
    log('--- 5 ---');

    PatientModel patient = await PatientRepo.getPatientDetails();
    if (selectedBloodType == Boold[0]) {
      log('--- 6 ---');

      selectedBloodType = patient.blood ?? 'I Dont Know';
    }
    if (selectedPatientType == PatientType.iAmPatient) {
      log('--- 7 ---');

      ageController.text = calculateAgeFromString(patient.date ?? '');
    }
    log('--- 8 ---');

    var request = (selectedPatientType == PatientType.iAmPatient)
        ? RequestModel(
            address: addressController.text,
            blood: selectedBloodType,
            description: descriptionController.text,
            age: ageController.text,
            gender: patient.gender,
            hospitalID: hospitalId,
            imageDamagePath: imageUri,
            imageProfilePath: patient.imageUri,
            name: patient.name,
            nationalID: patient.nationalID,
            patientID: patient.uid,
            phone: patient.phone,
            state: StateRequest[0])
        : RequestModel(
            address: addressController.text,
            blood: selectedBloodType,
            description: descriptionController.text,
            age: ageController.text,
            gender: selectedGender,
            hospitalID: hospitalId,
            imageDamagePath: imageUri,
            imageProfilePath: patient.imageUri,
            name: nameController.text,
            nationalID: nameController.text,
            patientID: patient.uid,
            phone: phoneController.text,
            state: StateRequest[0]);
    log('--- 9 ---');

    PatientRepo.sendRequest(request);
    log('--- 10 ---');
    emit(PatientSuccessState());
  }
}
