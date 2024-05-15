                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      import 'package:agropro/pages/base/search/search_vm.dart';
import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/app_images.dart';
import 'package:agropro/utils/constants.dart';
import 'package:agropro/utils/input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
// Import your SearchViewModel class

class Camera extends StatelessWidget {
  Camera({Key? key}) : super(key: key);

  late final TextEditingController searchController = TextEditingController();
  bool showResults = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(), // Provide the view model
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: SingleChildScrollView(
          child: Form(
            child: Stack(
              children: [
                Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    AppImages.demosnapshot, fit: BoxFit.cover,
                    height: 94,
                  ),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Container(width: MediaQuery.of(context).size.width,height: 132,decoration: BoxDecoration(color: AppColor.green),), Container(width: MediaQuery.of(context).size.width,height: 132, decoration: BoxDecoration(color: AppColor.background),)],)
             
              ],
            ),
          ),
        ),
      ),
    );
  }
}
