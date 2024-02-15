import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../controller/daftar_controller.dart';

class DaftarView extends StatefulWidget {
  const DaftarView({Key? key}) : super(key: key);

  Widget build(context, DaftarController controller) {
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
                height: 60.0,
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
              QTextField(
                label: "nAME",
                onChanged: (value) {},
              ),
              QTextField(
                label: "Email",
                onChanged: (value) {},
              ),
              QTextField(
                label: "Password",
                obscure: true,
                onChanged: (value) {},
              ),
              QTextField(
                label: "cONFIRM Password",
                obscure: true,
                onChanged: (value) {},
              ),
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
                    "Daftar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sudah punya akun?"),
                  TextButton(
                    onPressed: () {
                      Get.to(const LoginView());
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
  State<DaftarView> createState() => DaftarController();
}
