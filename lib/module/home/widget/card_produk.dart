import 'package:coba1/core.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(DetailprodukView(
        product: product,
      )),
      child: Card(
        elevation: 3.0,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product["gambar"],
              height: 120.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product["nama_barang"],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Rp ${product["harga"].toStringAsFixed(0)}'),
                    ],
                  ),
                  const Column(
                    children: [
                      Icon(
                        Icons.add_shopping_cart,
                        size: 24.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
