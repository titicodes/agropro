import 'package:agropro/pages/market/cart_view.dart';
import 'package:agropro/pages/market/controller/marker_controller.dart';
import 'package:agropro/pages/market/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarketPlacesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(() => CartScreen());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<MarketplaceController>(
              builder: (controller) => DropdownButton<String>(
                value: controller
                    .selectedCategory.value, // Get the selected category
                items: <String>[
                  'All',
                  'Fruits',
                  'Vegetables',
                  'Dairy', // Include Dairy category
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newCategory) {
                  if (newCategory != null) {
                    controller.changeCategory(newCategory);
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<MarketplaceController>(
              builder: (controller) {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (controller.products.isEmpty) {
                  return Center(child: Text('No products available.'));
                }
                return GridView.builder(
                  padding: EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    var product = controller.products[index];
                    return ProductTile(product: product);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
