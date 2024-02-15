import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../controller/transaksi_controller.dart';

class TransaksiView extends StatefulWidget {
  const TransaksiView({Key? key}) : super(key: key);

  Widget build(context, TransaksiController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 59, 177, 231),
        title: const Text(
          'Transaksi History',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        controller: ScrollController(),
        child: Column(
          children: [
            QTextField(
              label: "",
              onChanged: (value) {},
              suffixIcon: Icons.search,
              hint: "Cari Transaksi",
            ),
            ListView.builder(
              itemCount: controller.produks.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.produks[index];
                return Card(
                  child: ListTile(
                    title: const Text("No Invoice : 123"),
                    subtitle: Text("Tanggal : ${item["price"]}"),
                    trailing: const Text("Selesai"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<TransaksiView> createState() => TransaksiController();
}

final List<Map<String, dynamic>> produk = [
  {
    'name': 'Product 1',
    'imageUrl':
        'https://i.ibb.co/dG68KJM/photo-1513104890138-7c749659a591-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg',
    'price': 19.99,
  },
  {
    'name': 'Product 2',
    'imageUrl':
        'https://i.ibb.co/mHtmhmP/photo-1521305916504-4a1121188589-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg',
    'price': 29.99,
  },
  {
    'name': 'Product 3',
    'imageUrl':
        'https://images.unsplash.com/photo-1625869016774-3a92be2ae2cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    'price': 39.99,
  },
  {
    'name': 'Product 4',
    'imageUrl':
        'https://images.unsplash.com/photo-1578160112054-954a67602b88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
    'price': 49.99,
  },
  // Add more produks as needed
];
