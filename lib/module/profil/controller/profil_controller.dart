import 'dart:convert';
import 'dart:io';
import 'package:coba1/helper/storage.dart';
import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../view/profil_view.dart';
import 'package:image_picker/image_picker.dart';

class ProfilController extends State<ProfilView> {
  static late ProfilController instance;
  late ProfilView view;

  File? imageFile;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    instance = this;
    super.initState();
    getUser();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Future<void> showImagePicker(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Kamera'),
              onTap: () async {
                Navigator.of(context).pop();
                await _getImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Galeri'),
              onTap: () async {
                Navigator.of(context).pop();
                await _getImage(ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );
  }

  String? nama;
  String? email;
  String? alamat;
  String? nohp;
  String? foto;
  String? password_lama;
  String? password_baru;

  void getUser() async {
    try {
      String? jsonString = await Storage().get('user');

      if (jsonString != null) {
        Map<String, dynamic> user = jsonDecode(jsonString);

        setState(() {
          nama = user['name'];
          email = user['email'];
          alamat = user['alamat'];
          nohp = user['nohp'];
          foto = user['foto'];
        });

        // Lakukan sesuatu dengan user
        print(user['id']);
        print(user['name']);
      } else {
        print('Data tidak ditemukan');
      }
    } catch (e) {
      print('Error decoding JSON: $e');
    }
  }

  Future<void> _getImage(ImageSource source) async {
    try {
      // final pickedFile = await _imagePicker.getImage(source: source);
      final pickedFile = await _imagePicker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
        print(imageFile);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void logout() {
    Storage().deleteKey('user');
    Get.offAll(const WelcomeView());
  }

  void edit_profil() {
    print('Profil Diedit');
  }
}
