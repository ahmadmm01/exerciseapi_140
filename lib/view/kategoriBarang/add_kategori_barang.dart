// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:materiapi/controller/kategori_barang_controller.dart';
import '../../model/kategori_barang_model.dart';

class AddKategoriBarang extends StatefulWidget {
  const AddKategoriBarang({super.key});

  @override
  State<AddKategoriBarang> createState() => _AddKategoriBarangState();
}

class _AddKategoriBarangState extends State<AddKategoriBarang> {
  final kategoriBarangController = KategoriBarangController();
  String? nama;

  void AddKategoriBarang() async {
    KategoriBarangModel kategoriBarang = KategoriBarangModel(nama: nama!);
    await kategoriBarangController.addKategoriBarang(kategoriBarang);
  }
  
  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kategori Barang'),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nama Kategori Barang',
                labelText: 'Nama Kategori Barang',
              ),
              onChanged: (value) {
                nama = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama Kategori is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  AddKategoriBarang();
                  Navigator.pop(context,true);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data Berhasil Disimpan')));
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}