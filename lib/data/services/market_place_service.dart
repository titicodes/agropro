import 'dart:convert';
import 'package:agropro/data/model/products.dart';
import 'package:flutter/services.dart' show rootBundle;


class MarketplaceService {
  Future<List<Product>> fetchProducts() async {
    // Load JSON file from assets
    final jsonString = await rootBundle.loadString('assets/data/marketplace_data.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((json) => Product.fromJson(json)).toList();
  }
}
