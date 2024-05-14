// ignore_for_file: must_be_immutable

import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



enum ButtonType { fill, outline, text }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.borderRadius = 0.0,
    this.border,
    this.fontSize = 14.0,
    this.trailingIconSpace = 4.0,
    required this.onPressed,
    this.buttonBgColor = AppColor.green,
    this.buttonTextColor = AppColor.white,
    required this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingIconColor = AppColor.green,
    this.trailingIconColor = AppColor.green,
    this.busy = false,
    this.loadingColor,
    this.disabled,
    this.height,
    this.padding,
    this.loading,
    this.buttonType = ButtonType.fill,
  });

  final double borderRadius;
  final double fontSize;
  final double? height;
  final String title;
  final bool busy;
  final Border? border;
  final Function onPressed;
  final Color buttonBgColor;
  final Color? loadingColor;
  final Color? buttonTextColor;
  final Color? leadingIconColor;
  final Color? trailingIconColor;
  final bool? disabled;
  final ButtonType? buttonType;
  final String? leadingIcon;
  final String? trailingIcon;
  final double trailingIconSpace;
  final EdgeInsets? padding;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        //   border: Border.all(
        //       width: 1,
        //       color: buttonType == ButtonType.fill
        //           ? const Color.fromARGB(255, 0, 0, 0)
        //           : AppColor.green)
      child: MaterialButton(
          elevation: 0,
          minWidth: MediaQuery.of(context).size.width,
          height: height ?? 52.sp,
          onPressed:
              ((disabled != null && disabled!) || loading != null && loading!)
                  ? null
                  : () => onPressed(),
          color: buttonType == ButtonType.outline
              ? AppColor.green
              : buttonType == ButtonType.fill
                  ? buttonBgColor
                  : loading != null && loading!
                      ? Colors.green
                      : buttonBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10.sp,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: loading != null && loading!
                ? customProgressIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (leadingIcon != null)
                        Container(
                          margin: EdgeInsets.only(right: 10.sp),
                          child: Image.asset(
                            leadingIcon!,
                            height: 20.sp,
                            width: 20.sp,
                          ),
                        ),
                      loading != null && loading!
                          ? const AppText('')
                          : AppText(
                              title,
                              size: 15.sp,
                              color: buttonTextColor ?? AppColor.blue,
                              isBold: true,
                            ),
                      if (trailingIcon != null)
                        SizedBox(width: trailingIconSpace),
                      if (trailingIcon != null)
                        Image.asset(
                          trailingIcon!,
                          height: 20.sp,
                          width: 20.sp,
                        ),
                    ],
                  ),
          )),
    );
  }
}
