import 'dart:convert';
import 'package:coba1/helper/storage.dart';
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
      id = widget.product?['id'];
      gambar = widget.product?['gambar'];
      namabarang = widget.product?['nama_barang'];
      keterangan = widget.product?['keterangan'];
      String? hargaString = widget.product!['harga'].toString();
      harga = double.tryParse(hargaString ?? '');
    }
    print(widget.product);
    loadCartItems();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int? id;
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

  Future<void> loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartJson =
        prefs.getString('cartItems'); // Membaca data dari SharedPreferences
    if (cartJson != null) {
      // Jika data tidak null, konversi menjadi list
      List<dynamic> decodedCart = jsonDecode(cartJson);
      cartItems = decodedCart.cast<Map<String, dynamic>>();
    }
    print(cartItems);
  }

  void addToCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var cartItems = await Storage().get('cartItems');
    // Simulasi data produk yang akan ditambahkan
    Map<String, dynamic> newProduct = {
      'id': id,
      'name': namabarang,
      'price': harga,
      'quantity': 1,
      'foto': gambar,
    };

    // Periksa apakah produk dengan ID yang sama sudah ada di dalam keranjang belanja
    // int existingProductIndex = cartItems.indexWhere((item) => item['id'] == id);
    int existingProductIndex = cartItems.indexWhere((item) => item['id'] == id);
    // print(existingProductIndex);
    // return;
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
    var cart = await Storage().get('cartItems');
    print(cart);
  }
}
