import 'package:agropro/pages/base/search/search_vm.dart';
import 'package:agropro/utils/app_buttons.dart';
import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/app_images.dart';
import 'package:agropro/utils/constants.dart';
import 'package:agropro/utils/input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:provider/provider.dart';
// Import your SearchViewModel class

class PlantIdentification extends StatelessWidget {
  PlantIdentification({Key? key}) : super(key: key);

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
    return GetBuilder<SearchViewModel>(
      builder: (model) =>
       Scaffold(
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
                      Center(
                        child: AppButton(
                          title: 'ok',
                          onPressed: () {

                          },
                          width: 100,
                        ),
                      )
                    ])),
          ),
        ),
      ),
    );
  }
}
