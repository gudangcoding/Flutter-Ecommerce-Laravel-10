import 'dart:io';
import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../view/profil_view.dart';
import 'package:image_picker/image_picker.dart';

class ProfilController extends State<ProfilView> {
  static late ProfilController instance;
  late ProfilView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  File? _imageFile;
  final ImagePicker _imagePicker = ImagePicker();

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

  Future<void> _getImage(ImageSource source) async {
    try {
      // final pickedFile = await _imagePicker.getImage(source: source);
      final pickedFile = await _imagePicker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
}
