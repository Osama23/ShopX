import 'package:ShopX/controllers/productcontroller.dart';
import 'package:ShopX/views/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // create instance of controller
  // get.put for dependency injection and this will keep your controller on the dependency
  // so in the future if you want to create it again and again

  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'ShopX',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w900),
                ),
              ),
              IconButton(icon: Icon(Icons.view_list_rounded), onPressed: () {}),
              IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            if (productController.isLoading.value)
              return Center(child: CircularProgressIndicator());
            else
              return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: productController.productList.length,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                itemBuilder: (context, index) {
                  return ProductTile(productController.productList[index]);
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              );
          }),
        ),
      ]),
    );
  }
}
