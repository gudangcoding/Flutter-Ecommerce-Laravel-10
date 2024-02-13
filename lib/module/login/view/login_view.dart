import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100.0,
              ),
              Image.asset(
                "assets/welcome.png",
                width: 120.0,
                height: 120.0,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 10.0,
              ),
              QTextField(label: "Email", onChanged: (value) {}),
              QTextField(
                  label: "Password", obscure: true, onChanged: (value) {}),
              Container(
                height: 72,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 59, 177, 231),
                  ),
                  onPressed: () {
                    Get.offAll(const DashboardView());
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Belum punya akun?"),
                  TextButton(
                    onPressed: () {
                      Get.to(const DaftarView());
                    },
                    child: const Text("Klik disini"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
