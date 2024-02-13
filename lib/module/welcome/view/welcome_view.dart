import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../controller/welcome_controller.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  Widget build(context, WelcomeController controller) {
    controller.view = this;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            Image.asset(
              "assets/welcome.png",
              width: 120.0,
              height: 120.0,
              fit: BoxFit.fill,
            ),
            const Text(
              "Selamat Datang",
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            const Text(
              "Di UMKM Shop",
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 59, 177, 231),
                ),
                onPressed: () {
                  Get.to(const LoginView());
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 241, 6, 143),
                ),
                onPressed: () {
                  Get.to(const DaftarView());
                },
                child: const Text(
                  "Daftar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<WelcomeView> createState() => WelcomeController();
}
