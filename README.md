# Digicard
Virtual Card Collection
#

# Tugas 7
## statless vs stateful widget dalam flutter
<table>
  <tr>
    <th>statless</th>
    <th>statful</th>
  </tr>
  <tr>
    <td>widget yang tidak memiliki data yang berubah </td>
    <td>widget yang memiliki data yang dapat berubah</td>
  </tr>
  <tr>
    <td>untuk menggambar bagian tampilan UI yang tidak berubah sepanjang masa aplikasi, seperti teks, ikon, gambar, tombol</td>
    <td>ketika perlu mengelola keadaan yang berubah dalam aplikasi, seperti mengubah tampilan berdasarkan input pengguna, atau memperbarui data dari sumber eksternal</td>
  </tr>
  <tr>
  <td>tidak memiliki metode 'setState'</td>
  <td>memiliki metode 'setState'</td>
  </tr>
</table>

## widget yang digunakan
1. `MyHomePage`: kelas yang mewakili halaman utama atau beranda dari aplikasi.
2. `Scaffold`: widget yang memberikan kerangka untuk halaman, termasuk AppBar dan body.
3. `AppBar`: widget di bagian atas halaman yang menampilkan judul aplikasi.
4. `SingleChildScrollView`: widget yang memungkinkan scroll halaman jika sudah melebihi ukuran layar.
5. `Padding`: menambahkan jarak antara konten dengan border.
6. `Column`: widget untuk menampilkan children secara vertikal.
7. `Material`: widget yang memberikan latar belakang warna pada kartu.
8. `InkWell`: widget yang membuat area responsif terhadap sentuhan pengguna.
9. `Container`: widget yang digunakan untuk mengelompokkan ikon dan teks.
10. `Icon`: widget yang menampilkan ikon.
11. `Text`: widget yang menampilkan teks.
12. `MyApp`: kelas yang mewakili aplikasi Flutter dan mewarisi StatelessWidget, yang berarti tidak memiliki keadaan internal yang berubah.
13. `MaterialApp`: widget yang mendefinisikan kerangka dasar untuk aplikasi Flutter.
14. `title`: judul aplikasi yang akan ditampilkan di AppBar atau dalam daftar aplikasi.
15. `ThemeData`: tema aplikasi yang digunakan untuk mengkustomisasi tampilan aplikasi.
16. `ColorScheme`: bagian dari tema dan digunakan untuk mengatur skema warna aplikasi, termasuk warna latar belakang dan teks.

## Pengimplementasian Checklist
### A. Membuat sebuah program Flutter baru dengan tema inventory
1. Install flutter dan requirementnya
2. Buka folder yang akan dijadikan tempat menyimpan aplikasi dan buka command prompt
3. Jalankan kode berikut untuk membuat proyek flutter

```
flutter create digicard
```
4. Untuk menjalankan proyek, jalankan

```
cd digicard
flutter run
```
### B. Membuat tiga tombol sederhana dengan ikon dan teks
1. Merapikan proyek terlebih dahulu
    * Buat file baru bernama `menu.dart` pada folder `digicard/lib` dan tambahkan baris berikut

    ```
    import 'package:flutter/material.dart';
    ```
    * Dari file `main.dart`, cut-paste kode baris ke-39 hingga akhir yang berisi kedua class di bawah ini ke `menu.dart`

    ```
    class MyHomePage ... {
    ...
    }

    class _MyHomePageState ... {
        ...
    }
    ```
    * Tambahkan kode berikut agar class `MyHomePage` dapat dikenali oleh kode dalam file `main.dart`
    
    ```
    import 'package:manageit_mobile/menu.dart';
    ```

2. Membuat widget sederhana
    * Pada `main.dart`, title: 'Flutter Demo Home Page' yang di dalam MyHomePage, sehingga menjadi

    ```
    MyHomePage()
    ```
    * Ubah sifat widget dari stateful menjadi stateless
    
    ```
    class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                ...
            );
        }
    }
    ```
    * Hapus state yang ada di bawah statless widget

3. Buat class baru untuk *define* tipe yang akan berada di list

```
class CardCollection {
  final String name;
  final IconData icon;
  final Color color;

  CardCollection(this.name, this.icon, this.color);
}
```

4. Pada class `MyHomePage` tambahkan list barang

```
final List<CardCollection> items = [
    CardCollection("Lihat Kartu", Icons featured_play_list_rounded, const Color.fromARGB(255, 54, 193, 244)),
    CardCollection("Tambah Kartu", Icons.add_card_rounded, Color.fromARGB(255, 130, 240, 141)),
    CardCollection("Logout", Icons.logout, Color.fromARGB(255, 236, 120, 120)),
  ];
```

5. Tambahkan kode berikut di dalam widget build

```
return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DigiCard',
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
                  'Your Collection of Card', // Text yang menandakan toko
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
                children: items.map((CardCollection item) {
                  // Iterasi untuk setiap item
                  return CardContainer(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
```

6. Buat widget statless baru untuk menampilkan card

```
class CardContainer extends StatelessWidget {
  final CardCollection item;

  const CardContainer(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
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
```

### C. Memunculkan Snackbar dengan tulisan
1. Untuk memunculkan Snackbar ketika tombol ditekan, tambahkan kode berikut pada bagian child di Widget build

```
...
child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(...
...
```

## Bonus
![Bonus](asset/Bonus7.png)
