import 'package:coba1/module/home/widget/card_produk.dart';
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
      appBar: AppBar(
        title: const Text(
          'Halo Naufal',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 59, 177, 231),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(const KeranjangView());
            },
          ),
          // IconButton(
          //   icon: const Icon(
          //     Icons.notifications,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     Get.to(const NotifikasiView());
          //   },
          // ),
        ],
      ),
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
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(width: 16),
                    // InkWell(
                    //   onTap: () => Get.to(const KeranjangView()),
                    //   child: Container(
                    //     child: const Icon(Icons.shopping_cart),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   width: 16.0,
                    // ),
                    // Container(
                    //   child: const Icon(Icons.notifications),
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 6,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                ),
                items: controller.produk.map((item) {
                  return Container(
                    decoration: BoxDecoration(
                      // Gunakan BoxDecoration untuk menetapkan gambar latar belakang
                      image: DecorationImage(
                        image: NetworkImage(
                            item['gambar']), // Ambil URL gambar dari produkhome
                        fit: BoxFit.cover,
                      ),
                    ),
                    // child: /* Widget di tengah jika diperlukan */
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 50.0,
                child: Text(
                  "Produk Terbaru",
                  textAlign: TextAlign.left, // Tambahkan properti textAlign
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: controller.produk.length,
                  itemBuilder: (context, index) {
                    var item = controller.produk[index];
                    return ProductCard(product: item);
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
