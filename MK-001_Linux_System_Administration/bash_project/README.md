# 🐚 Bash Scripting & Automation - Master Cheatsheet

> **Role:** DevOps Engineer Student
> **Focus:** Scripting Logic, Automation, & Linux Administration
> **Status:** 🚀 Learning in Progress

Dokumen ini adalah rangkuman teknis ("Cheat Sheet") dari materi Bash Scripting. Panduan ini dirancang untuk mengubah Administrator yang mengetik manual menjadi Engineer yang membangun otomatisasi.

---

## 🏗️ 1. Script Anatomy & Basics
*Fondasi agar file teks berubah menjadi program yang bisa jalan.*

| Komponen | Syntax / Command | Penjelasan |
| :--- | :--- | :--- |
| **Shebang** | `#!/bin/bash` | **Wajib Baris 1**. Memberi tahu Linux untuk menggunakan Bash interpreter. |
| **Comments** | `# Ini catatan` | Teks setelah pagar `#` tidak akan dieksekusi komputer. |
| **Permission** | `chmod +x file.sh` | **Wajib**. Memberikan izin "Executable" agar script bisa dipanggil. |
| **Execution** | `./file.sh` | Cara menjalankan script yang ada di folder saat ini. |
| **Debug Mode** | `bash -x file.sh` | Menjalankan script sambil melihat prosesnya baris per baris. |

> **💡 Pro Tip:** Selalu gunakan ekstensi `.sh` agar mudah dikenali manusia, meskipun Linux tidak mewajibkannya.

---

## 📦 2. Variables (Data Container)
*Wadah untuk menyimpan konfigurasi yang dinamis.*

| Tipe | Syntax | Contoh Penggunaan |
| :--- | :--- | :--- |
| **Assign** | `VAR="Nilai"` | `PORT="8080"` (**DILARANG** ada spasi di dekat `=`). |
| **Call** | `"$VAR"` | `echo "Port $PORT"` (Wajib pakai `$` dan kutip `"`). |
| **Command Sub.** | `$(command)` | `NOW=$(date)` (Menyimpan output perintah ke variabel). |
| **System Var** | `$USER`, `$HOME` | Variabel bawaan Linux (misal: user yang sedang login). |

> **💡 Rule of Thumb:** Selalu bungkus pemanggilan variabel dengan kutip dua `"$VAR"` untuk mencegah error jika isinya mengandung spasi (seperti "Nama Folder").

---

## 📥 3. Input Methods (User vs System)
*Cara script mendapatkan data dari dunia luar.*

| Metode | Syntax | Kapan Digunakan? |
| :--- | :--- | :--- |
| **Arguments** | `$1`, `$2` | **Automation (CI/CD)**. Input saat run: `./deploy.sh v1 prod`. |
| **Arg Count** | `$#` | Validasi jumlah input. `if [ $# -ne 2 ]` (Cek input kurang). |
| **Filename** | `$0` | Mengambil nama file script itu sendiri. |
| **Interactive** | `read VAR` | **Manual Tool**. Script berhenti dan bertanya kepada user. |

---

## 🧮 4. Arithmetic (Matematika)
*Melakukan perhitungan angka (Bash tidak otomatis menghitung).*

| Operasi | Syntax | Contoh |
| :--- | :--- | :--- |
| **Formula** | `$(( ... ))` | Wajib pakai kurung ganda untuk mode matematika. |
| **Hitung** | `+`, `-`, `*`, `/` | `TOTAL=$(( 10 + 20 ))` |
| **Increment** | `((i++))` | Menambah nilai variabel `i` sebanyak +1. |
| **Modulus** | `%` | `GANJIL=$(( 5 % 2 ))` (Sisa bagi). |

> **⚠️ Note:** Bash hanya mendukung **Integer** (bilangan bulat). `10 / 3` hasilnya `3`.

---

## 🧠 5. Logic & Decisions (If/Else)
*Otak script. Mengambil keputusan berdasarkan kondisi.*

| Kondisi | Operator | Contoh Syntax |
| :--- | :--- | :--- |
| **Angka Sama** | `-eq` | `if [ "$UMUR" -eq 17 ]; then` |
| **Angka Beda** | `-ne` | `if [ "$UID" -ne 0 ]; then` |
| **Lebih Besar** | `-gt` | `if [ "$RAM" -gt 8000 ]; then` |
| **String Sama** | `=` | `if [ "$USER" = "admin" ]; then` |
| **String Kosong** | `-z` | `if [ -z "$1" ]; then` (Cek input kosong). |
| **File Ada?** | `-f` | `if [ -f "/etc/passwd" ]; then` |
| **Folder Ada?** | `-d` | `if [ -d "/var/www" ]; then` |

---

## 🔄 6. Loops (Perulangan)
*Melakukan tugas massal tanpa lelah.*

| Tipe Loop | Syntax | Fungsi |
| :--- | :--- | :--- |
| **For (Wildcard)** | `for F in *.log` | Memproses semua file dengan ekstensi tertentu. |
| **For (List)** | `for IP in 10.1 10.2` | Memproses daftar item yang ditentukan manual. |
| **For (Range)** | `for i in {1..5}` | Mengulang hitungan angka 1 sampai 5. |
| **While** | `while [ cond ]` | Loop terus menerus **selama** kondisi benar. |

---

## 🛡️ 7. Error Handling & Safety
*Membuat script yang tangguh (Robust) dan aman.*

| Komponen | Syntax | Penjelasan |
| :--- | :--- | :--- |
| **Exit Code** | `echo $?` | Kode status command terakhir (0 = Sukses, Non-0 = Error). |
| **AND Logic** | `cmd1 && cmd2` | Jalankan `cmd2` **HANYA JIKA** `cmd1` sukses. |
| **OR Logic** | `cmd1 \|\| cmd2` | Jalankan `cmd2` **HANYA JIKA** `cmd1` gagal (Backup plan). |
| **Root Check** | `$(id -u)` | `if [ "$(id -u)" -ne 0 ]` (Cek apakah user bukan root). |
| **Silent** | `&> /dev/null` | Membuang semua output (error & standard) ke tong sampah. |
| **Strict Mode** | `set -e` | Script otomatis mati (exit) jika ada satu baris yang error. |

---

## 🧩 8. Functions (Modular Code)
*Membungkus logika berulang agar script rapi (DRY - Don't Repeat Yourself).*

| Komponen | Syntax | Penjelasan |
| :--- | :--- | :--- |
| **Definisi** | `nama_func() { .. }` | Membuat fungsi baru (belum dijalankan). |
| **Panggil** | `nama_func` | Menjalankan fungsi yang sudah didefinisikan. |
| **Parameter** | `$1` (Lokal) | Mengambil input argumen **khusus** milik fungsi (bukan script). |
| **Scope** | `local VAR` | Membuat variabel yang tidak bocor keluar dari fungsi. |
| **Return** | `return 0` | Mengembalikan status kode sukses/gagal (bukan hasil hitungan). |

---

## ⏰ 9. Cron (Scheduler)
*Menjadwalkan script berjalan otomatis.*

| Komponen | Syntax / Format | Penjelasan |
| :--- | :--- | :--- |
| **Edit** | `crontab -e` | Membuka editor untuk menambah/hapus jadwal. |
| **List** | `crontab -l` | Melihat daftar jadwal yang aktif. |
| **Rumus Waktu** | `m h d M D` | Urutan: Menit, Jam, Tgl, Bulan, Hari (0-6). |
| **Every Minute** | `* * * * *` | Script jalan setiap menit, setiap jam, setiap hari. |
| **Startup** | `@reboot` | Script jalan satu kali setiap server baru nyala. |
| **Log Output** | `>> file.log` | **Wajib**. Menyimpan output script ke file agar bisa dibaca. |
