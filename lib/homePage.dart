import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:badges/badges.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grand_fresh/models/products/products.dart';
import 'package:grand_fresh/productItem.dart';
import 'package:http/http.dart' as http;
import 'categoryItem.dart';
import 'models/categories/categories.dart';
import 'models/categories/category_detail.dart';
import 'models/products/store_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryDetail> categories = [];
  List<StoreProduct> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategories();
    fetchProducts();
    fetchProductsByCategory();
  }

  void fetchCategories() async {
    Categories categoryListResponse = await getCategories();
    setState(() {
      print(categoryListResponse.categoryDetails);
      categories = categoryListResponse.categoryDetails!;
    });
  }

  void fetchProducts() async {
    Products productListResponse = await getStoreProducts();
    setState(() {
      products = productListResponse.storeProducts!;
    });
  }

  void fetchProductsByCategory() async {
    Categories categoryListResponse = await getCategories();
    setState(() {
      // categories = categoryListResponse.categoryDetails!;
    });
  }

  Future<Categories> getCategories() async {
    try {
      Uri uri = Uri.parse(
          "http://yellowstore.hexeam.org/api/customer/store-categories/external");
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var categoryResponse = Categories.fromJson(jsonResponse);
        return categoryResponse;
      } else {
        throw Exception("Error getting categories");
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Products> getStoreProducts() async {
    try {
      var url = Uri.parse(
          'http://yellowstore.hexeam.org/api/customer/store-products/external');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var storeProducts = Products.fromJson(jsonResponse);
        return storeProducts;
      } else {
        throw Exception("Error getting store products");
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Products> getStoreProductsByCategory() async {
    try {
      var url = Uri.parse(
          'http://yellowstore.hexeam.org/api/customer/store-products-by-categories/external');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var storeProductsCategory = Products.fromJson(jsonResponse);
        return storeProductsCategory;
      } else {
        throw Exception("Error getting store products");
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.abc),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Grand Fresh",
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            Text("Chelannur, Kozhikode", style: TextStyle(color: Colors.grey)),
          ],
        ),
        // actions: [ImageIcon(size: 5, AssetImage("assets/images/menu-btn.png"))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                color: Colors.red,
                height: MediaQuery.of(context).size.height / 4,
                child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var category = categories[index];
                      return CategoryItem();
                    }),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent Products",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/1646115445.jpeg"),
                            Text(
                              "Apple",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Text(
                                '₹ 125',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: 2.75,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                                Text(
                                  "(5.00)1",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Products",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    ImageIcon(
                      AssetImage("assets/images/home-all-pdt-icon.png"),
                      size: 15,
                    )
                  ],
                ),
              ),
              GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(products.length, (index) {
                    var storeProduct = products[index];
                    return ProductItem(
                      name: storeProduct.productName.toString(),
                      price: storeProduct.productVarientPrice.toString(),
                    )
                        //  Card(
                        //     color: Colors.orange,
                        //     child: Center(
                        //       child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: <Widget>[
                        //             Expanded(
                        //                 child: Image.asset(
                        //                     storeProduct.productBaseImage!,
                        //                     height: 50.0,
                        //                     width: 50)),
                        //             Text(storeProduct.productName.toString(),
                        //                 style:
                        //                     const TextStyle(color: Colors.blue)),
                        //           ]),
                        //     ))
                        ;
                  }))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon:
                ImageIcon(AssetImage("assets/images/bottom-nav-icon-home.png")),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage("assets/images/bottom-nav-icon-search.png")),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              badgeContent: Text('1'),
              child: ImageIcon(
                  AssetImage("assets/images/bottom-nav-icon-cart.png")),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage("assets/images/bottom-nav-icon-account.png")),
            label: 'Account',
          ),
        ],
      ),
    ));
  }
}
