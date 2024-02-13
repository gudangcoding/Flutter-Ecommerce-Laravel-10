import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../controller/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   title: const Text(
      //     'Halo Guys',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: Colors.green,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(
      //         Icons.shopping_cart,
      //         color: Colors.white,
      //       ),
      //       onPressed: () {
      //         Get.to(const KeranjangView());
      //       },
      //     ),
      //     IconButton(
      //       icon: const Icon(
      //         Icons.notifications,
      //         color: Colors.white,
      //       ),
      //       onPressed: () {
      //         Get.to(const NotifikasiView());
      //       },
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            top: 20.0,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Form(
                        child: TextFormField(
                          onChanged: (value) {},
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            hintText: "Search product",
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () => Get.to(const KeranjangView()),
                      child: Container(
                        child: const Icon(Icons.shopping_cart),
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Container(
                      child: const Icon(Icons.notifications),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 6,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                ),
                items: [
                  Container(
                    color: Colors.blue,
                    child: const Center(child: Text('Banner 1')),
                  ),
                  Container(
                    color: Colors.green,
                    child: const Center(child: Text('Banner 2')),
                  ),
                  Container(
                    color: Colors.red,
                    child: const Center(child: Text('Banner 3')),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
                child: Text(
                  "Produk Terbaru",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    // var item = controller.products[index];
                    return GridTile(
                      child: GestureDetector(
                        onTap: () => Get.to(const DetailprodukView()),
                        child: Card(
                          child: Center(
                            child: Text(products[index]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}

// Dummy product data
List<String> products = [
  'Product 1',
  'Product 2',
  'Product 3',
  'Product 4',
  'Product 5',
  'Product 6',
  'Product 7',
  'Product 8',
];
