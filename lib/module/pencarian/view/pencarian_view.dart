
import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../controller/pencarian_controller.dart';

class PencarianView extends StatefulWidget {
  const PencarianView({Key? key}) : super(key: key);

  Widget build(context, PencarianController controller) {
  controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pencarian"),
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
  State<PencarianView> createState() => PencarianController();
}
    