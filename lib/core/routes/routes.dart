import 'package:go_router/go_router.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/features/Main/hospital/main_hospital_Screen.dart';
import 'package:medigo/features/Main/patient/main_patient_Screen.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/DetailsSteps.dart';
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
import 'package:medigo/features/onboarding/first_onboarding_screen.dart';
import 'package:medigo/features/onboarding/second_onboarding_screen.dart';
import 'package:medigo/features/onboarding/third_onboarding_screen.dart';
import 'package:medigo/features/splash/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String OnBoarding_1 = '/OnBoarding1';
  static const String OnBoarding_2 = '/OnBoarding2';
  static const String OnBoarding_3 = '/OnBoarding3';
  static const String welcom = '/welcome';
  static const String login_P = '/login-p';
  static const String login_H = '/login-h';
  static const String register_P = '/register-p';
  static const String register_H = '/register-h';
  static const String Privacy = '/privacy';
  static const String forgetPassword = '/forget_password';
  static const String OTP = '/otp';
  static const String ResetPassword = '/reset-password';

  static const String EnerData_P = '/details-p';
  static const String EnerData_H = '/details-h';

  static const String Main_patient = '/main-p';
  static const String Main_hospital = '/main-h';

  static final routes = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),
      GoRoute(
        path: OnBoarding_1,
        builder: (context, state) => FirstOnboardingScreen(),
      ),
      GoRoute(
        path: OnBoarding_2,
        builder: (context, state) => SecondOnboardingScreen(),
      ),
      GoRoute(
        path: OnBoarding_3,
        builder: (context, state) => ThirdOnboardingScreen(),
      ),
      GoRoute(path: welcom, builder: (context, state) => WelcomeScreen()),
      GoRoute(
        path: login_P,
        builder: (context, state) => LoginScreen(
          icon: AppIcons.profileActiveSVG,
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
          icon: AppIcons.hospitalHomeActiveSVG,
          title: 'As Hospital',
          subTitle: 'You can receive emergency request calls.',
          route: Routes.register_H,
          routeAfterLogin: Routes.Main_hospital,
        ),
      ),
      GoRoute(
        path: register_P,
        builder: (context, state) => RegesterScreen(
          icon: AppIcons.profileActiveSVG,
          title: 'As Patient',
          subTitle:
              'You can send a request to the hospital for emergency treatment as soon as possible.',
          routeLogin: Routes.login_P,
          routeAfterRegister: Routes.EnerData_P,
        ),
      ),
      GoRoute(
        path: register_H,
        builder: (context, state) => RegesterScreen(
          icon: AppIcons.hospitalHomeActiveSVG,
          title: 'As Hospital',
          subTitle:
              'You can send a request to the hospital for emergency treatment as soon as possible.',
          routeLogin: Routes.login_H,
          routeAfterRegister: Routes.EnerData_H,
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
      GoRoute(path: OTP, builder: (context, state) => OtpVerficationScreen()),
      GoRoute(
        path: ResetPassword,
        builder: (context, state) => ResetPasswordScreen(),
      ),
      GoRoute(
        path: EnerData_H,
        builder: (context, state) => Enter_UserData(
          steps: [Hospital_Step1(), Hospital_Step2(), Hospital_Step3()],
          title: 'Hospital Details',
          route: Routes.login_H,
        ),
      ),
      GoRoute(
        path: EnerData_P,
        builder: (context, state) => Enter_UserData(
          steps: [Patient_Step1(), Patient_Step2(), Patient_Step3()],
          title: 'Patient Details',
          route: Routes.login_P,
        ),
      ),

      GoRoute(
        path: Main_hospital,
        builder: (context, state) => Main_Screen_H(),
      ),
      GoRoute(path: Main_patient, builder: (context, state) => Main_Screen_P()),
    ],
  );
}
