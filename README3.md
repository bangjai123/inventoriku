# Tugas 3 (9)
1.  Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Bisa. Kita dapat mengambil data json dari web service yang sudah ada sebelumnya dan menggunakan layanan seperti Quicktype untuk membuatkan model yang sesuai dengan json yang sudah ada

2. CookieRequest diperlukan dalam proses pertukaran data. Dengan menggunakan CookieRequest, data yang dibagikan dengan menggunakan protokol HTTP diharapkan lebih konsisten dan efisien dalam hal memori dan performa

3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

Dalam konteks tugas ini, yang saya lakukan adalah mengambil data json dari web yang sudah ada dan menggunakannya dalam membuat  di model aplikasi. Akan tetapi, langkah ini sebenarnya tidak harus dilakukan. Langsung membuat modelsnya di flutter saja sebenarnya cukup.

Selanjutnya melakukan pengambilan data dari json. lalu, konversi objek ke JSOn dengan method toJson, serta menggunakan package dart:convert untuk convert antara dart dengan json. Selanjutnya dapat dilakukan dengan memuat data dari luar flutter(opsional) da menampilkannya ke flutter.

4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

menggunakan package provider dan pbp_django_auth. Dimulai dengan menyediakan cookie untuk semua bagian aplikasi dengan menggunakan provider. Dilanjutkan dengan membuat tampilan login pada flutter. Selanjutnya, menghubungkan halaman login yang ada di flutter dengan fungsi autentikasi yang ada di django. Dengan demikian, fungsionalitas login dilakukan di django, dan datanya dikembalikan ke flutter.

5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

Widget yang digunakan pada tugas ini adalah sebagai berikut.
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
   -   Card: digunakan untuk menampung elemen
   -   ListTile: merupakan isi dari kartu

6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

- Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik: 

    menggunakan railway app, serta meminta bantuan orang yang lebih ahli dalam deployment
- Melakukan konfigurasi dan pembuatan file di flutter dan django web yang difetch untuk login

- Membuat halaman login pada flutter dan menempelkan fungsi django agar fungsi loginnya ditangani oleh django

- mengambil data json dari web django dan menggunakan quicktype untuk membuatkan modelnya di flutter

- Menggunakan fungsi show_json pada django untuk mendapatkan semua data item dan menampilkannya di flutter menggunakna widget yang ada

- Menggunakan navigator agar ketika salah satu produk diklik, diarahkan ke halan itemdetail yang telah dibuat sebelumnya.

