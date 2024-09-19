import 'package:agropro/data/model/products.dart';
import 'package:agropro/data/services/market_place_service.dart';
import 'package:get/get.dart';

class MarketplaceController extends GetxController {
  var products = <Product>[].obs; // List of products using Product model
  var isLoading = true.obs; // Loading state
  var selectedCategory = 'All'.obs; // The selected category

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  // Fetch products from the local JSON file based on selected category
  void fetchProducts() async {
    isLoading(true); // Set loading state to true
    try {
      var fetchedProducts = await MarketplaceService().fetchProducts();
      if (selectedCategory.value == 'All') {
        products.assignAll(fetchedProducts);
      } else {
        products.assignAll(fetchedProducts.where((product) => product.category == selectedCategory.value).toList());
      }
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
