import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../view/home_view.dart';
import 'package:coba1/helper/ApiService.dart';

class HomeController extends State<HomeView> {
  static late HomeController instance;
  late HomeView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    getProduk();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  List<Map<String, dynamic>> produk = [];
  getProduk() async {
    Map hasil = await ApiService().get('barang');
    var produkData = hasil['data']['data']['data'];
    setState(() {
      produk = List<Map<String, dynamic>>.from(produkData);
    });
    print(produk);
  }
}
