import 'package:agropro/pages/base/search/camera.dart';
import 'package:agropro/pages/base/search/search.dart';
import 'package:agropro/pages/base/search/search_vm.dart';
import 'package:agropro/utils/app_buttons.dart';
import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/app_images.dart';
import 'package:agropro/utils/constants.dart';
import 'package:agropro/utils/input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
// Import your SearchViewModel class

class CameraScreen extends StatelessWidget {
  CameraScreen({Key? key}) : super(key: key);

  late final TextEditingController searchController = TextEditingController();
  bool showResults = false;
  List<String> status = [
    'Done',
    'Done',
    'Pending',
    'Pending',
    'Pending',
    'Pending',
    'Pending'
  ];
  List<Color> statusColor = [
    AppColor.green,
    AppColor.green,
    AppColor.warningColor,
    AppColor.warningColor,
    AppColor.warningColor,
    AppColor.warningColor,
    AppColor.warningColor
  ];

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
                left: 20,
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
                                const Gap(20),
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
                        child: const AppText(
                          'Previous results',
                          size: 12,
                          color: AppColor.green,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: AppColor.green,
                      ),
                    ],
                  ),
                  const Gap(5),
                  Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.white),
                        height: 602,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Column(
                              children: List.generate(
                                7,
                                (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 27, vertical: 10),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: AppColor.grey)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppText(
                                                'Tomatoes',
                                                size: 14,
                                                weight: FontWeight.w600,
                                                color: AppColor.textColor,
                                              ),
                                              AppText(
                                                '10:24 am',
                                                color: AppColor.textColor,
                                                size: 12,
                                              )
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Row(
                                              children: [
                                                AppText(
                                                  status[index],
                                                  color: statusColor[index],
                                                  weight: FontWeight.w600,
                                                  size: 12,
                                                ),
                                                const Icon(
                                                  Icons.arrow_right_rounded,
                                                  size: 24,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            const Gap(10),
                            const AppText(
                                'click here to take a photo of the plant'),
                            const Gap(10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 27, vertical: 10),
                              child: AppButton(
                                  title: 'Take snapshot',
                                  onPressed: () {
                                    navigationService
                                        .navigateToWidget(Search());
                                  }),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
