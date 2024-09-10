import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pumptrack/constants/app.dart';
import 'package:pumptrack/constants/routes.dart';
import 'package:pumptrack/main.dart';
import 'package:pumptrack/screens/login.dart';
import 'package:pumptrack/styles/colors.dart';
import 'package:pumptrack/utils/app_text_form.dart';
import 'package:pumptrack/utils/extensions.dart';
import 'package:pumptrack/widgets/app_bar.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool isObscured = true;
  bool isConfirmPasswordObscure = true;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _getAppBar('SignUp'),
      body: Container(
        height: MainApp.screenHeight,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(child: _buildBodyContainer()),
      ),
    );
  }

  // body container
  Widget _buildBodyContainer() {
    return Form(
        key: _formKey,
        child: Column(children: [
          logoContainer(),
          signInContainer('Sign up with Google'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: signInRow(' or sign up with '),
          ),
          _getFullName(),
          _getEmail(),
          _getPassword(),
          _getConfirmPassword(),
          acceptPolicy(),
          const SizedBox(height: 20),
          signUpBottom(),
          haveAnAccountContainer('Already have an account?', 'Log In', 1)
        ]));
  }

  // app bar
  PreferredSizeWidget _getAppBar(String title) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(54),
      child: CustomAppBar(
          title: title,
          centerTile: true,
          titleColor: AppColors.blackText,
          appBarColor: AppColors.background),
    );
  }

  // full name app field
  Widget _getFullName() {
    return AppTextFormField(
      controller: fullNameController,
      textInputAction: TextInputAction.next,
      labelText: 'FullName',
      keyboardType: TextInputType.name,
      onChanged: (value) {
        _formKey.currentState?.validate();
      },
      validator: (value) {
        return value!.isEmpty
            ? null
            : value.toString().length > 4
                ? null
                : 'Invalid full name';
      },
    );
  }

  // email app field
  Widget _getEmail() {
    return AppTextFormField(
      labelText: 'Email',
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

  // password app field
  Widget _getPassword() {
    return AppTextFormField(
      labelText: 'Password',
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      onChanged: (_) => _formKey.currentState?.validate(),
      validator: (value) {
        return value!.isEmpty
            ? null
            : AppConstants.passwordRegex.hasMatch(value)
                ? null
                : 'Your password should contain at least:\nOne lowercase[a-z] and uppercase[A-Z] letter\nOne number[0-9]\nOne special character(#,%,*, etc)\nBe 8 characters or longer';
      },
      controller: passwordController,
      obscureText: isObscured,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Focus(
          descendantsAreFocusable: false,
          child: IconButton(
            onPressed: () => setState(() {
              isObscured = !isObscured;
            }),
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
      ),
    );
  }

  // confirm password app field
  Widget _getConfirmPassword() {
    return AppTextFormField(
      labelText: 'Confirm Password',
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      onChanged: (value) {
        _formKey.currentState?.validate();
      },
      validator: (value) {
        return value!.isEmpty
            ? null
            : AppConstants.passwordRegex.hasMatch(value)
                ? passwordController.text == confirmPasswordController.text
                    ? null
                    : "Passwords don't match"
                : "Passwords don't match";
      },
      controller: confirmPasswordController,
      obscureText: isConfirmPasswordObscure,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Focus(
          descendantsAreFocusable: false,
          child: IconButton(
            onPressed: () {
              setState(() {
                isConfirmPasswordObscure = !isConfirmPasswordObscure;
              });
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                const Size(48, 48),
              ),
            ),
            icon: Icon(
              isConfirmPasswordObscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }

  // accept policies
  Widget acceptPolicy() {
    return Row(
      children: [
        getCheckbox(),
        const Flexible(
            child: Text(
                "By creating an account, I accept PumpTrack's policies and terms of use"))
      ],
    );
  }

  Widget getCheckbox() {
    return Checkbox(
        value: false,
        onChanged: (value) {
          setState(() {});
        });
  }

  Widget signUpBottom() {
    return FilledButton(
        onPressed: () {
          AppRoutes.login.pushName();
        },
        child: const Text('Sign Up'));
  }
}
