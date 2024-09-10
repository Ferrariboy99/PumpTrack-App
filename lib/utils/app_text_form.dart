import 'package:flutter/material.dart';
import 'package:pumptrack/styles/colors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.textInputAction,
    required this.labelText,
    required this.keyboardType,
    required this.controller,
    super.key,
    this.onChanged,
    this.validator,
    this.obscureText,
    this.suffixIcon,
    this.onEditingComplete,
    this.autofocus,
    this.focusNode,
  });

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String labelText;
  final bool? autofocus;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        

        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onChanged: onChanged,
        autofocus: autofocus ?? false,
        validator: validator,
        obscureText: obscureText ?? false,
        obscuringCharacter: '*',
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          fillColor: AppColors.dividers.withOpacity(0.2),
          border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.dividers), borderRadius: BorderRadius.circular(10)),

          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.dividers), borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.container), borderRadius: BorderRadius.circular(10)),

          suffixIcon: suffixIcon,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.blackText,
        ),
      ),
    );
  }
}
