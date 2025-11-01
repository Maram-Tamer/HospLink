import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:group_button/group_button.dart';
import 'package:medigo/core/constatnts/Lists.dart';
import 'package:medigo/core/extentions/show_dialoges.dart' show showMyDialog;
import 'package:medigo/core/extentions/uploadCloudinary.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medigo/features/auth/data/models/user.dart';
import 'package:medigo/features/auth/data/repo/auth_repo.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInatialState());
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneFriendController = TextEditingController();
  TextEditingController secondphoneFriendController = TextEditingController();
  TextEditingController nameFriendController = TextEditingController();
  TextEditingController nationalIDController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  GroupButtonController booldController = GroupButtonController();
  GroupButtonController illnessesController = GroupButtonController();
  TextEditingController officialEmailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController IDNumberController = TextEditingController();
  String? radiGroub;
  String? imageUri;
  File? imagFeile;
  String? filePath;
  File? fileDoc;
  String? positionLong;
  String? positionLati;

  createHosptial(BuildContext context) async {
    try {
      filePath = await uploadFileToCloudinary(
            //upload doc
            fileDoc!,
            "dislsl3sa",
            "se77ty",
            context,
          ) ??
          '';
      imageUri = await uploadFileToCloudinary(
            //uplad image for patient or hospital
            imagFeile!,
            "dislsl3sa",
            "se77ty",
            context,
          ) ??
          '';
    } on Exception catch (e) {
      return showMyDialog(context, 'حدث خطا اثناء رفع الصورة او الملف ');
    }
    var hospital = HospitalModel(
        IDnumber: IDNumberController.text,
        address: addressController.text,
        date: dateController.text,
        description: descriptionController.text,
        email: 'eeeee@gmail.com',
        fileUri: filePath,
        hospitalType: radiGroub,
        imageUri: imageUri,
        locationLati: positionLong,
        locationLong: positionLati,
        name: nameController.text,
        officelEmail: officialEmailController.text,
        phone: phoneController.text,
        secondPhone: secondphoneFriendController.text,
        uid: '17',
        website: websiteController.text);

    AuthRepo.createHospital(hospital);
  }

  createpatient(BuildContext context) async {
    List<String> illnesses = [];
    for (int i in illnessesController.selectedIndexes) {
      illnesses.add(chronicDiseases[i]);
    }
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
      return showMyDialog(context, 'لم يتم رفع الصور');
    }
    var patient = PatientModel(
        address: addressController.text,
        blood: Boold[booldController.selectedIndex!],
        date: dateController.text,
        imageUri: imageUri,
        name: nameController.text,
        nationalID: nationalIDController.text,
        uid: '6',
        phone: phoneController.text,
        email: 'ee7456482@gmail.com',
        nameFriend: nameFriendController.text,
        phoneFriend: phoneFriendController.text,
        gender: radiGroub,
        illnesses: illnesses);
    AuthRepo.createPatient(patient);
  }

  updateLocation(Position position) {
    positionLati = position.latitude.toString();
    positionLong = position.longitude.toString();
    emit(AuthSuccessState());
  }

  upladFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      filePath = file.path;
      fileDoc = file;
      // log('${file}')
    } else {
      showMyDialog(context, 'Please select file');
    }
    emit(AuthSuccessState());
  }

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
    AuthRepo.signup(emailController.text, passwordController.text, userType)
        .then((value) {
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
