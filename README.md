# Tugas 1
1. stateless widget adalah widget yang tidak dapat berubah setelah dibuat (selama aplikasi berjalan). Hal ini berarti untuk mengubah stateless widget hanya dapat diubah dengan mengubah programnya. Di sisi lain, stateful widget adalah widget yang dapat diperbarui sesuai jalanya aplikasi. Hal ini berarti apabila terjadi event tertentu seperti klik, widget dapat memperbarui tampilannya.
   
2. Widget yang digunakan pada tugas ini adalah sebagai berikut.
   -   MaterialApp: untuk konfigurasi aplikasi
   -   MyApp: root dari aplikasi
   -   MyHomePage: halaman utama aplikasi
   -   Scaffold: struktur dasar aplikasi, termasuk AppBar, body, dsb
   -   AppBar: judul aplikasi pada bagian atas
   -   SingleChiledScrollView: agar konten dapat di dalamnya dapat discroll
   -   Column: menyusun widgetnya secara vertikal
   -   GridView.count: menampilkan item-item dalam bentuk grid
   -   ShopItem: model data untuk menyimpan item di toko
   -   ShopCard: untuk menampilkan kartu tiap item di toko
   -   Material: untuk memberi latar belakang desain material pada widget
   -   InkWell: menambahkan respons terhadap sentuhan pada widget
   -   Container: digunakan untuk menyusun widget dan memberikan padding
   -   Icon: untuk menampilkan ikon
   -   Text: untuk menampilkan text
   -   Padding: untuk menambahkan padding pada sekitar widget
     
3. Implementasi checklist:
   - Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya:
     1. membuat direktori baru di local
     2. membuat repo github, melakukan `git init`, dan menghubungkan direktori local dengan github
     3. jalankan perintah `flutter create inventoriku`
   - Membuat tiga tombol sederhana dengan ikon dan teks untuk melihat item, tambah item, logout:
     1.  membuat file `menu.dart` pada direktori `inventoriku\lib`
     2.  Memasukkan kode di bawah ini
 ````
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist,
        const Color.fromRGBO(152, 152, 103, 100)),
    ShopItem("Tambah Item", Icons.add_shopping_cart,
        const Color.fromRGBO(103, 152, 152, 100)),
    ShopItem("Logout", Icons.logout, const Color.fromRGBO(152, 103, 152, 100)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inventoriku',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Inventoriku', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopItem {
  final String name;
  final IconData icon;
  final Color warna;

  ShopItem(this.name, this.icon, this.warna);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.warna,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

````
         3. Memunculkan Snackbar:
            - Sudah dimunculkan pada kode di atas melalui
````
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
````
        4. Menjawab pertanyaan readme
        5. Melakukan Melakukan `add-commit-push` ke GitHub
