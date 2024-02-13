
import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../controller/daftar_controller.dart';

class DaftarView extends StatefulWidget {
  const DaftarView({Key? key}) : super(key: key);

  Widget build(context, DaftarController controller) {
  controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar"),
        actions: const [],
        ),
        body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
            children: const [],
            ),
        ),
      ),
    );
  }

  @override
  State<DaftarView> createState() => DaftarController();
}
    