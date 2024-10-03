import 'package:flutter/material.dart';
import 'package:pumptrack/utils/app_text_form.dart';

import '../main.dart';
import '../styles/styles.dart';

class AddPump extends StatefulWidget {
  const AddPump({super.key});

  @override
  State<AddPump> createState() => _AddPump();
}

class _AddPump extends State<AddPump> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        backgroundColor: AppColors.background,
        child: Container(
            padding: const EdgeInsets.all(15),
            height: MainApp.screenHeight * 0.5,
            width: MainApp.screenWidth * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                titleContainer('Add Pump'),
                Expanded(child: Column(children: [_getBody()])),
                _submitButton('Submit'),
                const SizedBox(height: 10)
              ],
            )));
  }

  Widget titleContainer(String title) {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 40),
        child: Text(
          title,
          style: TextStyles.headerBlackSub,
        ));
  }

  Widget _getBody() {
    return Column(
      children: [
        _getName('Name'),
        _getDescription('Description'),
        _getLocation('Location')
      ],
    );
  }

  // pump name text field
  Widget _getName(String pumpName) {
    return AppTextFormField(
        textInputAction: TextInputAction.next,
        hintText: pumpName,
        keyboardType: TextInputType.name,
        controller: nameController);
  }

  // pump description text field
  Widget _getDescription(String pumpDescription) {
    return AppTextFormField(
        textInputAction: TextInputAction.next,
        hintText: pumpDescription,
        keyboardType: TextInputType.text,
        controller: descriptionController);
  }

  // pump location text field
  Widget _getLocation(String pumpLocation) {
    return AppTextFormField(
        textInputAction: TextInputAction.done,
        hintText: pumpLocation,
        keyboardType: TextInputType.streetAddress,
        controller: locationController);
  }

  // submit pump button
  Widget _submitButton(String buttonText) {
    return FilledButton(
        onPressed: () {},
        child: Text(buttonText, style: TextStyles.normalWhiteText));
  }
}
