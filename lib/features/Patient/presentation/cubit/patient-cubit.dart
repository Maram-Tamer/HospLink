import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medigo/components/calcAge/calcAge.dart';
import 'package:medigo/core/constatnts/Lists.dart';
import 'package:medigo/core/extentions/show_dialoges.dart';
import 'package:medigo/core/extentions/uploadCloudinary.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/core/services/local/local-helper.dart';
import 'package:medigo/features/Hospital/data/model/hospital-model.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';
import 'package:medigo/features/Patient/data/repo/patient-repo.dart';
import 'package:medigo/features/Patient/presentation/cubit/patient-state.dart';

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
  final TextEditingController commentController = TextEditingController();
  int currentRating = 0;
  String selectedGender = "Male";
  String selectedBloodType = Boold[0];
  PatientType selectedPatientType = PatientType.iAmPatient;

  String? imageUri;
  File? imagFeile;
  List<HospitalModel> hospitals = [];
  List<HospitalModel> favoriteHospitals = [];

  // void getHospitals() {
  //   emit(PatientInatialState());
  //   FirebaseServices.getHospitals()
  //       .then((value) => hospitals = value.docs.map((e) {
  //             return HospitalModel.fromJson(e as Map<String, dynamic>);
  //           }).toList());
  // }
  Future<void> getFavoriteHospitals() async {
    emit(PatientLoadingState());
    try {
      PatientModel patient = LocalHelper.getUserDataPatient()!;
      var data = await FirebaseServices.getHospitals();
      hospitals = data.docs.map((e) {
        return HospitalModel.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
      print(hospitals);
      for (var element in hospitals) {
        if (patient.favoriteHospitals!.contains(element.uid)) {
          favoriteHospitals.add(element);
        }
      }
      emit(PatientSuccessState());
    } on Exception catch (e) {
      emit(PatientErrorState());
    }
  }

  void sendRequest(BuildContext context, String hospitalId) async {
    emit(PatientLoadingState());
    try {
      imageUri = await uploadFileToCloudinary(
            //uplad image for patient or hospital
            imagFeile!,
            "dislsl3sa",
            "se77ty",
            context,
          ) ??
          '';
    } on Exception catch (e) {
      emit(PatientErrorState());

      showMyDialog(context, 'لم يتم رفع الصور');
    }

    PatientModel patient = await PatientRepo.getPatientDetails();
    if (selectedBloodType == Boold[0]) {
      selectedBloodType = patient.blood ?? 'I Dont Know';
    }
    if (selectedPatientType == PatientType.iAmPatient) {
      ageController.text = calculateAgeFromString(patient.date ?? '');
    }

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
            requestID:
                FirebaseFirestore.instance.collection('requests').doc().id,
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
            requestID:
                FirebaseFirestore.instance.collection('requests').doc().id,
            phone: phoneController.text,
            state: StateRequest[0]);

    PatientRepo.sendRequest(request);
    emit(PatientSuccessState());
  }
}
