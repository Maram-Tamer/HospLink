import 'package:go_router/go_router.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/features/Main/hospital/main_hospital_Screen.dart';
import 'package:medigo/features/Main/patient/main_patient_Screen.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Hospital/page/Hospital_step1.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Hospital/page/Hospital_step2.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Hospital/page/Hospital_step3.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Patient/page/Patient_step1.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Patient/page/Patient_step2.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Patient/page/Patient_step3.dart';
import 'package:medigo/features/auth/presentation/pages/Login/login_screen.dart';
import 'package:medigo/features/auth/presentation/pages/Welcome/page/welcome_screen.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/pages/forget_password_screen.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/pages/otp_verfication_screen.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/pages/reset_password_screen.dart';
import 'package:medigo/features/auth/presentation/pages/privacy%20policy/privacy_policy_screen.dart';
import 'package:medigo/features/auth/presentation/pages/signup/pages/register.dart';
import 'package:medigo/features/chat/chatScreen.dart';
import 'package:medigo/features/onboarding/first_onboarding_screen.dart';
import 'package:medigo/features/onboarding/second_onboarding_screen.dart';
import 'package:medigo/features/onboarding/third_onboarding_screen.dart';
import 'package:medigo/features/search/page/search_screen.dart';
import 'package:medigo/features/splash/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String onBoarding_1 = '/OnBoarding1';
  static const String onBoarding_2 = '/OnBoarding2';
  static const String onBoarding_3 = '/OnBoarding3';
  static const String welcom = '/welcome';
  static const String login_P = '/login-p';
  static const String login_H = '/login-h';
  static const String register_P = '/register-p';
  static const String register_H = '/register-h';
  static const String Privacy = '/privacy';
  static const String forgetPassword = '/forget_password';
  static const String oTP = '/otp';
  static const String resetPassword = '/reset-password';

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
  static final routes = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),
      GoRoute(path: Search, builder: (context, state) => SearchScreen()),
      GoRoute(
        path: onBoarding_1,
        builder: (context, state) => FirstOnboardingScreen(),
      ),
      GoRoute(
        path: onBoarding_2,
        builder: (context, state) => SecondOnboardingScreen(),
      ),
      GoRoute(
        path: onBoarding_3,
        builder: (context, state) => ThirdOnboardingScreen(),
      ),
      GoRoute(path: welcom, builder: (context, state) => WelcomeScreen()),
      GoRoute(
        path: login_P,
        builder: (context, state) => LoginScreen(
          icon: AppImages.profileWelcom,
          title: 'As Patient',
          subTitle:
              'You can send a request to the hospital for emergency treatment as soon as possible.',
          route: Routes.register_P,
          routeAfterLogin: Routes.Main_patient,
        ),
      ),
      GoRoute(
        path: login_H,
        builder: (context, state) => LoginScreen(
          icon: AppImages.hpspitalWelcom,
          title: 'As Hospital',
          subTitle: 'You can receive emergency request calls.',
          route: Routes.register_H,
          routeAfterLogin: Routes.Main_hospital,
        ),
      ),
      GoRoute(
        path: register_P,
        builder: (context, state) => RegesterScreen(
          icon: AppImages.profileWelcom,
          title: 'As Patient',
          subTitle:
              'You can send a request to the hospital for emergency treatment as soon as possible.',
          routeLogin: Routes.login_P,
          routeAfterRegister: Routes.Patient_Step_1,
        ),
      ),
      GoRoute(
        path: register_H,
        builder: (context, state) => RegesterScreen(
          icon: AppImages.hpspitalWelcom,
          title: 'As Hospital',
          subTitle:
              'You can send a request to the hospital for emergency treatment as soon as possible.',
          routeLogin: Routes.login_H,
          routeAfterRegister: Routes.Hospital_Step_1,
        ),
      ),
      GoRoute(
        path: Privacy,
        builder: (context, state) => PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: forgetPassword,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(path: oTP, builder: (context, state) => OtpVerficationScreen()),
      GoRoute(
        path: resetPassword,
        builder: (context, state) => ResetPasswordScreen(),
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
      GoRoute(path: chat, builder: (context, state) => ChatScreen()),
    ],
  );
}
