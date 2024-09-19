import 'dart:io';

import 'package:agropro/pages/base/search/diagnose/disease_diagnosed.dart';
import 'package:agropro/pages/base/search/search.dart';
import 'package:agropro/pages/base/search/search_results.dart';
import 'package:agropro/utils/app_buttons.dart';
import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/app_images.dart';
import 'package:agropro/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'widgets/disease_category.dart';

class DiseaseDiagnosView extends StatelessWidget {
  DiseaseDiagnosView({super.key});

  File? image;

  Future<void> pickImage(BuildContext context) async {
    try {
      await requestCameraPermission();
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        if (image != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Search()));
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    titlePadding: const EdgeInsets.symmetric(horizontal: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                    title: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(children: [
                            const Gap(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                child: Image.file(
                                  image!,
                                  fit: BoxFit.cover,
                                )),
                            Gap(15),
                            const AppText(
                              'Please wait for a few minute after submission for the\nresults',
                              weight: FontWeight.w400,
                              size: 11,
                              align: TextAlign.center,
                            ),
                            const Gap(20),
                            AppButton(
                              title: 'Identify',
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.push(context,
                MaterialPageRoute(builder: (context) => DiseaseDiagnosed(this.image)));
                              },
                              width: 205,
                            ),
                            const Gap(20),
                            InkWell(
                                onTap: () {   Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchResults()));},
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(
                                      'Save and Identify later',
                                      size: 12,
                                      color: AppColor.green,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: AppColor.green,
                                      size: 12,
                                    )
                                  ],
                                )),
                            const Gap(20)
                          ]),
                        )),
                  ));
        }
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
    return Builder(builder: (_) {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;

      return Scaffold(
        backgroundColor: AppColor.background,
        body: Padding(
          padding: const EdgeInsets.only(left: 15, top: 20),
          child: ListView(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            children: [
              AppText(
                'Diagnose',
                color: AppColor.green,
                size: 20,
                isBold: true,
              ),
              const SizedBox(
                height: 20.0,
              ),
              _buildActionRow(context),
              _buildCategorySection(context),
              _buildCheckPlantSection(context),
              const SizedBox(
                height: 10.0,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: AppText(
                  'Take photos to find out what is infecting your plants and get treatment tips to get it healthy.',
                  size: 11,
                  weight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              _buildActionButton(context),
              const SizedBox(
                height: 50.0,
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _buildActionRow(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppText(
              "Common Disease",
             isBold: true,
             size: 18,
            ),
            InkWell(
              onTap: () {},
              child: const Row(
                children: [
                  AppText(
                    "See More",
                    size: 12,
                    weight: FontWeight.w500,
                    color: AppColor.green,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColor.green,
                    size: 12,
                  )
                ],
              ),
            )
          ],
        ),
      );

  Widget _buildCategorySection(BuildContext context) => Container(
        height: 200,
        width: double.infinity,
        child: CategoryWidget(),
      );

  Widget _buildCheckPlantSection(contex) => Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white, // Replace with your desired color
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AppImages.checkPlant,
                width: double.infinity,
                height: 222,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ));

  Widget _buildActionButton(BuildContext context) => Center(
        child: AppButton(
          title: 'Diagnose Plant',
          onPressed: () {
            pickImage(context);
         
          },
        ),
      );
}
