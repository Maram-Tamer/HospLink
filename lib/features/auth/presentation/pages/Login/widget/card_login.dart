import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';
import 'package:medigo/features/auth/presentation/pages/Login/page/login_screen.dart';

class CardLogin extends StatelessWidget {
  CardLogin({
    super.key,
    required this.routeForgetPassword,
    required this.widget,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController;
  String routeForgetPassword;
  final LoginScreen widget;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(widget.icon, width: 60, height: 60),
        Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: MainTextFormField(
            label: 'Email',
            ispassword: false,
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
              if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
        ),
        Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: MainTextFormField(
            label: 'Password',
            ispassword: true,
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
        ),
        Gap(10),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                pushTo(
                    context: context,
                    route: Routes.forgetPassword,
                    extra: routeForgetPassword);
              },
              child: Text(
                'Forget Password ?',
                style: AppFontStyles.getSize14(
                  fontWeight: FontWeight.w500,
                  fontColor: AppColors.primaryGreenColor,
                ),
              ),
            ),
          ),
        ),
        Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: MainButton(
            buttonText: 'Login',
            onPressed: () {
              FirebaseServices.createPatient(PatientModel(
                  name: 'eslam emad ibrahim',
                  address: 'shubra elkhema elqaliobia',
                  blood: 'O+',
                  date: '2005-1-1',
                  email: 'ee7456482@gmial.com',
                  gender: 'male',
                  illnesses: [],
                  imageUri: 'https://',
                  nameFriend: 'ahmed adel',
                  nationalID: '330501011412436',
                  phone: '01104796306',
                  phoneFriend: '01558060246',
                  uid: '1'));
              FirebaseServices.createHospital(HospitalModel(
                  name: 'Elhayaa',
                  IDnumber: '123456789',
                  address: 'cairo',
                  date: '3030-30-3',
                  description: 'description ',
                  email: '@gmal.com',
                  fileUri: 'https::',
                  hospitalType: 'hospital',
                  imageUri: 'https:\\',
                  locationLati: '30.22',
                  locationLong: '31.22',
                  officelEmail: 'ee@gmail.com',
                  phone: '0123456789',
                  secondPhone: '0155741960',
                  uid: '1',
                  website: 'www.hospital.com'));
              pushAndRemoveUntil(
                context: context,
                route: widget.routeAfterLogin,
              );
            },
          ),
        ),
      ],
    );
  }
}
