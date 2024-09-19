import 'dart:io';
import 'package:agropro/pages/base/search/search_vm.dart';
import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/app_images.dart';
import 'package:agropro/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../utils/widget_extensions.dart';
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
top: 20.sp
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText('Profiles', size: 20.sp, weight: FontWeight.w700, color : AppColor.green),
                        Gap(20.sp),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [Container(height: 80.sp,
                              width: 80.sp,
                              decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(100.r), border: Border.all(
                                    color: AppColor.green)),
                              child: Image.asset(AppImages.anietieid),),
                                Gap(5.sp),
                                AppText('John Doe', size: 16.sp, weight: FontWeight.w700),
                                Gap(5.sp),
                                AppText('johndoe123@example.com', size: 11.sp, weight: FontWeight.w500,),],),
                          ],
                        ),



                      ],
                    ),
                  ),

                ),
                Gap(20.sp),
                Container(height: 36.sp, color: AppColor.white,

                child: Row(
                  children: [
                    Gap(15.sp),
                    AppText('Settings', weight: FontWeight.w600, size: 12.sp,),

                  ],
                ),),
                Gap(10.sp),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Column(children: List.generate(model.settings.length, (index)=>
                  Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                        AppText(model.settings[index], size: 12.sp, weight: FontWeight.w500,),
                        Icon(Icons.arrow_right_rounded, size: 30.sp,)
                      ],),
                      Divider()
                    ],
                  )),),
                ),
                Container(height: 36.sp,width: width(context), color: AppColor.white,
                child: Row(children: [
                  Gap(15.sp),
                  AppText('Support', size: 12.sp, weight: FontWeight.w600,)],),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Column(children: List.generate(model.settings.length, (index)=>
                      Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              AppText(model.support[index], size: 12.sp, weight: FontWeight.w500,),
                              Icon(Icons.arrow_right_rounded, size: 30.sp,)
                            ],),
                          Divider()
                        ],
                      )),),
                ),
                Container(height: 36.sp, color: AppColor.white,
                  child: Row(children: [
                  Gap(15.sp),
                  AppText('Feedback', weight: FontWeight.w600, size: 12.sp,)
                ],),),
                Padding(padding: EdgeInsets.symmetric(horizontal: 15.sp), child: 
                  Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [AppText('Rate the app', size: 12.sp,
                        weight: FontWeight.w500, ),
                        Icon(Icons.arrow_right_rounded, size: 30.sp,)],),
                      Divider()
                    ],
                  ),),
                Row(children: [Gap(15.sp), 
                  AppText('Log out', color: AppColor.errorColor, weight: FontWeight.w600,)
                ],)
              ],
            ),
        ),
      ),
    );
  }
}
