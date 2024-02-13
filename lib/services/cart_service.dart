import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCartService {
  List<Map<String, dynamic>> _cartItems = [];
  // List<Map<String, dynamic>> _cartItems = [
  //   {
  //     'id': '1',
  //     'name': 'Item 1',
  //     'price': 10,
  //     'quantity': 1,
  //     'selected': false
  //   },
  //   {
  //     'id': '2',
  //     'name': 'Item 2',
  //     'price': 20,
  //     'quantity': 1,
  //     'selected': false
  //   },
  //   {
  //     'id': '3',
  //     'name': 'Item 3',
  //     'price': 30,
  //     'quantity': 1,
  //     'selected': false
  //   },
  // ];

  Future<void> loadData() async {
    await loadCartItems();
    // setState(() {});
  }

  Future<void> loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartItemsStringList = prefs.getStringList('cartItems');
    if (cartItemsStringList != null) {
      _cartItems = cartItemsStringList
          .map((jsonString) =>
              Map<String, dynamic>.from(json.decode(jsonString)))
          .toList();
    }
  }

  Future<void> saveCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartItemsStringList =
        _cartItems.map((item) => json.encode(item)).toList();
    await prefs.setStringList('cartItems', cartItemsStringList);
  }

  List<Map<String, dynamic>> get cartItems => _cartItems;
  Future<List<Map<String, dynamic>>> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> cartData =
        List<Map<String, dynamic>>.from(_cartItems);
    for (var item in cartData) {
      item['selected'] = prefs.getBool('${item['id']}_selected') ?? false;
      item['quantity'] = prefs.getInt('${item['id']}_quantity') ?? 1;
    }
    return cartData;
  }

  void addCart(Map<String, dynamic> newItem) {
    _cartItems.add(newItem);
    saveCartItems();
  }

  void addItemToCart() {
    Map<String, dynamic> newItem = {
      'id': '4', // Tentukan ID sesuai dengan kebutuhan Anda
      'name': 'New Item', // Nama item baru
      'price': 50, // Harga item baru
      'quantity': 1, // Kuantitas item baru
      'selected': false, // Status seleksi item baru
    };
    addCart(newItem);
    // _shoppingCartService.addCart(newItem);
    // setState(() {});
  }

  Future<void> setData(List<Map<String, dynamic>> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var item in data) {
      await prefs.setBool('${item['id']}_selected', item['selected']);
      await prefs.setInt('${item['id']}_quantity', item['quantity']);
    }
  }

  Future<void> updateById(String id, Map<String, dynamic> newData) async {
    int index = _cartItems.indexWhere((item) => item['id'] == id);
    if (index != -1) {
      _cartItems[index].addAll(newData);
    }
  }

  Future<void> incrementQuantity(String id) async {
    int index = _cartItems.indexWhere((item) => item['id'] == id);
    if (index != -1) {
      _cartItems[index]['quantity']++;
    }
  }

  Future<void> decrementQuantity(String id) async {
    int index = _cartItems.indexWhere((item) => item['id'] == id);
    if (index != -1 && _cartItems[index]['quantity'] > 1) {
      _cartItems[index]['quantity']--;
    }
  }

  double calculate(List<Map<String, dynamic>> data) {
    double total = 0;
    for (var item in data) {
      if (item['selected']) {
        total += item['price'] * item['quantity'];
      }
    }
    return total;
  }

  Future<void> deleteById(String id) async {
    _cartItems.removeWhere((item) => item['id'] == id);
  }
}
