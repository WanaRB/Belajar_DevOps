# 📖 Cheatsheet: MK-001 Architecture & Navigation


Dokumen ini berisi rangkuman command vital, shortcut, dan best practice untuk navigasi dan manajemen file di Linux. Didesain khusus untuk transisi dari **Operator** ke **DevOps Engineer**.

---

## 🧭 1. Navigasi (Peta & Kompas)
*Fokus: Bergerak efisien tanpa tersesat.*

| Command | Rumus / Flag | Fungsi | 💡 DevOps / Senior Tip |
| :--- | :--- | :--- | :--- |
| **`pwd`** | `pwd` | Cek posisi sekarang | **Selalu ketik ini** sebelum menjalankan `rm -rf` agar tidak salah hapus folder! |
| **`cd`** | `cd [tujuan]` | Pindah folder | Gunakan `cd -` untuk **Undo Move** (kembali ke folder sebelumnya). |
| | `cd ~` | Pulang ke Home | Ketik `cd` (tanpa argumen) juga otomatis pulang ke Home. |
| | `cd ..` | Mundur 1 level | Gunakan `cd ../..` untuk mundur 2 level sekaligus. |
| **`ls`** | `ls -la` | List detail + hidden | Kombinasi wajib. `-l` (list format), `-a` (all/hidden files). |
| | `ls -R` | List Recursive | Melihat isi sub-folder sampai ke dalam tanpa harus masuk (`cd`). |
| | `ls -lh` | List Human Readable | Size file ditampilkan dalam **KB/MB/GB**, bukan byte. Lebih enak dibaca. |

---

## 🛠️ 2. Manipulasi File (CRUD)
*Fokus: Membuat, Menyalin, Memindahkan, dan Menghapus.*

| Command | Rumus | Fungsi | 💡 DevOps / Senior Tip |
| :--- | :--- | :--- | :--- |
| **`mkdir`** | `mkdir -p [path]` | Buat folder | **Wajib `-p`**. Mencegah error jika parent folder belum ada. <br>Contoh: `mkdir -p app/v1/logs`. |
| **`touch`** | `touch [file]` | Buat file kosong | Bisa buat banyak sekaligus: `touch file1 file2`. <br>Bisa tembak jarak jauh: `touch log/error.txt`. |
| **`cp`** | `cp -r [src] [dest]` | Copy file/folder | **Wajib `-r`** (recursive) kalau mau copy folder. Jika file biasa, tidak perlu `-r`. |
| **`mv`** | `mv [src] .` | Pindah ke "sini" | **Titik (`.`)** adalah teman terbaik saat memindahkan file dari tempat jauh ke lokasi Anda berdiri sekarang. |
| **`rm`** | `rm -rf [target]` | Hapus paksa | `-r` (recursive), `-f` (force/no confirm). <br>⚠️ **Senjata pemusnah massal.** Hati-hati! |

---

## ⚡ 3. Shortcut & Efficiency Pattern
*Jangan mengetik manual jika bisa otomatis.*

### Simbol Penting
- **`~` (Tilde):** Home Directory (`/home/user`).
- **`.` (Titik):** Current Directory (Di sini).
- **`..` (Titik dua):** Parent Directory (Atasnya sini).
- **`/` (Slash awal):** Root (Akar file system).
- **`TAB Key`:** **Auto-complete.** Jangan ketik manual! Ketik 3 huruf awal lalu tekan TAB.

### The "Remote Action" Pattern
Jangan biasakan masuk-keluar kamar (`cd`) hanya untuk satu aksi. Lakukan aksi dari tempat Anda berdiri (Remote Manipulation).

❌ **Cara Lambat (Operator):**
```bash
cd /var/log
rm error.log
cd ~
```

✅ **Cara Cepat (Senior):**
```bash
rm /var/log/error.log
```

---

## 🧠 4. Kernel & System Info (The Brain)
*Folder `/proc` dan `/sys` bukan file nyata, tapi jendela langsung ke RAM dan Kernel.*

| Command | Fungsi | 💡 DevOps Use Case |
| :--- | :--- | :--- |
| **`cat /proc/cpuinfo`** | Detail Processor | Cek jumlah core server sebelum install database berat. |
| **`cat /proc/meminfo`** | Detail RAM | Debugging kenapa server kena **"Out of Memory" (OOM)**. |
| **`uname -a`** | Cek Versi Kernel | Cek kompatibilitas software (misal: Docker butuh versi kernel tertentu). |
| **`df -h`** | Disk Free | Cek sisa storage hardisk (GB). Perintah wajib saat server lemot. |
| **`du -sh [folder]`** | Disk Usage | Cek ukuran total folder tertentu. <br>Rumus: `du -sh .` (Cek ukuran folder ini). |

---

## 📝 5. File Editor & Viewer
*Membaca dan Menulis konfigurasi.*

| Command | Fungsi | 💡 Catatan Senior |
| :--- | :--- | :--- |
| **`nano [file]`** | Text Editor | Editor paling ramah pemula. `Ctrl+O` (Save), `Ctrl+X` (Exit). |
| **`cat [file]`** | Baca isi (Dump) | Hati-hati pada file log raksasa (bisa bikin terminal lag/hang). |
| **`less [file]`** | Baca per halaman | **Gunakan ini untuk log besar.** Navigasi pakai panah, tekan `q` untuk keluar. |
| **`head -n 5`** | Baca 5 baris **ATAS** | Cepat melihat header/konfigurasi awal file. |
| **`tail -n 5`** | Baca 5 baris **BAWAH** | Cepat melihat **log error terbaru**. |

---

## 🔗 6. Links (Shortcut Logic)
*Konsep Inode: Setiap file punya "Nomor KTP" unik (Inode). Nama file hanyalah label.*

Cek Inode dengan command: `ls -li`

| Tipe Link | Command | Perilaku | 💡 DevOps Use Case |
| :--- | :--- | :--- | :--- |
| **Symbolic Link**<br>(Softlink) | `ln -s [Asli] [Link]` | Seperti **Shortcut**. Punya Inode **BEDA**. <br>Jika file asli dihapus, link **RUSAK** (Broken). | **Config & Versioning:** <br>Link dari `sites-available` ke `sites-enabled` (Nginx). <br>Link `current_app` ke `app_v2.0`. |
| **Hard Link** | `ln [Asli] [Link]` | Alias/Cermin. Punya Inode **SAMA**. <br>Jika file asli dihapus, data **AMAN** (selama 1 link tersisa). | **Backup Hemat:** <br>Snapshot file tanpa duplikasi storage (karena merujuk ke blok data fisik yang sama). |

---
*Created by Dewana*
