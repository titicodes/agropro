
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_images.dart';

class SearchViewModel extends GetxController {

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
  List<String> possiblecureimg = [
    AppImages.fungicides,
    AppImages.insectcontrol,
    AppImages.cleantool
  ];
  List<String> possiblecure = ['Fungicides', 'Insect control', 'Clean tools'];
  List<String> settings = ['Change language', 'Notifications', 'Planting guide'];
  List<String> support = ['About Agripro', 'Help Center', 'Terms and Privacy'];

  
bool isLiked = false;
bool isSaved = false;
}