import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../controller/keranjang_controller.dart';

class KeranjangView extends StatefulWidget {
  const KeranjangView({Key? key}) : super(key: key);

  Widget build(context, KeranjangController controller) {
    controller.view = this;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 59, 177, 231),
        title: const Text("Keranjang"),
        actions: const [],
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: controller.toggleSelectAll,
                  child:
                      Text(controller.selectAll ? 'Uncheck All' : 'Check All'),
                ),
                ElevatedButton(
                  onPressed: controller.deleteSelectedProducts,
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.cartItems[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        item['foto'],
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item['name']),
                      subtitle: Text('Rp ${item['price']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () =>
                                controller.decrementQuantity(index),
                          ),
                          Text('${item['quantity']}'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () =>
                                controller.incrementQuantity(index),
                          ),
                          Checkbox(
                            value: controller.cartItems[index]['selected'] ??
                                false,
                            onChanged: (value) {
                              controller.ceklis(index, value);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: Rp ${controller.calculateTotal().toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 59, 177, 231),
                    ),
                    onPressed: () => controller.checkout(),
                    child: const Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<KeranjangView> createState() => KeranjangController();
}
