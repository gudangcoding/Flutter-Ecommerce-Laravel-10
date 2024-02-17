import 'dart:io';
import 'package:coba1/shared_widget/q_dropdown.dart';
import 'package:coba1/shared_widget/textarea.dart';
import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../controller/profil_controller.dart';
import 'package:image_picker/image_picker.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({Key? key}) : super(key: key);

  Widget build(context, ProfilController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 59, 177, 231),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: const Icon(
              Icons.logout,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => controller.showImagePicker(context),
              child: const Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('assets/no-image.png'),
                  ),
                  CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Color.fromARGB(255, 59, 177, 231),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            QTextField(
              label: "Nama",
              value: controller.nama,
              onChanged: (value) {
                controller.nama = value;
              },
            ),
            const SizedBox(height: 16.0),
            QTextField(
              label: "Email",
              value: controller.email,
              onChanged: (value) {
                controller.email = value;
              },
            ),
            const SizedBox(height: 16.0),
            QTextField(
              label: "No Hp",
              value: controller.nohp,
              onChanged: (value) {
                controller.nohp = value;
              },
            ),
            const SizedBox(height: 16.0),
            QTextField(
              label: "Alamat",
              value: controller.alamat,
              onChanged: (value) {
                controller.alamat = value;
              },
            ),
            const SizedBox(height: 16.0),
            QTextField(
              label: "Password Lama",
              obscure: true,
              value: controller.password_lama,
              onChanged: (value) {
                controller.email = value;
              },
            ),
            const SizedBox(height: 16.0),
            QTextField(
              label: "Password Baaru",
              obscure: true,
              value: controller.password_baru,
              onChanged: (value) {
                controller.email = value;
              },
            ),
            const SizedBox(height: 16.0),
            Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 59, 177, 231),
                ),
                onPressed: () {
                  controller.edit_profil();
                },
                child: const Text(
                  "Update Profil",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<ProfilView> createState() => ProfilController();
}
