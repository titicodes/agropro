import 'package:agropro/pages/base/search/search_vm.dart';
import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/app_images.dart';
import 'package:agropro/utils/constants.dart';
import 'package:agropro/utils/input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);

  late final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              top: 40,
            ),
            child: Consumer<SearchViewModel>(
              builder: (context, model, child) {
                return Column(
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
                                    onTap: () {
                                      // Access view model method
                                     
                                    },
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
                          onTap: () {},
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
                                Image.asset(
                                  AppImages.smapshot,
                                  height: 85,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Center(
                        child: AppText(
                          'Take snapshot',
                          isBold: true,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
