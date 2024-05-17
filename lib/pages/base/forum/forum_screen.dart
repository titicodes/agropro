import 'dart:io';

import 'package:agropro/pages/base/search/search_vm.dart';
import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/app_images.dart';
import 'package:agropro/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Import your SearchViewModel class

class ForumScreen extends StatelessWidget {
  ForumScreen({Key? key}) : super(key: key);
  File? image;

  late final TextEditingController searchController = TextEditingController();
  bool showResults = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(), // Provide the view model
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 40, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      AppText(
                        'Forum',
                        isBold: true,
                        size: 20,
                        color: AppColor.green,
                      )
                    ],
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
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: ListTile(
                                      leading: Image.asset(AppImages.anietieid, height: 40),title: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              AppText('Anietie Sampson', isBold: true, size: 12,),
                                              AppText('Ikot Ekpene, AKS', size: 11,)
                                            ],
                                          ),
                                          AppText('17 mins', size: 11,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  const AppText('Today, I woke to find out that the guava trees in my farm were infested with these. Can someone help me?', weight: FontWeight.w500 ,size: 14,), 
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
                            height: 365, child: Padding(padding: EdgeInsets.only(left: 10, right: 10, top: 20),),
                          ),
                        );
                      }
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
