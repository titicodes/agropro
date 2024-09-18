import 'dart:io';

import 'package:agropro/pages/base/search/search_vm.dart';
import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/app_images.dart';
import 'package:agropro/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
// Import your SearchViewModel class

class ForumScreen extends StatelessWidget {
  ForumScreen({Key? key}) : super(key: key);
  File? image;

  late final TextEditingController searchController = TextEditingController();
  bool showResults = false;
  List<String> aniimg = [AppImages.guava1, AppImages.guava2];
  int likes = 5;

  @override
  Widget build(BuildContext context) =>
     GetBuilder<SearchViewModel>(
        builder: (model) =>
    // Provide the view model
       Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: AppColor.background,
          title: AppText(
            

            'Forum',
            isBold: true,
            size: 20,
            color: AppColor.green,
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: AppColor.background,
        body: Form(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 0, right: 15),
            child: ListView(
              padding: EdgeInsets.zero,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [],
                ),
                Column(
                  children: List.generate(4, (index) {
                    if (index % 2 == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(8)),
                          width: MediaQuery.of(context).size.width,
                          height: 365,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: ListTile(
                                    leading: Image.asset(AppImages.anietieid,
                                        height: 40),
                                    title: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              'Anietie Sampson',
                                              isBold: true,
                                              size: 12,
                                            ),
                                            AppText(
                                              'Ikot Ekpene, AKS',
                                              size: 11,
                                            )
                                          ],
                                        ),
                                        AppText(
                                          '17 mins',
                                          size: 11,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: AppText(
                                    'Today, I woke to find out that the guava trees in my farm were infested with these. Can someone help me?',
                                    weight: FontWeight.w500,
                                    size: 14,
                                  ),
                                ),
                                const Gap(10),
                                Row(
                                  children: List.generate(
                                      2,
                                      (index) => Padding(
                                            padding: const EdgeInsets.only(
                                                left: 7, right: 7),
                                            child: Container(
                                              height: 145,
                                              width: 145,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8)),
                                              child:
                                                  Image.asset(aniimg[index]),
                                            ),
                                          )),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(8)),
                          width: MediaQuery.of(context).size.width,
                          height: 365,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: ListTile(
                                    leading: Image.asset(AppImages.sandra,
                                        height: 40),
                                    title: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              'Anietie Sampson',
                                              isBold: true,
                                              size: 12,
                                            ),
                                            AppText(
                                              'Ikot Ekpene, AKS',
                                              size: 11,
                                            )
                                          ],
                                        ),
                                        AppText(
                                          '17 mins',
                                          size: 11,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: AppText(
                                    'Despite the heavy downpour lately that has made my beds to be waterlogged, my waterleaves still came out healthy.',
                                    weight: FontWeight.w500,
                                    size: 14,
                                  ),
                                ),
                                const Gap(10),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                                child: Image.asset(AppImages.waterleaf),
                              ),
                                Gap(10.sp),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Row(children: [InkWell(onTap: (){
                                    model.isLiked = !model.isLiked;
                                    model.isLiked ? likes++: likes --;
                                    model.update();
                                  },
                                      child: Icon(Icons.favorite, color: model.isLiked? AppColor.green: AppColor.grey)),
                                    Gap(5.sp),
                                    AppText('${likes}'),Gap(10.sp),
                                    Icon(Icons.comment, color: AppColor.grey,),
                                  Gap(5.sp),
                                  AppText('17')],),
                                  InkWell(onTap: (){
                                    model.isSaved = !model.isSaved;
                                    model.update();
                                  },child: Image.asset(AppImages.saved, color: model.isSaved? AppColor.green: AppColor.grey,))],),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }),
                ),
                Gap(20.sp)
              ],
            ),
          ),
        ),
      ),
  );
}
