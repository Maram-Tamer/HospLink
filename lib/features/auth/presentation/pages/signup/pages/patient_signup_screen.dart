import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
class PatientSignupScreen extends StatelessWidget {
  const PatientSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(60),
              Text('Create Your  Account',style: AppFontStyles.getSize32(fontColor: AppColors.primaryGreenColor,),),
              Gap(35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(children: [
                  Text('Fill out the information below to get started. All fields are required.',style: AppFontStyles.getSize24(fontSize: 20),textAlign: TextAlign.start,),
                Gap(30),
                MainTextFormField(ispassword:false,colorFill: AppColors.fillTextForm,label: 'Enter your full name',),
                  Gap(15), 
                   MainTextFormField(ispassword:false,colorFill: AppColors.fillTextForm,label: 'Enter your email',),
                  Gap(15),      
                   MainTextFormField(ispassword:false,colorFill: AppColors.fillTextForm,label: 'Enter your national  id',),
                  Gap(15), 
                   MainTextFormField(ispassword:true,colorFill: AppColors.fillTextForm,label: 'Enter your password',),
                  Gap(15), 
                   MainTextFormField(ispassword:true,colorFill: AppColors.fillTextForm,label: 'Confirm your password',),
                  Gap(15), 
                   MainTextFormField(ispassword:false,colorFill: AppColors.fillTextForm,label: 'Enter your Phone Number',),
                  Gap(15), 
                   MainTextFormField(ispassword:false,colorFill: AppColors.fillTextForm,label: 'Enter your Emergency Contact Name',),
                  Gap(15), 
                   MainTextFormField(ispassword:false,colorFill: AppColors.fillTextForm,label: 'Enter your Emergency Contact Relationship (e.g., "Parent," "Spouse")',),
                  Gap(15), 
                   MainTextFormField(ispassword:false,colorFill: AppColors.fillTextForm,label: 'Enter your Emergency Contact Phone Number',),
                   Gap(60),
                   MainButton(buttonText: 'Create Account', onPressed:(){}),
                   Gap(30),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                          WidgetSpan(child: Text('Already have an account? ',style: AppFontStyles.getSize18())),
                          WidgetSpan(child: GestureDetector(onTap:(){}, child: Text('Login',style: AppFontStyles.getSize18(fontColor: AppColors.primaryGreenColor),)))
                        ])
                       ),
                     ],
                   ),
                   Gap(15),
                ],),
              )
              ],
          ),
        ),
      ),
    );
  }
}