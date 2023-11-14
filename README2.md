# Tugas 2 (8)
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

Navigator.push() bekerja dengan menambahkan halaman baru ke stack navigasi. Hal ini berbeda dengan Navigator.pushReplacement() yang menggantikan halaman saat ini dengan halaman baru pada stack navigasi. Perbedaan tersebut menyebabkan Navigator.push() memungkinkan pengguna untuk kembali ke halaman sebelumnya, sedangkan Navigator.pushReplacement() tidak.

Contoh penggunaan keduanya:
`Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => MyNewPage()),
);`

`Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => MyNewPage()),
);`

Jika contoh yang dimaksud adalah kapan harus menggunakan Navigator.push() atau Navigator.pushReplacement(), perlu diketahui apakah aplikasi memerlukan halaman sebelumnya untuk bertahan atau tidak. Jika iya, Navigator.push() yang digunakan. Jika tidak, Navigator.pushReplacement() yang digunakan.

Sebagai contoh, jika kita membuat halaman form pembelian barang. Dalam halaman tersebut, terdapat tombol untuk melihat katalog. Jika kita tidak ingin progress yang telat dimasukkan sebelumnya hilang, Navigator.push() ke katalog lebih tepat untuk digunakan. Di sisi lain, jika setelah melihat katalog, form kembali kosong dirasa lebih baik, dapat menggunakan Navigator.pushReplacement() ke halaman katalog.

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

    - Container: widget untuk mengelilingi dan memodifikasi tata letak atau tampilan widget lainnya, misalnya padding dan margin.

    - Column: widget yang digunakan menyusun widget-child dalam satu kolom vertikal.

    - Row: widget yang digunakan menyusun widget-child dalam satu baris horizontal.

    - ListView: Pada ListView, widget-child disusun dalam data bergulir. WIdget ini digunakan jika jumlah data atau daftar Item tidak cukup untuk ditampilkan pada layar secara utuh

    - Stack: Stack menyusun widget-child sebagai tumpukan widget

    - widget untuk memenuhi ruang secara maksimal dalam parent widget-nya.

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

    - TextFormField: Widget ini saya gunakan karena saya menginginkan pengguna untuk dapat mengisi form secara bebas (tidak ada pilihan yang disediakan) berupa text. Selain itu, TextFormField memungkinkan adanya validator pada pengambilan input.

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?

clean architecture pada flutter dilakukan dengan cara membagi aplikais menjadi beberapa lapisan untuk memisahkan konsep-konsep yang berbeda.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!

    - Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan dengan berbagai ketentuannya:

        - Membuat file (class) form baru. Dalam projek ini, saya membuat `inventoriku_form.dart`

        - Memasukkan kode di bawah ke dalam filenya

````
import 'package:flutter/material.dart';
import 'package:inventoriku/models/item_model.dart';
import 'package:inventoriku/widgets/left_drawer.dart';

// TODO: Impor drawer yang sudah dibuat sebelumnya

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  int _price = 0;
  String _description = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Item',
          ),
        ),
        backgroundColor: const Color.fromRGBO(103, 152, 152, 100),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      // TODO: Tambahkan drawer yang sudah dibuat di sini
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Name",
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _name = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Name tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Amount",
                  labelText: "Amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                // TODO: Tambahkan variabel yang sesuai
                onChanged: (String? value) {
                  setState(() {
                    _amount = int.parse(value!);
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Amount tidak boleh kosong!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Amount harus berupa angka!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Price",
                  labelText: "Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                // TODO: Tambahkan variabel yang sesuai
                onChanged: (String? value) {
                  setState(() {
                    _price = int.parse(value!);
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Price tidak boleh kosong!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Price harus berupa angka!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Description",
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    // TODO: Tambahkan variabel yang sesuai
                    _description = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Description tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(103, 152, 152, 100)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() {
                        Item baru = Item(_name, _amount, _price, _description);
                        DataItem.data.add(baru);
                      });
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Item berhasil tersimpan'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name: $_name'),
                                  Text('Amount: $_amount'),
                                  Text('Price: $_price'),
                                  Text('Descripstion: $_description')
                                  // TODO: Munculkan value-value lainnya
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                      _formKey.currentState!.reset();
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

````

  - Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama:

    Menambahkan fungsi Navigator.push() ke tombol Tambah Item. hal ini dilakukan dengan memasukkan kode:

````
 if (item.name == "Tambah Item") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));  
}

````
  - Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru:

    Hal ini deilakukan pada kode yang telah diberikan di atas. Lebih spesifik pada bagian:

````
showDialog(
    context: context,
    builder: (context) {
        return AlertDialog(
        title: const Text('Item berhasil tersimpan'),
        content: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text('Name: $_name'),
                Text('Amount: $_amount'),
                Text('Price: $_price'),
                Text('Descripstion: $_description')
            ],
            ),
        ),
        actions: [
            TextButton(
            child: const Text('OK'),
            onPressed: () {
                Navigator.pop(context);
            },
            ),
        ],
        );
    },
);

````
  - Membuat sebuah drawer pada aplikasi dengan ketentuan yang diberikan:

       - Membuat file (class untuk drawer). Dalam projek ini, saya membuat `left_drawer.dart`

       - Mengisi file tersebut dengan
````
import 'package:flutter/material.dart';
import 'package:inventoriku/screen/menu.dart';
import 'package:inventoriku/screen/inventoriku_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(103, 152, 152, 100),
            ),
            child: Column(
              children: [
                Text(
                  'Inventoriku',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Catat Item yang ingin kamu simpan di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShopFormPage()));
              /*
    TODO: Buatlah routing ke ShopFormPage di sini,
    setelah halaman ShopFormPage sudah dibuat.
    */
            },
          ),
        ],
      ),
    );
  }
}

````
Tidak lupa, saya mengimport tiap package di package yang diperlukan

Selain itu, saya juga mengerjakan bonus.


