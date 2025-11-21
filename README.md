# UTS-Mobile2
# JAWABAN TEORI 
**1. Jelaskan bagaimana state management dengan Cubit dapat membantu dalam pengelolaan transaksi yang memiliki logika diskon dinamis**
**Jawaban:**
State management dengan **Cubit** membantu mengelola transaksi yang memiliki logika diskon dinamis karena Cubit memisahkan **logika perhitungan** dari **tampilan UI**. Dengan Cubit, setiap perubahan data (misalnya jumlah item, harga, besaran diskon) akan menghasilkan **state baru** yang otomatis memberi tahu UI untuk memperbarui tampilan.

**Alasan Cubit membantu:**

1. **Logika diskon tidak bercampur dengan UI** → kode lebih bersih.
2. **Perubahan harga atau jumlah item langsung menghitung ulang diskon** → karena Cubit mengemit state baru.
3. **Mudah untuk menambah aturan diskon** (misalnya diskon kategori tertentu, diskon member, diskon kuantitas).
4. **Data transaksi konsisten** karena dikelola pada satu sumber (Cubit).

**Contoh penerapan logika diskon dinamis di Cubit:**
Misal:
* Diskon otomatis 10% bila total transaksi > 100.000.
* Diskon meningkat jadi 20% bila total > 200.000.

Cubit:
dart
void hitungTotal() {
  double total = hitungSubtotal();
  double diskon = 0;

  if (total > 200000) diskon = total * 0.20;
  else if (total > 100000) diskon = total * 0.10;

  emit(state.copyWith(total: total - diskon, diskon: diskon));
}
UI otomatis berubah setiap kali Cubit memproses transaksi.

**2. Apa perbedaan antara diskon per item dan diskon total transaksi? Berikan contoh penerapannya dalam aplikasi kasir**
**Jawaban:**

**A. Diskon Per Item**
Diskon dihitung **pada masing-masing produk**, bukan dari total akhir.

**Ciri-ciri:**
* Setiap item bisa punya diskon berbeda.
* Cocok untuk promo: *“Diskon 20% khusus minuman”, “Diskon Rp 5.000 untuk menu tertentu”*.
* Perhitungan lebih granular.

**Contoh di aplikasi kasir:**
* Ayam Geprek → harga 20.000, diskon 10% → harga menjadi 18.000
* Es Teh → harga 5.000, diskon 30% → harga menjadi 3.500

Total dibayar = 18.000 + 3.500 = **21.500**

**B. Diskon Total Transaksi**
Diskon diberikan setelah semua item dijumlahkan.

**Ciri-ciri:**
* Berlaku untuk seluruh transaksi.
* Contoh promo: *“Diskon 15% minimal belanja 100.000”*.
* Perhitungan hanya dilakukan sekali di akhir.

**Contoh di aplikasi kasir:**
Subtotal = 120.000
Diskon promo 10% = 12.000
Total bayar = **108.000**

**Perbedaan Utama (Ringkas):**

| Diskon Per Item             | Diskon Total Transaksi        |
| --------------------------- | ----------------------------- |
| Berlaku per produk          | Berlaku untuk seluruh total   |
| Bisa berbeda antar item     | Hanya 1 jenis diskon di akhir |
| Lebih detail                | Lebih sederhana               |
| Cocok promo produk tertentu | Cocok promo belanja minimum   |

**3. Jelaskan manfaat penggunaan widget Stack pada tampilan kategori menu di aplikasi Flutter**
**Jawaban:**
Widget **Stack** digunakan untuk menumpuk widget di atas satu sama lain, seperti layer.

**Manfaat Stack dalam tampilan kategori menu:**
**1. Memudahkan membuat tampilan tumpang tindih**
Misalnya kategori “Makanan”, “Minuman”, “Snack” ditampilkan dengan:
* Background gambar
* Label teks di atasnya
* Icon kategori di depan
Semua ditumpuk rapi menggunakan Stack.

**2. Membuat desain lebih menarik dan modern**
Stack memungkinkan tampilan:
* Banner dengan teks di atas gambar
* Elemen dekorasi yang saling overlap
* Kartu kategori dengan efek shadow, label, badge promo

**3. Fleksibel dalam penempatan posisi**
Dengan `Positioned`, elemen bisa ditempatkan bebas:

* label di bawah
* icon di pojok kanan
* harga di pojok kiri

Tanpa Stack, ini sulit dilakukan.

**4. Cocok untuk UI kategori seperti aplikasi restoran / kasir**

Contoh penggunaan:
dart
Stack(
  children: [
    Image.asset('assets/makanan.jpg'),
    Positioned(
      bottom: 10,
      left: 10,
      child: Text("Makanan", style: TextStyle(color: Colors.white)),
    ),
  ],
);
Hasilnya: Gambar kategori dengan teks overlay seperti aplikasi GoFood / ShopeeFood.

## Penjelasan singkat projek
## **Judul Aplikasi**
**Aplikasi Kasir Sederhana dengan Fitur Kategori & Ringkasan Pesanan (Order Summary)**
Menggunakan: **Flutter + Cubit State Management**

## **Deskripsi Singkat Aplikasi**
Pada UTS ini, saya membuat sebuah **aplikasi kasir sederhana** menggunakan Flutter. Aplikasi ini digunakan untuk **menampilkan menu makanan**, **mengelompokkan menu berdasarkan kategori**, serta **mengelola pesanan** yang dipilih oleh pengguna.

Struktur aplikasinya sebagai berikut:
1. **Halaman Kategori (Category Stack Page)**
   Menampilkan daftar kategori seperti Minuman, Makanan, Snack, dll.
   Tampilan dibuat menggunakan **Widget Stack**, sehingga gambar kategori bisa diberi text overlay dan elemen dekorasi.

2. **Halaman Menu / Home Order (Order Home Page)**
   Menampilkan daftar menu yang bisa dipilih.
   Setiap menu ditampilkan menggunakan widget **MenuCard** berisi gambar, nama, dan harga.

3. **Cubit (order_cubit.dart)**
   Mengelola proses penambahan item, pengurangan item, serta perhitungan total.
   Cubit digunakan agar logika transaksi seperti total harga dan jumlah pesanan selalu update otomatis.

4. **Ringkasan Pesanan (Order Summary Page)**
   Menampilkan daftar item yang sudah dipilih dan total pembayarannya.

## **Fungsi Utama Aplikasi yang Dibuat**
1. **Menampilkan kategori menu menggunakan Stack**

   * Gambar kategori
   * Teks nama kategori
   * Tampilan lebih modern & overlay

2. **Pengelolaan pesanan makanan melalui Cubit**

   * Tambah pesanan
   * Kurangi pesanan
   * Hitung total harga secara otomatis

3. **Navigasi antar halaman**

   * Dari Category → Menu
   * Dari Menu → Ringkasan Pesanan

4. **Tampilannya sudah responsif dan simple sesuai ketentuan UTS**.

## **Alasan Penggunaan Cubit dalam Aplikasi**

Cubit digunakan karena:

* Mudah digunakan untuk pemula
* Cocok untuk transaksi yang datanya selalu berubah
* Mengelola state pesanan (jumlah & total) jadi rapi dan tidak campur dengan UI
* Mempermudah menambahkan logika diskon (kalau ditambah di soal UTS)

Contoh logika yang dikelola Cubit:

* Total harga
* Jumlah item
* List pesanan

## **Alasan Penggunaan Widget Stack pada Halaman Kategori**

Widget Stack mempermudah membuat tampilan kategori seperti aplikasi kasir modern:

* Bisa menumpuk gambar + teks + icon
* Lebih estetik
* Membuat kategori terlihat seperti kartu overlay

Contoh:

* Gambar makanan di belakang
* Nama kategori di depan
* Shadow atau warna gelap di bawah text

## **Penjelasan Workflow Aplikasi**

1. User membuka aplikasi → diarahkan ke halaman kategori
2. User memilih kategori → masuk ke halaman menu
3. User memilih item → Cubit menghitung total
4. User membuka ringkasan → melihat seluruh pesanan dan total harga

## **Kesimpulan**

Aplikasi ini adalah **Aplikasi Kasir Sederhana** yang dibangun menggunakan Flutter dan Cubit.
