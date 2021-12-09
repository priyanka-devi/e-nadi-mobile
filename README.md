

[![Pre-Release](https://github.com/priyanka-devi/e-nadi-mobile/actions/workflows/pre-release.yml/badge.svg)](https://github.com/priyanka-devi/e-nadi-mobile/actions/workflows/pre-release.yml)
[![Release](https://github.com/priyanka-devi/e-nadi-mobile/actions/workflows/release.yml/badge.svg)](https://github.com/priyanka-devi/e-nadi-mobile/actions/workflows/release.yml)


# A05-PBP
Repository untuk projek tengah semester PBP.

Link apk A05 (e-nadi) : https://github.com/priyanka-devi/e-nadi-mobile/releases

## Anggota Kelompok
1. Anisa Maharani - 2006483100
2. Arsyan Amanulloh Insa - 2006487616
3. Daniel Putra Tama Simarmata -  2006521793
4. Hafiz Fadillah Sandi - 2006485964
5. Mahdi Imani Wafi - 2006521093
6. Nadhira Rachma Salsabila Anandra - 2006484974
7. Priyanka Devi -  2006485844
## 🔗 Website Link
Link herokuapp [  https://e-nadi.herokuapp.com/  ]

## 🐱‍💻 Integrasi dengan Web Service
Berikut adalah langkah-langkah yang akan kami lakukan untuk mengintegrasikan aplikasi dengan web server

1. Melengkapi API endpoint pada backend Django menggunakan JsonResponse dari website e-nadi yang sudah dibuat pada project tengah semester.
2. Menerapkan tampilan frontend menggunakan flutter yang disesuaikan dengan web e-nadi untuk mobile device
3. Mengintegrasikan frontend dan backend menggunakan API yang disediakan oleh backend Django

## 🏋️ Brief
Pada pandemi Covid-19 yang terus menyerang penduduk dunia tanpa henti, kesehatan tubuh serta pola hidup sehat merupakan hal esensial yang harus dijaga.  Pola hidup sehat adalah gaya hidup yang memperhatikan segala aspek kondisi kesehatan. Mulai dari makanan, minuman, nutrisi yang dikonsumsi dan perilaku kita sehari- hari. Baik itu dalam sebuah rutinitas olahraga yang tentu akan menjaga kondisi kesehatan dan juga akan menghindarkan kita dari penyakit. Dengan adanya pandemi Covid-19 saat ini banyak masyarakat terpaksa untuk membatasi aktivitas di luar rumah. Pembatasan aktivitas di luar rumah ini mengakibatkan banyak masyarakat tidak melakukan olahraga atau memiliki pola hidup yang buruk. Untuk itu, kami hadir bertujuan untuk membantu dan memantau pola hidup sehat masyarakat dengan cara membuat sebuah aplikasi bagi masyarakat Indonesia berbasis website.

Aplikasi ini membantu pengguna untuk memantau pola hidup sehat. Hal ini dilatarbelakangi pentingnya memperhatikan pola hidup sehat agar pengguna dapat terhindar dari virus COVID-19. Pada aplikasi ini, pengguna dapat mengetahui aktivitas-aktivitas apa saja yang telah dilakukan. Fitur-fitur yang disediakan pada aplikasi diharapkan dapat memotivasi pengguna untuk menjaga kesehatan di masa pandemi seperti saat ini. Aplikasi ini terdiri dari workout tracker, menu makanan sehat, catatan vitamin dan minuman yang dikonsumsi, catatan waktu tidur, dan rangkuman kegiatan.


## 📝 Daftar Modul
- Login User : Halaman ini merupakan implementasi dari proses authentication untuk dapat mengakses beberapa halaman lainnya. Halaman juga memuat form registrasi untuk pengguna yang belum memiliki akun sebelumnya. Setelah pengguna berhasil melewati proses authentication, pengguna dapat mengakses berbagai fitur dalam aplikasi.
- Home Page
- Workout Tracker : Halaman ini mencatat sudah berapa waktu dalam satuan menit pada hari itu user telah berolahraga. User dapat mengupdate dan mereset catatan waktu tersebut. User yang tidak login tidak akan bisa menggunakan fitur ini.
- Sleep Tracker
- Food Recipe : Page ini akan menunjukan card yang berisi informasi terkait resep - resep makanan sehat yang bisa diakses semua pengguna. Pada page ini juga terdapat fitur comments & feedback dimana pengguna dapat meninggalkan komentar serta dapat menghapus komentar yang sudah diposting. Namun untuk memakai fitur tersebut pengguna perlu melakukan login, apabila belum melakukan login, pengguna hanya bisa melihat comment & feedback yang sudah ada.  Modul ini akan mengambil data nama user, tanggal, dan isi komentar suatu user pada web service django. Untuk me-reuse sebuah URL views yang akan dipanggil oleh profile, terdapat suatu method pada views.py yang bertujuan untuk mengirim data dari model get_all_comment (HttpResponse) pada Django dalam format JSON yang nanti akan di fetch dari sisi Flutter.
- Activity Summary : Halaman ini berisi informasi terkait profil pengguna serta rangkuman aktivitas yang mereka lakukan berupa durasi tidur dan olahraga pada suatu hari tertentu. Pada halaman ini, pengguna dapat melihat dan mengubah username, first name, last name, serta email yang telah didaftarkan ketika sign up, serta jenis kelamin, usia, pekerjaan, nomor telepon, dan alamat yang dapat dilengkapi setelah mendaftarkan akun. Untuk mengakses halaman ini, pengguna harus sudah log in. Jika belum, pengguna tidak dapat melihat apa pun pada halaman ini dan akan langsung diarahkan untuk melakukan log in terlebih dahulu. Modul ini akan mengambil data username, first name, last name, email, jenis kelamin, usia, pekerjaan, nomor telepon, dan alamat seorang pengguna dari database django dan menampilkannya pada halaman Activity Summary.
- Healthy Advice : Halaman ini berisi artikel-artikel kesehatan yang dimaksudkan sebagai saran. Artikel-artikel ini diperbaharui secara berkala oleh admin e-nadi. Pengunjung dapat saling berbagi cerita lewat kolom komentar jika sudah log in. Pengunjung yang sudah log in juga bisa mengedit komentar yang sudah diposting atau menghapus komentar tersebut. Pengunjung yang tidak log in tidak dapat menuliskan komentar dan hanya bisa melihat komentar-komentar yang sudah ada.

## 👨‍👩‍👧‍👦 Persona
**1. Udin Deyzel**

Udin merupakan seorang bodybuilder yang berasal dari Indonesia. Udin mempunyai masalah dalam mengatur jadwal tidur dan tracking kegiatan olahraga apa saja yang sudah dia lakukan. Udin percaya dengan mengatur jadwal tidur dan tracking olahraganya, ia akan lebih efektif dalam melakukan olahraga.

Goals :
- Memperbaiki jadwal tidur Udin.
- Melakukan tracking kegiatan olahraga Udin.
- Fokus terhadap objektivitas utama yaitu efektivitas olahraga Udin.

Motivations :
- Membuat monitoring durasi waktu tidur Udin.
- Membuat resep makanan berdasarkan user personalization Udin.

Frustrations :
- Jadwal tidur Udin berantakan.
- Udin tidak dapat melakukan tracking waktu olahraga.
- Udin tidak mengetahui website untuk mendapatkan resep makanan.

**2. Boby Tanaka**

Boby merupakan seorang masyarakat biasa yang ingin memiliki pola hidup sehat sehingga terhindar dari virus COVID-19. Boby ingin makan-makanan yang sehat dan melakukan olahraga secara rutin, namun Boby tidak tahu dimana dia bisa mendapatkan resep makanan sehat sehingga dia tidak memiliki motivasi untuk berolahraga secara rutin. Boby yakin jika ia berolahraga secara rutin, maka ia akan terhindar dari virus COVID-19.

Goals :
- Membantu Boby menentukan kegiatan olahraga yang cocok untuknya.
- Merekomendasikan resep makanan yang sehat untuk Boby.
- Membantu Boby memiliki pola hidup sehat sehingga terhindar dari virus COVID-19.

Motivations :
- Membuat personalization resep makanan untuk Boby berdasarkan preference yang dimilikinya.
- Membuat list kegiatan olahraga yang cocok untuk Boby.
- Menjaga motivasi Boby untuk terus berolahraga.

Frustrations :
- Boby ingin sehat namun ia tidak mengetahui website apa yang dapat membantunya.
- Boby merasa kebingungan dalam mencari resep makanan yang sehat dan enak.
- Boby tidak mengetahui olahraga macam apa yang harus mulai ia lakukan.
