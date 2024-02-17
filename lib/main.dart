import 'package:flutter/material.dart';
import 'package:coba1/helper/storage.dart';
import 'package:coba1/module/dashboard/view/dashboard_view.dart';
import 'package:coba1/module/welcome/view/welcome_view.dart';
import 'package:coba1/state_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = const CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await Storage().get('user');
    if (token != null) {
      setState(() {
        page = const DashboardView();
      });
    } else {
      setState(() {
        page = const WelcomeView();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UMKM Shop',
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: page,
    );
  }
}
