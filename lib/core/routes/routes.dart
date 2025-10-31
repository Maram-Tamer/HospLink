import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/features/Hospital/presentation/pages/patient_details/presentation/pages/patient_details_screen.dart';
import 'package:medigo/features/Hospital/presentation/pages/setting/page/password/change_password.dart';
import 'package:medigo/features/Hospital/presentation/pages/setting/page/pateint_history.dart';
import 'package:medigo/features/Hospital/presentation/pages/setting/page/profile/edit_profile_screen.dart';
import 'package:medigo/features/Main/hospital/main_hospital_Screen.dart';
import 'package:medigo/features/Main/patient/main_patient_Screen.dart';
import 'package:medigo/features/Patient/presentation/pages/notification/page/notification_screen.dart';
import 'package:medigo/features/Patient/presentation/pages/patient_data/page/unified_patient_screen.dart';
import 'package:medigo/features/Patient/presentation/pages/setting/page/hospital_history.dart'
    show HospitalHistory;
import 'package:medigo/features/auth/presentation/cubit/auth-cubit.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Hospital/page/Hospital_step1.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Hospital/page/Hospital_step2.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Hospital/page/Hospital_step3.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Patient/page/Patient_step1.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Patient/page/Patient_step2.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Patient/page/Patient_step3.dart';
import 'package:medigo/features/auth/presentation/pages/Login/page/login_screen.dart';
import 'package:medigo/features/auth/presentation/pages/Welcome/page/welcome_screen.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/pages/forget_password_mail_sent.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/pages/forget_password_screen.dart';
import 'package:medigo/features/auth/presentation/pages/privacy%20policy/privacy_policy_screen.dart';
import 'package:medigo/features/auth/presentation/pages/signup/pages/register.dart';
import 'package:medigo/features/Patient/presentation/pages/chat/chatScreen.dart';
import 'package:medigo/features/Patient/presentation/pages/hospital_data/presentation/pages/hospital_details_screen.dart';
import 'package:medigo/features/Intro/onboarding/page/onBoarding.dart';
import 'package:medigo/features/Patient/presentation/pages/setting/page/change_password.dart';
import 'package:medigo/features/Patient/presentation/pages/setting/page/edit_profile_screen.dart';
import 'package:medigo/features/Patient/presentation/pages/search/search_screen.dart';
import 'package:medigo/features/Intro/splash/page/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String onBoarding_1 = '/OnBoarding1';
  static const String welcom = '/welcome';
  static const String login_P = '/login-p';
  static const String login_H = '/login-h';
  static const String register_P = '/register-p';
  static const String register_H = '/register-h';
  static const String Privacy = '/privacy';
  static const String forgetPassword = '/forget_password';
  static const String oTP = '/otp';
  static const String resetPassword = '/reset-password';
  static const String forgetPasswordMailSent = '/forgetPasswordMailSent';

  static const String EnerData_P = '/details-p';
  static const String EnerData_H = '/details-h';
  static const String Patient_Step_1 = '/patient-1';
  static const String Patient_Step_2 = '/patient-2';
  static const String Patient_Step_3 = '/patient-3';
  static const String Hospital_Step_1 = '/hospital-1';
  static const String Hospital_Step_2 = '/hospital-2';
  static const String Hospital_Step_3 = '/hospital-3';

  static const String Main_patient = '/main-p';
  static const String Main_hospital = '/main-h';
  static const String chat = '/chat';
  static const String Search = '/Search';
  static const String HospitalDetails = '/hospital-details';
  static const String UnifiledpatientData = '/unfiled-patient-data';
  static const String Notification = '/notification';
  static const String MedicalHistory = '/midecal-history';

  static const String EditProfile = '/EditProfile';
  static const String ChangePassword = '/ChangePassword';
  static const String PatientHistory = '/patient-history';
  static const String PatientDetails = '/patient-details';
  static const String editPassword_H = '/editpasswordH';
  static const String editProfile_H = '/editProfileH';
  static const String NotificationH = '/notificationH';

  static final routes = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),

      GoRoute(
        path: editPassword_H,
        builder: (context, state) => ChangePasswordScreenH(),
      ),
      GoRoute(
        path: editProfile_H,
        builder: (context, state) => EditProfileScreenH(),
      ),
      GoRoute(
        path: PatientDetails,
        builder: (context, state) =>
            PatientDetailsScreen(isAccepted: state.extra as bool),
      ),
      GoRoute(
        path: PatientHistory,
        builder: (context, state) => PatientHistoryScrren(),
      ),
      GoRoute(path: Search, builder: (context, state) => SearchScreen()),
      GoRoute(
        path: Notification,
        builder: (context, state) => NotificationScreen(),
      ),
      GoRoute(
        path: MedicalHistory,
        builder: (context, state) => HospitalHistory(),
      ),
      GoRoute(
        path: HospitalDetails,
        builder: (context, state) =>
            HospitalDetailsScreen(isAccepted: state.extra as bool),
      ),
      GoRoute(
        path: UnifiledpatientData,
        builder: (context, state) => UnifiedPatientScreen(),
      ),
      GoRoute(path: onBoarding_1, builder: (context, state) => OnBoarding()),
      GoRoute(path: welcom, builder: (context, state) => WelcomeScreen()),
      GoRoute(
        path: login_P,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(
            icon: AppImages.profileWelcom,
            title: 'As Patient',
            subTitle:
                'You can send a request to the hospital for emergency treatment as soon as possible.',
            route: Routes.register_P,
            routeForgetPassword: Routes.login_P,
            
            routeAfterLogin: Routes.Main_patient,
          ),
        ),
      ),
      GoRoute(
        path: login_H,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(
            icon: AppImages.hpspitalWelcom,
            title: 'As Hospital',
            subTitle: 'You can receive emergency request calls.',
            route: Routes.register_H,
                      routeForgetPassword: Routes.login_H,
          
            routeAfterLogin: Routes.Main_hospital,
          ),
        ),
      ),
      GoRoute(
        path: register_P,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: RegesterScreen(
            icon: AppImages.profileWelcom,
            title: 'As Patient',
            subTitle:
                'You can send a request to the hospital for emergency treatment as soon as possible.',
            routeLogin: Routes.login_P,
            routeAfterRegister: Routes.Patient_Step_1,
          ),
        ),
      ),
      GoRoute(
        path: register_H,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: RegesterScreen(
            icon: AppImages.hpspitalWelcom,
            title: 'As Hospital',
            subTitle:
                'You can send a request to the hospital for emergency treatment as soon as possible.',
            routeLogin: Routes.login_H,
            routeAfterRegister: Routes.Hospital_Step_1,
          ),
        ),
      ),
      GoRoute(
        path: Privacy,
        builder: (context, state) => PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: forgetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: ForgetPasswordScreen(route: state.extra as String,)),
      ),
      GoRoute(
        path: forgetPasswordMailSent,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: ForgetPasswordMailSent(email: state.extra as String,)),
      ),
      GoRoute(
        path: Patient_Step_1,
        builder: (context, state) => PatientStep1(),
      ),
      GoRoute(
        path: Patient_Step_2,
        builder: (context, state) => Patient_Step2(),
      ),
      GoRoute(
        path: Patient_Step_3,
        builder: (context, state) => Patient_Step3(),
      ),
      GoRoute(
        path: Hospital_Step_1,
        builder: (context, state) => HospitalStep1(),
      ),
      GoRoute(
        path: Hospital_Step_2,
        builder: (context, state) => Hospital_Step2(),
      ),
      GoRoute(
        path: Hospital_Step_3,
        builder: (context, state) => Hospital_Step3(),
      ),
      GoRoute(
        path: Main_hospital,
        builder: (context, state) => Main_Screen_H(),
      ),
      GoRoute(path: Main_patient, builder: (context, state) => Main_Screen_P()),
      GoRoute(
        path: EditProfile,
        builder: (context, state) => EditProfileScreen(),
      ),
      GoRoute(
        path: ChangePassword,
        builder: (context, state) => ChangePasswordScreen(),
      ),
      GoRoute(path: chat, builder: (context, state) => ChatScreen()),
    ],
  );
}
