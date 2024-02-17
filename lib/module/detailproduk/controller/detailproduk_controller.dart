import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../view/detailproduk_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailprodukController extends State<DetailprodukView> {
  static late DetailprodukController instance;
  late DetailprodukView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    if (widget.product != null) {
      gambar = widget.product?['gambar'];
      namabarang = widget.product?['nama_barang'];
      keterangan = widget.product?['keterangan'];
      String? hargaString = widget.product!['harga'].toString();
      harga = double.tryParse(hargaString ?? '');
    }
    print(widget.product);
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? gambar;
  String? namabarang;
  double? harga;
  String? keterangan;

  List<Map<String, dynamic>> cartItems = [];
  bool isLiked = false;
  void kliksuka() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void _addToCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Simulasi data produk yang akan ditambahkan
    Map<String, dynamic> newProduct = {
      'id': cartItems.length + 1,
      'name': 'Product ${cartItems.length + 1}',
      'price': 20.0,
      'quantity': 1,
      'foto': 'path/to/image',
    };

    // Periksa apakah produk dengan ID yang sama sudah ada di dalam keranjang belanja
    int existingProductIndex =
        cartItems.indexWhere((item) => item['id'] == newProduct['id']);

    if (existingProductIndex != -1) {
      // Jika produk sudah ada, tambahkan jumlahnya
      setState(() {
        cartItems[existingProductIndex]['quantity'] += 1;
      });
    } else {
      // Jika produk belum ada, tambahkan produk tersebut ke keranjang belanja
      setState(() {
        cartItems.add(newProduct);
      });
    }

    // Simpan daftar keranjang belanja ke shared preferences
    prefs.setString('cartItems', jsonEncode(cartItems));
  }
}
