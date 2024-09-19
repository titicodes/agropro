import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MarketplaceController extends GetxController {
  var products = <Map<String, dynamic>>[].obs; // List of products
  var isLoading = true.obs; // Loading state
  var selectedCategory = 'All'.obs; // The selected category

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  // Fetch products from Firestore based on selected category
  void fetchProducts() async {
    isLoading(true); // Set loading state to true
    try {
      QuerySnapshot snapshot;
      if (selectedCategory.value == 'All') {
        snapshot = await FirebaseFirestore.instance.collection('products').get();
      } else {
        snapshot = await FirebaseFirestore.instance
            .collection('products')
            .where('category', isEqualTo: selectedCategory.value)
            .get();
      }
      products.value = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading(false); // Set loading state to false
    }
  }

  // Change the selected category and refetch products
  void changeCategory(String category) {
    selectedCategory.value = category;
    fetchProducts(); // Refetch products based on the new category
  }
}