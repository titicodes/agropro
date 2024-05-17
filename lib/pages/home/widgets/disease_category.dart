import 'package:agropro/utils/app_images.dart';
import 'package:agropro/utils/constants.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});

  final List<String> catImage = [
    AppImages.abiotic,
    AppImages.alternaria,
    AppImages.agrico,
    AppImages.checkPlant
  ];

  final List<String> catTitles = [
    "Abiotic",
    "Agriconomates",
    "Artemia",
    "Check Plant"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catImage.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.white, // Replace with your desired color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      catImage[index],
                      width: 120,
                      height: 122,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                    height: 8), // Adjust spacing between image and text
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: AppText(
                    size: 11,
                    catTitles[index], // Title corresponding to the image index
                    isBold: true, 
                                   ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
