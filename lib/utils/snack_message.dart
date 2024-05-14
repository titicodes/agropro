
import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/constants.dart';
import 'package:agropro/utils/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:oktoast/oktoast.dart';

Widget toast(String message, {bool? success}) {
  return Align(
    alignment: Alignment.topCenter,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(0.0.r),
      child: FractionallySizedBox(
        widthFactor: 1.0.sp,
        child: Container(
          padding: EdgeInsets.only(
              left: 20.0.sp, top: 40.sp, right: 20.0.sp, bottom: 10.sp),
          decoration: BoxDecoration(
            color: AppColor.white,
            border:
                Border.all(width: 1.sp, color: AppColor.grey.withOpacity(.3)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              !success!
                  ? const AppText(
                      "Warning:",
                      align: TextAlign.left,
                      color: AppColor.red,
                      isBold: true,
                    )
                  : const AppText(
                      "Success:",
                      align: TextAlign.left,
                      color: AppColor.green,
                      isBold: true,
                    ),
              Gap(10.sp),
              Expanded(
                  child: AppText(
                message,
                color: !success ? AppColor.red : AppColor.green,
                size: FontSize.s12,
              )),
            ],
          ),
        ),
      ),
    ),
  );
}

snackBars(String message, {bool success = false, num? time}) {
  showToastWidget(
    toast(message, success: success),
    duration: const Duration(seconds: 4),
    onDismiss: () {},
  );
}
