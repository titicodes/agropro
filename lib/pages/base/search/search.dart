import 'dart:io';

import 'package:agropro/pages/base/search/search_vm.dart';
import 'package:agropro/utils/app_buttons.dart';
import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/app_images.dart';
import 'package:agropro/utils/constants.dart';
import 'package:agropro/utils/input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
// Import your SearchViewModel class

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  File? image;

  late final TextEditingController searchController = TextEditingController();
  bool showResults = false;
  Future<void> pickImage(BuildContext context) async {
    try {
      await requestCameraPermission();
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        if (image!= null){  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Search()));
                                                                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      titlePadding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                      insetPadding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      title: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(children: [
                                              const Gap(20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const AppText(
                                                    'Complete identification',
                                                    size: 12,
                                                    isBold: true,
                                                  ),
                                                ],
                                              ),
                                              const Gap(10),
                                              Container(
                                                  height: 145,
                                                  width: 300,
                                                  child: Image.file(image!, fit: BoxFit.cover,)),
                                              Gap(15),
                                              const AppText(
                                                'Please wait for a few minute after submission for the\nresults', weight: FontWeight.w400,
                                                size: 11,
                                                align: TextAlign.center,
                                              ),
                                              const Gap(20),
                                              AppButton(
                                                title: 'Identify',
                                                onPressed: () {},
                                                width: 205,
                                              ),
                                              const Gap(20),
                                              InkWell(
                                                  onTap: () {},
                                                  child: const Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      AppText(
                                                        'Save and Identify later',
                                                        size: 12,
                                                        color: AppColor.green,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        color: AppColor.green,
                                                        size: 12,
                                                      )
                                                    ],
                                                  )),
                                              const Gap(20)
                                            ]),
                                          )),
                                    ));}
        // Use ChangeNotifierProvider.of<SearchViewModel>(context, listen: false).notifyListeners();
        // instead of ChangeNotifier().notifyListeners();
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();
    if (status.isDenied) {
      // Permission was denied
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(), // Provide the view model
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppInputField(
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.inputprefix,
                                height: 24,
                              ),
                            ],
                          ),
                          controller: searchController,
                          hintText: 'Search plant by name',
                        ),
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            AppImages.bgplant,
                            height: 94,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Gap(20),
                                InkWell(
                                  onTap: () {},
                                  child: CircleAvatar(
                                    backgroundColor: AppColor.white,
                                    radius: 20,
                                    child: Image.asset(
                                      AppImages.notifications,
                                      height: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showResults = true;
                        },
                        child: AppText(
                          'Previous results',
                          size: 12,
                          color: AppColor.green,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: AppColor.green,
                      ),
                    ],
                  ),
                  Gap(100),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                AppImages.takesnapshot,
                                height: 252,
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await requestCameraPermission();
                                      await pickImage(context);
                                    },
                                    child: Image.asset(
                                      AppImages.smapshot,
                                      height: 85,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Gap(10),
                      InkWell(
                        onTap: () {},
                        child: Center(
                          child: AppText(
                            'Take snapshot',
                            isBold: true,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
