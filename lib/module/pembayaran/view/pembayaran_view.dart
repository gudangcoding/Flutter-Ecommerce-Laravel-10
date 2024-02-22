import 'package:flutter/material.dart';
import 'package:midtrans_snap/midtrans_snap.dart';
import 'package:midtrans_snap/models.dart';
import 'package:coba1/core.dart';
import '../controller/pembayaran_controller.dart';

class PembayaranView extends StatefulWidget {
  final String token;
  final String client_key;
  const PembayaranView({
    Key? key,
    required this.token,
    required this.client_key,
  }) : super(key: key);

  Widget build(context, PembayaranController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pembayaran"),
        actions: const [],
      ),
      body: MidtransSnap(
        mode: MidtransEnvironment.sandbox,
        token: '3be25d8b-216b-4bbd-bac0-1e13b15da800',
        midtransClientKey: 'SB-Mid-client-MhvyXioACTyrI6-U',
        onPageFinished: (url) {
          print(url);
        },
        onPageStarted: (url) {
          print(url);
        },
        onResponse: (result) {
          print(result.toJson());
        },
      ),
    );
  }

  @override
  State<PembayaranView> createState() => PembayaranController();
}
