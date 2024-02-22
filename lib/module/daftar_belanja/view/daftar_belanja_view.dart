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
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    Get.to(
                      const PembayaranView(
                        token: '3be25d8b-216b-4bbd-bac0-1e13b15da800',
                        client_key: 'SB-Mid-client-MhvyXioACTyrI6-U',
                      ),
                    );
                  },
                  child: const Text("Checkout"),
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
