import 'package:flutter/material.dart';
import 'package:materiapi/controller/kategori_barang_controller.dart';
import 'package:materiapi/view/kategoriBarang/kategori_barang.dart';

class EditKategoriBarang extends StatefulWidget {
  final int? id;
  final String? exname;
  const EditKategoriBarang({super.key, this.id, this.exname});

  @override
  State<EditKategoriBarang> createState() => _EditKategoriBarangState();
}

class _EditKategoriBarangState extends State<EditKategoriBarang> {
  String? nama;
  final kategoriBarangController = KategoriBarangController();

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Kategori Barang'),
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
              initialValue: widget.exname,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama Kategori is required';
                } 
                else if (value == widget.exname) {
                  return 'Nama Kategori tidak boleh sama dengan sebelumnya';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  kategoriBarangController.updateKategoriBarang(widget.id!, nama!);
                  Navigator.pop(context,true);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data Berhasil Diubah'))
                  );
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