import 'package:ShopX/models/product.dart';
import 'package:ShopX/services/remote_services.dart';
import 'package:get/state_manager.dart';

// what we need inside our controller is the items which are going to bind to the ui
class ProductController extends GetxController {
  // .obs makes it observable which means
  // anytime the data change it will automatically reflect on the ui
  var productList = List<Product>().obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
