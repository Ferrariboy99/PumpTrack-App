import 'package:flutter/material.dart';
import 'package:pumptrack/constants/app.dart';
import 'package:pumptrack/constants/routes.dart';
import 'package:pumptrack/main.dart';
import 'package:pumptrack/styles/colors.dart';
import 'package:pumptrack/styles/text_styles.dart';
import 'package:pumptrack/utils/app_text_form.dart';
import 'package:pumptrack/utils/extensions.dart';
import 'package:pumptrack/widgets/app_bar.dart';
import 'package:pumptrack/widgets/divider.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool isObscured = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: getAppBar('Login'),
        body: Container(
            height: MainApp.screenHeight,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: _buildBodyContainer())));
  }

  // return app bar
  PreferredSizeWidget getAppBar(String title) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(54),
        child: CustomAppBar(
            iconThemeColor: AppColors.blackText,
            title: title,
            centerTile: true,
            titleColor: AppColors.blackText,
            appBarColor: AppColors.background));
  }

// return body container
  Widget _buildBodyContainer() {
    return Form(
        key: _formKey,
        child: Column(children: [
          logoContainer(),
          signInContainer('Sign in with Google'),
          const SizedBox(height: 20),
          signInRow(' or sign in with '),
          const SizedBox(height: 20),
          _getEmailField(),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
                onPressed: () {},
                child: Text('Forgot Password',
                    style: TextStyle(color: AppColors.blue)))
          ]),
          _getPasswordField(),
          Row(
            children: [
              _getCheckbox(),
              const Flexible(
                  child: Text(
                'Keep me signed in',
              ))
            ],
          ),
          _getSignInButton('Login'),
          haveAnAccountContainer("Don't have an account?", 'Sign Up', 0),
        ]));
  }

  // email appField
  Widget _getEmailField() {
    return AppTextFormField(
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        _formKey.currentState?.validate();
      },
      validator: (value) {
        return value!.isEmpty
            ? null
            : AppConstants.emailRegex.hasMatch(value)
                ? null
                : 'Invalid Email Address';
      },
      controller: emailController,
    );
  }

  // password field
  Widget _getPasswordField() {
    return AppTextFormField(
      hintText: 'Password',
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      onChanged: (value) {
        _formKey.currentState?.validate();
      },
      validator: (value) {
        return value!.isEmpty
            ? null
            : AppConstants.passwordRegex.hasMatch(value)
                ? null
                : null;
      },
      controller: passwordController,
      obscureText: isObscured,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: IconButton(
          onPressed: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              const Size(48, 48),
            ),
          ),
          icon: Icon(
            isObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }

  // return checkbox
  Widget _getCheckbox() {
    return Checkbox(
        value: false,
        onChanged: (value) {
          setState(() {
            value = value;
          });
        });
  }

  // sign in button
  Widget _getSignInButton(String text) {
    return FilledButton(
        onPressed: () {
          AppRoutes.bottomNav.pushName();
        },
        child: Text(text));
  }
}

// logo container
Widget logoContainer() {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: const Icon(Icons.image, size: 100));
}

// call getGoogleSign container
Widget signInContainer(String text) {
  return getGoogleSignIn(Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
    ],
  ));
}

Widget signInRow(String text) {
  return Row(
    children: [
      const CustomDivider(),
      Text(
        text,
        style: TextStyles.normalBlackText,
      ),
      const CustomDivider()
    ],
  );
}

// return google sign in container
Widget getGoogleSignIn(Widget child) {
  return Container(
    height: 45,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: AppColors.dividers, borderRadius: BorderRadius.circular(10)),
    child: child,
  );
}

// have an account container
Widget haveAnAccountContainer(String question, String action, int key) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(question),
      TextButton(
          onPressed: () {
            switch (key) {
              case 0:
                AppRoutes.signUp.pushName();
                break;
              case 1:
                AppRoutes.login.pushName();
                break;
            }
          },
          child: Text(action))
    ],
  );
}
