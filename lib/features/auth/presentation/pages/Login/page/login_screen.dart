import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/extentions/show_dialoges.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/services/local/local-helper.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';
import 'package:medigo/features/Patient/data/repo/patient-repo.dart';
import 'package:medigo/features/auth/data/models/user.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-cubit.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-state.dart';

// You need to implement these components
import 'package:medigo/features/auth/presentation/pages/Login/widget/card_login.dart';
import 'package:medigo/features/auth/presentation/pages/Login/widget/curve_card.dart';
import 'package:medigo/features/auth/presentation/widget/card_login__register_with.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.icon,
    required this.subTitle,
    required this.title,
    required this.route,
    required this.routeAfterLogin,
    required this.routeForgetPassword,
  });

  final String icon;
  final String title;
  final String subTitle;
  final String route;
  final String routeAfterLogin;
  final String routeForgetPassword;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    final theme = Theme.of(context);

    // Adaptive colors
    final titleColor = theme.textTheme.headlineSmall?.color ?? Colors.black;
    final subTitleColor = theme.textTheme.bodyLarge?.color ?? Colors.black54;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is AuthSuccessState) {
          if (Navigator.canPop(context)) pop(context);

          if (FirebaseAuth.instance.currentUser!.displayName != null) {
            if (state.userType == UserType.hospital) {
              LocalHelper.setUserId(FirebaseAuth.instance.currentUser!.uid);
              LocalHelper.setUserType('hospital');
              pushAndRemoveUntil(context: context, route: Routes.Main_hospital);
            } else {
              PatientModel? patient = await PatientRepo.getPatientDetails();
              LocalHelper.setUserDataPatient(patient);
              LocalHelper.setUserId(FirebaseAuth.instance.currentUser!.uid);
              LocalHelper.setUserType('patient');
              pushAndRemoveUntil(context: context, route: Routes.Main_patient);
            }
          } else {
            state.userType == UserType.hospital
                ? pushTo(context: context, route: Routes.pageviewHospital)
                : pushTo(context: context, route: Routes.pageviewPatient);
          }
        } else if (state is AuthErrorState) {
          if (Navigator.canPop(context)) pop(context);
          showMyDialog(context, state.error);
        } else if (state is AuthLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: theme.colorScheme.secondary,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: MainAppBar(
          leading: true,
          color: theme.colorScheme.primary,
          colorIconBack: theme.appBarTheme.iconTheme?.color ?? Colors.white,
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                CurveCard(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: theme.brightness == Brightness.dark
                            ? Colors.black45
                            : Colors.grey.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CardLogin(
                    widget: widget,
                    emailController: cubit.emailController,
                    passwordController: cubit.passwordController,
                    routeForgetPassword: widget.routeForgetPassword,
                    titleColor: titleColor,
                    subTitleColor: subTitleColor,
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.login();
                      }
                    },
                  ),
                ),
                CardLoginRegisterWith(
                  widget: widget,
                  title: 'Don\'t have an account?  ',
                  subtitle: 'Sign Up',
                  route: widget.route,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
