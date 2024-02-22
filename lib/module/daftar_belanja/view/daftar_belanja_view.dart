import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../controller/daftar_belanja_controller.dart';

class DaftarBelanjaView extends StatefulWidget {
  const DaftarBelanjaView({Key? key}) : super(key: key);

  Widget build(context, DaftarBelanjaController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("DaftarBelanja"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 72,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 79, 170, 216),
                  ),
                  onPressed: () {
                    Get.to(
                      const PembayaranView(
                        token: '',
                        client_key: '',
                      ),
                    );
                  },
                  child: const Text(
                    "Checkout",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DaftarBelanjaView> createState() => DaftarBelanjaController();
}
