import 'dart:io';

import 'package:agropro/pages/base/search/search_vm.dart';
import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/app_images.dart';
import 'package:agropro/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
// Import your SearchViewModel class

class DiseaseDiagnosed extends StatelessWidget {
  DiseaseDiagnosed(File? image, {Key? key}) : super(key: key);

  File? image;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchViewModel>(
      builder: (model) =>  Scaffold(
        body: SingleChildScrollView(
          child: Form(
            child: Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      child: Stack(
                        children: [
                          Image.asset(AppImages.plantrect2,
                              height: 226,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width),
                        ],
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
                            child: SingleChildScrollView(
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
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Container(
                                          height: 38,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: AppColor.lightGreen,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 150,
                                                  child: AppText(
                                                    model.srchcategories[index],
                                                    weight: FontWeight.w500,
                                                  ),
                                                ),
                                                Container(
                                                    alignment:
                                                        const Alignment(173, 0),
                                                    child: AppText(
                                                        model.srcrestxt[index]))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  const Gap(20),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        'Description',
                                        isBold: true,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  const Gap(10),
                                  const AppText(
                                    'Curly top is a viral disease that affects many crops. This disease causes plants to become smaller in size, have shriveled petals and leaves, and are twisted and pulled out of shape. They are often caused by curtoviruses (genus Curtovirus), members of the virus family Geminiviridae. ',
                                    size: 12,
                                    weight: FontWeight.w400,
                                  ),
                                  const Gap(15),
                                  const Row(
                                    children: [
                                      AppText(
                                        'Photo Disease',
                                        size: 16,
                                        isBold: true,
                                      ),
                                    ],
                                  ),
                                  const Gap(10),
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: List.generate(
                                            4,
                                            (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 4),
                                                  child: Container(
                                                    height: 100,
                                                    width: 105,
                                                    child: Image.asset(
                                                      model.srchresimgs[index],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                )),
                                      )),
                                  const Gap(15),
                                  const Row(
                                    children: [
                                      AppText(
                                        'Possible cure',
                                        size: 16,
                                        isBold: true,
                                      ),
                                      Gap(10),
                                    ],
                                  ),
                                  const AppText(
                                      "The BLH has a piercing-sucking feeding habit; thus, the virus is spread or injected from the insect's salivary gland into its new host as the insect pierces and feeds on non-infected plants. Virus-infected plants cannot be treated and should be removed."),
                                  const Gap(20),
                                  const Row(
                                    children: [
                                      AppText(
                                        'Prevention',
                                        size: 16,
                                        isBold: true,
                                      ),
                                    ],
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(3, (index) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: CircleAvatar(
                                                radius: 46,
                                                child: Image.asset(
                                                    model.possiblecureimg[index]),
                                              ),
                                            ),
                                            const Gap(10),
                                            AppText(
                                              model.possiblecure[index],
                                              weight: FontWeight.w700,
                                              size: 11,
                                            ),
                                            const Gap(30),
                                          ],
                                        );
                                      }),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                    top: 15,
                    left: 10,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_left_rounded,
                          size: 50,
                          color: AppColor.lightGreen,
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
