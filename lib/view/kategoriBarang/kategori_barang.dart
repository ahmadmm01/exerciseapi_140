import 'package:flutter/material.dart';
import 'package:materiapi/controller/kategori_barang_controller.dart';
import 'package:materiapi/model/kategori_barang_model.dart';
import 'package:materiapi/view/kategoriBarang/add_kategori_barang.dart';
import 'package:materiapi/view/kategoriBarang/edit_kategori_barang.dart';

class KategoriBarang extends StatefulWidget {
  const KategoriBarang({super.key});

  @override
  State<KategoriBarang> createState() => _KategoriBarangState();
}

class _KategoriBarangState extends State<KategoriBarang> {
  final kategoriBarangController = KategoriBarangController();
  List<KategoriBarangModel> listKategoriBarang = [];

  @override
  void initState() {
    getKategoriBarang();
    super.initState();
  }

  void getKategoriBarang() async {
    final kategoriBarang = await kategoriBarangController.getKategoriBarang();
    setState(() {
      listKategoriBarang = kategoriBarang;
    });
  }

  void deleteKategoriBarang(int id) async {
    await kategoriBarangController.deleteKategoriBarang(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Barang'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: listKategoriBarang.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(listKategoriBarang[index].nama),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => EditKategoriBarang(
                              exname: listKategoriBarang[index].nama,
                              id: listKategoriBarang[index].id
                            )
                          )
                        );
                        if (result != null && result) {
                          getKategoriBarang();
                          setState(() {});
                        }
                      },
                      icon: const Icon(Icons.edit)
                    ),
                    IconButton(
                      onPressed:() {
                        deleteKategoriBarang(listKategoriBarang[index].id);
                        setState(() {
                          listKategoriBarang.removeAt(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data Berhasil Dihapus')
                            )
                          );
                        });
                      },
                      icon: const Icon(Icons.delete)
                    )
                  ],
                ),
              ),
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  const AddKategoriBarang())
          );
          if (result != null && result) {
            getKategoriBarang();
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}