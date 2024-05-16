import 'dart:io';

import 'package:agropro/pages/base/search/search_vm.dart';
import 'package:agropro/utils/app_buttons.dart';
import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/app_images.dart';
import 'package:agropro/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
// Import your SearchViewModel class

class DiseaseDiagnosed extends StatelessWidget {
  DiseaseDiagnosed({Key? key}) : super(key: key);

  File? image;
  late final TextEditingController searchController = TextEditingController();
  List<String> srchcategories = [
    'Plant name',
    'Disease detected',
  ];
  List<String> srcrestxt = [
    'Roma tomatoes',
    'Curly top',
  ];
  List<String> srchresimgs = [
    AppImages.photodis1,
    AppImages.photodis2,
    AppImages.photodis3,
    AppImages.photodis4
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(), // Provide the view model
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            child: Stack(
              children: [
                Container(
                  child: Image.asset(
                    AppImages.plantrect2,
                    height: 226,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    const Gap(160),
                    Container(
                      height: 648,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: AppColor.background,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Gap(20),
                            const AppText(
                              'Detection Results',
                              isBold: true,
                              color: AppColor.deepGreen,
                              size: 20,
                            ),
                            const Gap(10),
                            Column(
                              children: List.generate(2, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Container(
                                    height: 38,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: AppColor.lightGreen,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 150,
                                            child: AppText(
                                              srchcategories[index],
                                              weight: FontWeight.w500,
                                            ),
                                          ),
                                          Container(
                                              alignment:
                                                  const Alignment(173, 0),
                                              child: AppText(srcrestxt[index]))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            Gap(20),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  'Description',
                                  isBold: true,
                                  size: 16,
                                ),
                              ],
                            ),
                            Gap(10),
                            const AppText(
                              'Curly top is a viral disease that affects many crops. This disease causes plants to become smaller in size, have shriveled petals and leaves, and are twisted and pulled out of shape. They are often caused by curtoviruses (genus Curtovirus), members of the virus family Geminiviridae. ',
                              size: 12,
                              weight: FontWeight.w400,
                            ),
                            const Gap(15),
                            AppText(
                              'Photo Disease',
                              size: 16,
                              isBold: true,
                            ),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                      4,
                                      (index) => Padding(
                                            padding:
                                                const EdgeInsets.only(right: 4),
                                            child: Container(
                                              height: 100,
                                              width: 105,
                                              child: Image.asset(
                                                srchresimgs[index],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )),
                                )),
                            const Gap(15),
                            AppText(
                              'Possible cure',
                              size: 16,
                              isBold: true,
                            ),
                            Row(
                              children: List.generate(3, (index) {
                                return CircleAvatar(radius: 46,);
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
