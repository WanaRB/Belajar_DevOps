# 🐚 Bash Scripting & Automation - Master Cheatsheet

> **Role:** DevOps Engineer Path
> **Status:** ✅ Phase 1 Completed
> **Focus:** Scripting Logic, Automation, & Error Handling

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
| **Exit (OK)** | `exit 0` | Menghentikan script dengan status "Sukses". |
| **Exit (Fail)** | `exit 1` | Menghentikan script dengan status "Error" (menghentikan pipeline). |

> **💡 Pro Tip:** Selalu gunakan ekstensi `.sh` agar mudah dikenali manusia, meskipun Linux tidak mewajibkannya.

---

## 📦 2. Variables (Data Container)
*Wadah untuk menyimpan konfigurasi yang dinamis.*

| Tipe | Syntax | Contoh Penggunaan |
| :--- | :--- | :--- |
| **Assign** | `VAR="Nilai"` | `APP_PORT="8080"` (Ingat: **DILARANG** ada spasi di dekat `=`). |
| **Call** | `"$VAR"` | `echo "Port aplikasi adalah $APP_PORT"` (Wajib pakai `$` dan kutip `"`). |
| **Command Sub.** | `$(command)` | `HARI_INI=$(date)` (Menyimpan hasil output perintah ke variabel). |
| **System Var** | `$USER`, `$HOME` | Variabel bawaan Linux (misal: user yang sedang login). |

> **💡 Rule of Thumb:** Selalu bungkus pemanggilan variabel dengan kutip dua `"$VAR"` untuk mencegah error jika isinya mengandung spasi (seperti "Nama Folder").

---

## 📥 3. Input Methods (User vs System)
*Cara script mendapatkan data dari dunia luar.*

| Metode | Syntax | Kapan Digunakan? |
| :--- | :--- | :--- |
| **Arguments** | `$1`, `$2` | **Automation (CI/CD)**. Data dikirim saat run: `./deploy.sh v1 production`. |
| **Argument Count** | `$#` | Validasi jumlah input. `if [ $# -ne 2 ]` (Cek apakah argumen kurang). |
| **Script Name** | `$0` | Mengambil nama file script itu sendiri. |
| **Interactive** | `read VAR` | **Manual Tool**. Script berhenti dan bertanya kepada manusia. |

> **💡 Best Practice:** Hindari `read` untuk script yang berjalan di server otomatis (Jenkins/GitLab). Gunakan Arguments `$1`.

---

## 🧮 4. Arithmetic (Matematika)
*Melakukan perhitungan angka (Bash tidak otomatis menghitung).*

| Operasi | Syntax | Contoh |
| :--- | :--- | :--- |
| **Formula** | `$(( ... ))` | Wajib pakai kurung ganda untuk mode matematika. |
| **Tambah/Kurang** | `+`, `-` | `TOTAL=$(( 10 + 20 ))` |
| **Kali** | `*` | `HASIL=$(( A * B ))` |
| **Bagi** | `/` | `SISA=$(( 100 / 2 ))` |
| **Modulus** | `%` | `GANJIL=$(( 5 % 2 ))` (Sisa bagi). |

> **💡 Integer Only:** Bash tidak mendukung koma/desimal. `10 / 3` hasilnya `3`, bukan `3.33`.

---

## 🧠 5. Logic & Decisions (If/Else)
*Otak script. Mengambil keputusan berdasarkan kondisi.*

| Kondisi | Operator | Contoh Syntax |
| :--- | :--- | :--- |
| **Angka Sama** | `-eq` | `if [ "$UMUR" -eq 17 ]; then` |
| **Angka Beda** | `-ne` | `if [ "$UID" -ne 0 ]; then` (Cek bukan Root). |
| **Lebih Besar** | `-gt` | `if [ "$RAM" -gt 8000 ]; then` |
| **Lebih Kecil** | `-lt` | `if [ "$DISK" -lt 10 ]; then` |
| **String Sama** | `=` | `if [ "$USER" = "admin" ]; then` |
| **String Kosong** | `-z` | `if [ -z "$1" ]; then` (Cek input kosong). |
| **File Ada?** | `-f` | `if [ -f "/etc/passwd" ]; then` |
| **Folder Ada?** | `-d` | `if [ -d "/var/www" ]; then` |

> **💡 The Space Rule:** Spasi di dalam kurung siku `[ ... ]` itu **SAKRAL**.
> ❌ Salah: `[$A -eq 1]` | ✅ Benar: `[ $A -eq 1 ]`.

---

## 🔄 6. Loops (Perulangan)
*Melakukan tugas massal tanpa lelah.*

| Tipe Loop | Syntax | Fungsi |
| :--- | :--- | :--- |
| **For (Wildcard)** | `for FILE in *.txt` | Memproses semua file dengan ekstensi tertentu. |
| **For (List)** | `for IP in 10.1 10.2` | Memproses daftar item yang ditentukan manual. |
| **For (Range)** | `for i in {1..10}` | Mengulang hitungan angka 1 sampai 10. |

**Contoh Struktur:**
```bash
for DATA in *.log
do
    echo "Compressing $DATA..."
    tar -czf "$DATA.tar.gz" "$DATA"
done

# 🐚 Bash Scripting & Automation - Master Cheatsheet

> **Role:** DevOps Engineer Path
> **Status:** ✅ Phase 1 Completed
> **Focus:** Scripting Logic, Automation, & Error Handling

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
| **Exit (OK)** | `exit 0` | Menghentikan script dengan status "Sukses". |
| **Exit (Fail)** | `exit 1` | Menghentikan script dengan status "Error" (menghentikan pipeline). |

> **💡 Pro Tip:** Selalu gunakan ekstensi `.sh` agar mudah dikenali manusia, meskipun Linux tidak mewajibkannya.

---

## 📦 2. Variables (Data Container)
*Wadah untuk menyimpan konfigurasi yang dinamis.*

| Tipe | Syntax | Contoh Penggunaan |
| :--- | :--- | :--- |
| **Assign** | `VAR="Nilai"` | `APP_PORT="8080"` (Ingat: **DILARANG** ada spasi di dekat `=`). |
| **Call** | `"$VAR"` | `echo "Port aplikasi adalah $APP_PORT"` (Wajib pakai `$` dan kutip `"`). |
| **Command Sub.** | `$(command)` | `HARI_INI=$(date)` (Menyimpan hasil output perintah ke variabel). |
| **System Var** | `$USER`, `$HOME` | Variabel bawaan Linux (misal: user yang sedang login). |

> **💡 Rule of Thumb:** Selalu bungkus pemanggilan variabel dengan kutip dua `"$VAR"` untuk mencegah error jika isinya mengandung spasi (seperti "Nama Folder").

---

## 📥 3. Input Methods (User vs System)
*Cara script mendapatkan data dari dunia luar.*

| Metode | Syntax | Kapan Digunakan? |
| :--- | :--- | :--- |
| **Arguments** | `$1`, `$2` | **Automation (CI/CD)**. Data dikirim saat run: `./deploy.sh v1 production`. |
| **Argument Count** | `$#` | Validasi jumlah input. `if [ $# -ne 2 ]` (Cek apakah argumen kurang). |
| **Script Name** | `$0` | Mengambil nama file script itu sendiri. |
| **Interactive** | `read VAR` | **Manual Tool**. Script berhenti dan bertanya kepada manusia. |

> **💡 Best Practice:** Hindari `read` untuk script yang berjalan di server otomatis (Jenkins/GitLab). Gunakan Arguments `$1`.

---

## 🧮 4. Arithmetic (Matematika)
*Melakukan perhitungan angka (Bash tidak otomatis menghitung).*

| Operasi | Syntax | Contoh |
| :--- | :--- | :--- |
| **Formula** | `$(( ... ))` | Wajib pakai kurung ganda untuk mode matematika. |
| **Tambah/Kurang** | `+`, `-` | `TOTAL=$(( 10 + 20 ))` |
| **Kali** | `*` | `HASIL=$(( A * B ))` |
| **Bagi** | `/` | `SISA=$(( 100 / 2 ))` |
| **Modulus** | `%` | `GANJIL=$(( 5 % 2 ))` (Sisa bagi). |

> **💡 Integer Only:** Bash tidak mendukung koma/desimal. `10 / 3` hasilnya `3`, bukan `3.33`.

---

## 🧠 5. Logic & Decisions (If/Else)
*Otak script. Mengambil keputusan berdasarkan kondisi.*

| Kondisi | Operator | Contoh Syntax |
| :--- | :--- | :--- |
| **Angka Sama** | `-eq` | `if [ "$UMUR" -eq 17 ]; then` |
| **Angka Beda** | `-ne` | `if [ "$UID" -ne 0 ]; then` (Cek bukan Root). |
| **Lebih Besar** | `-gt` | `if [ "$RAM" -gt 8000 ]; then` |
| **Lebih Kecil** | `-lt` | `if [ "$DISK" -lt 10 ]; then` |
| **String Sama** | `=` | `if [ "$USER" = "admin" ]; then` |
| **String Kosong** | `-z` | `if [ -z "$1" ]; then` (Cek input kosong). |
| **File Ada?** | `-f` | `if [ -f "/etc/passwd" ]; then` |
| **Folder Ada?** | `-d` | `if [ -d "/var/www" ]; then` |

> **💡 The Space Rule:** Spasi di dalam kurung siku `[ ... ]` itu **SAKRAL**.
> ❌ Salah: `[$A -eq 1]` | ✅ Benar: `[ $A -eq 1 ]`.

---

## 🔄 6. Loops (Perulangan)
*Melakukan tugas massal tanpa lelah.*

| Tipe Loop | Syntax | Fungsi |
| :--- | :--- | :--- |
| **For (Wildcard)** | `for FILE in *.txt` | Memproses semua file dengan ekstensi tertentu. |
| **For (List)** | `for IP in 10.1 10.2` | Memproses daftar item yang ditentukan manual. |
| **For (Range)** | `for i in {1..10}` | Mengulang hitungan angka 1 sampai 10. |

**Contoh Struktur:**
```bash
for DATA in *.log
do
    echo "Compressing $DATA..."
    tar -czf "$DATA.tar.gz" "$DATA"
done

🛡️ 7. Error Handling & Safety
Membuat script yang tangguh (Robust) dan aman.
| Command | Fungsi | 
| :--- | :--- | 
| **Exit Code ** | `$?` | 
| **AND Operator ** | `&&` |
| **OR Operator ** | ``` |
| **Check Root (root hasilnya 0)** | `$(id-u)` |
| **Silent Grep** | `grep -q ` |
