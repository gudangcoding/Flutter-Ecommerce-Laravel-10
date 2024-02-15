import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../view/keranjang_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeranjangController extends State<KeranjangView> {
  static late KeranjangController instance;
  late KeranjangView view;

  List<Map<String, dynamic>> cartItems = [
    {'name': 'Item 1', 'price': 10, 'quantity': 1, 'selected': false},
    {'name': 'Item 2', 'price': 20, 'quantity': 1, 'selected': false},
    {'name': 'Item 3', 'price': 30, 'quantity': 1, 'selected': false}
  ];

  @override
  void initState() {
    instance = this;
    super.initState();
    // _loadCartItems();
  }

  // void _loadCartItems() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   String? cartItemsJson = prefs.getString('cartItems');

  //   if (cartItemsJson.isNotEmpty) {
  //     setState(() {
  //       cartItems = jsonDecode(cartItemsJson!).cast<Map<String, dynamic>>();
  //     });
  //   }
  // }

  void _addToCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Simulasi data produk yang akan ditambahkan
    Map<String, dynamic> newProduct = {
      'id': cartItems.length + 1,
      'name': 'Product ${cartItems.length + 1}',
      'price': 20.0,
      'quantity': 1,
      'foto':
          'https://i.ibb.co/dG68KJM/photo-1513104890138-7c749659a591-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg',
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

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  void removeItem(index) {
    cartItems.removeAt(index);
    setState(() {});
  }

  // List<Map<String, dynamic>> cartItems = [];

  bool selectAll = false;
  bool isSelected = false;

  void toggleSelectAll() {
    selectAll = !selectAll;
    for (var item in cartItems) {
      item['selected'] = selectAll;
    }
    setState(() {});
  }

  void ceklis(index, value) {
    setState(() {
      cartItems[index]['selected'] = value;
    });
  }

  void incrementQuantity(int index) {
    cartItems[index]['quantity']++;
    setState(() {});
  }

  void decrementQuantity(int index) {
    if (cartItems[index]['quantity'] > 0) {
      cartItems[index]['quantity']--;
    }
    setState(() {});
  }

  double calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      if (item['selected']) {
        total += (item['price'] ?? 0) * (item['quantity'] ?? 0);
      }
    }
    return total;
  }

  void deleteSelectedProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List selectedProducts =
        cartItems.where((product) => product['selected']).toList();

    if (selectedProducts.isEmpty) {
      // Tampilkan pesan bahwa tidak ada produk yang dipilih
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tidak ada produk yang dipilih untuk dihapus.'),
        ),
      );
    } else {
      // Hapus produk yang dipilih dari daftar
      setState(() {
        cartItems.removeWhere((product) => product['selected']);
      });

      // Simpan daftar terbaru ke shared preferences
      prefs.setString('cartItems', cartItems.toString());

      // Tampilkan pesan bahwa produk telah dihapus
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Produk berhasil dihapus.'),
        ),
      );
    }
  }
}
