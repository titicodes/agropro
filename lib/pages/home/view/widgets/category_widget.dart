import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);

  final List<String> catImage = [
    "assets/images/abiotic.png",
    "assets/images/agriconomates.png",
    "assets/images/artemia.png",
    "assets/images/check_plant.png"
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
            padding: EdgeInsets.fromLTRB(index == 0 ? 16 : 6, 6,
                index == catImage.length - 1 ? 16 : 0, 6),
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
                Text(
                  catTitles[index], // Title corresponding to the image index
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
