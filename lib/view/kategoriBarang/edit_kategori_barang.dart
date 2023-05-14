import 'package:flutter/material.dart';
import 'package:materiapi/view/kategoriBarang/kategori_barang.dart';

class EditKategoriBarang extends StatefulWidget {
  const EditKategoriBarang({super.key});

  @override
  State<EditKategoriBarang> createState() => _EditKategoriBarangState();
}

class _EditKategoriBarangState extends State<EditKategoriBarang> {
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
              onChanged: (value) {},
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
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KategoriBarang(),
                    )
                  );
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