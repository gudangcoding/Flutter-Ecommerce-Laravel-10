import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../controller/whistlist_controller.dart';

class WhistlistView extends StatefulWidget {
  const WhistlistView({Key? key}) : super(key: key);

  Widget build(context, WhistlistController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 59, 177, 231),
        title: const Text(
          "Whistlist",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: const [],
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
              hint: "Cari Produk",
            ),
            ListView.builder(
              itemCount: controller.products.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.products[index];
                return InkWell(
                  onTap: () => const DetailprodukView(),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(
                          item["photo"],
                        ),
                      ),
                      title: Text(item["product_name"]),
                      subtitle: Text("${item["price"]}"),
                      trailing: const Icon(Icons.shopping_cart),
                    ),
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
  State<WhistlistView> createState() => WhistlistController();
}
