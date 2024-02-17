import 'dart:convert';
import 'package:coba1/helper/ApiService.dart';
import 'package:coba1/helper/storage.dart';
import 'package:coba1/shared_widget/info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  //form_key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  final apiService = ApiService();
  final storage = Storage();
// final hasil<String,dynamic> =[];
  // List data = [];
  void cekLogin() async {
    //form_validate
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    final postData = {
      'email': email,
      'password': password,
    };
    Map hasil = await apiService.post('user/login', postData);
    // data = hasil['data'];
    print(hasil['data']['success']);

    Storage().set('user', hasil['data']);
    bool? success = hasil['data']['success'];
    var user = await Storage().get('user');
    // Menampilkan nilai 'user'
    print('Nilai dari "user": $user');
    if (success == true) {
      Get.offAll(const DashboardView());
    } else {
      ReusableInfoDialog.show(
        context: context,
        title: 'Info',
        message: 'Login Gagal, Cek Email atau password.',
      );
    }
    print(success);
  }
}
