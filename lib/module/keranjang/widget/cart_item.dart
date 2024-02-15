import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          'https://example.com/your_image_url.jpg',
          width: 50.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
        title: const Text('Nama Produk'),
        subtitle: const Text('\$20.00'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                // Tambahkan logika pengurangan produk di sini
                print('Kurangi produk');
              },
            ),
            const Text('1'), // Ganti dengan jumlah produk yang sesuai
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Tambahkan logika penambahan produk di sini
                print('Tambah produk');
              },
            ),
            Checkbox(
              value: false, // Ganti dengan nilai sesuai kebutuhan
              onChanged: (value) {
                // Tambahkan logika ketika checkbox diubah
                print('Checkbox diubah menjadi: $value');
              },
            ),
          ],
        ),
      ),
    );
  }
}
