import 'dart:io';
import 'package:agropro/pages/base/search/search_vm.dart';
import 'package:agropro/utils/app_buttons.dart';
import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/app_images.dart';
import 'package:agropro/utils/constants.dart';
import 'package:agropro/utils/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
// Import your SearchViewModel class

class Profiles extends StatelessWidget {
  Profiles({Key? key}) : super(key: key);
  File? image;

  late final TextEditingController searchController = TextEditingController();
  bool showResults = false;




  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchViewModel>(
      builder: (model) =>  // Provide the view model
      Scaffold(
        backgroundColor: AppColor.background,
        body:
           Form(
            child: ListView(
              children: [
                Container(
                  margin:  EdgeInsets.only(
                      left: 15,
                      top: 40,
                      right: 20
                  ),
                  child: AppText('Profiles', size: 20.sp),

                ),
              ],
            ),
        ),
      ),
    );
  }
}
