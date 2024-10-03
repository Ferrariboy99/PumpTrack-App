import 'package:flutter/material.dart';
import 'package:pumptrack/constants/icons.dart';
import '../constants/texts.dart';
import '../styles/styles.dart';
import '../widgets/app_bar.dart';
import 'screens.dart';

class Pumps extends StatelessWidget {
  const Pumps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AddPump();
              });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: AppColors.darkBlue,
        child: Icon(
          AppIcons.addIcon,
          color: AppColors.white,
        ),
      ),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(54),
          child: CustomAppBar(
              title: 'Pumps',
              centerTile: true,
              titleColor: AppColors.white,
              appBarColor: AppColors.darkBlue,
              iconThemeColor: AppColors.blackText)),
      body: bodyContent(),
    );
  }

  // body with more details
  Widget bodyContent() {
    return Container(
      width: double.infinity,
      color: AppColors.dividers,
      padding: const EdgeInsetsDirectional.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Flexible(child: getPumps())],
      ),
    );
  }

  // get pumps
  Widget getPumps() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
            color: AppColors.white,
            elevation: 0,
            child: ListTile(
              onTap: () {
                displayTableDetails(
                    context,
                    AppTexts.mockPumpNames[index],
                    AppTexts.mockPumpDescriptions[index],
                    AppTexts.mockPumpLocations[index]);
              },
              title: Text(AppTexts.mockPumpNames[index]),
              subtitle: Text(
                AppTexts.mockPumpDescriptions[index],
                style: TextStyle(color: AppColors.grey),
              ),
              trailing: Text(AppTexts.mockPumpLocations[index]),
            ));
      },
      itemCount: AppTexts.mockPumpNames.length,
    );
  }
}
