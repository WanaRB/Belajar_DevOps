# 🐧 Linux System Administration: The Nginx Log Architecture

![Status](https://img.shields.io/badge/Status-Passed-success?style=for-the-badge) ![Grade](https://img.shields.io/badge/Grade-90%2F100-blue?style=for-the-badge) ![Level](https://img.shields.io/badge/Level-Junior%20SysAdmin-orange?style=for-the-badge)

**Module:** MK-001 (Linux Architecture & Navigation)  
**Topic:** File System Management, Hardlinks/Symlinks, & Disaster Recovery.

---

## 📋 Scenario Case
Sebagai simulasi tugas hari pertama kerja sebagai **Junior SysAdmin**, saya diminta oleh Senior Lead untuk menyiapkan infrastruktur folder untuk server Nginx secara manual sebelum script otomatisasi dijalankan. Tugas ini harus diselesaikan dalam waktu 10 menit dengan aturan ketat: **Efisiensi Command** dan **Manipulasi Jarak Jauh (No `cd`)**.

### 🎯 Objectives
- [x] **Infrastructure Setup:** Membuat struktur direktori log & config.
- [x] **Dummy Data:** Generate dummy logs tanpa berpindah direktori.
- [x] **System Audit:** Cek RAM dan Disk Usage.
- [x] **Log Rotation:** Simulasi memindahkan dan me-rename log penuh.
- [x] **Reliability (Backup):** Menggunakan **Hardlink** untuk backup immutable.
- [x] **Deployment (Live):** Menggunakan **Symlink** untuk konfigurasi aktif.
- [x] **Disaster Check:** Simulasi penghapusan file asli untuk menguji backup.

---

## 🛠️ Execution History (Lab Log)

Berikut adalah dokumentasi langkah-langkah yang saya jalankan selama simulasi, beserta catatan perbaikan untuk optimasi.

### 1. Infrastructure & Data Generation
Membuat struktur folder dan file dummy menggunakan *Absolute/Relative Path*.

```bash
# Setup Directory Structure (Logs & Conf sejajar)
mkdir -p srv/nginx/logs/archive
mkdir srv/nginx/conf

# Generate Dummy Logs & Config
touch srv/nginx/logs/access.log srv/nginx/logs/error.log srv/nginx/logs/app.log
touch srv/nginx/conf/nginx.conf

# Input Configuration content
nano srv/nginx/conf/nginx.conf 
# > Input text: server_name localhost;
```

### 2. System Audit
Mengecek kesehatan server (RAM & Storage).

```bash
# Check Disk Usage (Human Readable)
du -sh srv/

# Check RAM Info (Header)
head -n 3 /proc/meminfo
```

### 3. Log Rotation Simulation
Memindahkan log aplikasi yang penuh ke folder archive sekaligus mengganti nama.

```bash
# ✅ Atomic Operation (Move + Rename dalam satu command)
mv srv/nginx/logs/app.log srv/nginx/logs/archive/app_2024.log
```

### 4. Reliability Strategy (Hardlink Backup)
Membuat backup yang tahan terhadap penghapusan file asli (Inode Sharing).

```bash
# Create Hardlink
ln srv/nginx/conf/nginx.conf srv/nginx/logs/archive/nginx.conf.backup

# Verify Inode (Pastikan nomor Inode sama)
ls -li srv/nginx/conf/nginx.conf 
ls -li srv/nginx/logs/archive/nginx.conf.backup
```

### 5. Deployment Strategy (Symlink)
Membuat pointer untuk konfigurasi aktif.

```bash
# Create Symbolic Link
ln -s srv/nginx/conf/nginx.conf live_config

# Verify Link Direction
ls -li live_config
```

### 6. Disaster Recovery Test
Menguji apakah backup tetap aman jika file asli terhapus.

```bash
# ⚠️ SIMULASI BENCANA: Hapus config asli
rm srv/nginx/conf/nginx.conf

# Test 1: Baca Live Config (Harus Error/Broken Link)
cat live_config 
# > Output: No such file or directory (Expected)

# Test 2: Baca Backup (Harus Sukses)
cat srv/nginx/logs/archive/nginx.conf.backup
# > Output: server_name localhost; (Data Safe)
```

---

## 📝 Retrospective & Learning Notes

Selama proses pengerjaan, saya melakukan beberapa kesalahan yang menjadi pelajaran penting untuk efisiensi ke depannya:

### 1. Head vs Tail vs Cat
* **Kesalahan:** Awalnya saya menggunakan `cat /proc/meminfo | tail -n 3` untuk melihat info RAM.
* **Masalah:** Command ini justru menampilkan 3 baris **terbawah** (info yang kurang relevan), padahal info *MemTotal* ada di **paling atas**.
* **Perbaikan:** Gunakan `head -n 3 /proc/meminfo` untuk mengambil header (baris teratas).

### 2. Move Efficiency (Rename on Move)
* **Kesalahan:** Melakukan `mv` ke folder tujuan, lalu melakukan `mv` lagi untuk rename.
* **Masalah:** Dua kali kerja (I/O operation berlebih).
* **Perbaikan:** Gunakan logika **Atomic Move**: `mv source path/to/destination/new_name`. Pindah dan ganti nama bisa dilakukan dalam satu perintah.

### 3. Hardlink Verification
* **Insight:** Selalu gunakan flag `-i` (`ls -li`) saat bekerja dengan Hardlink untuk memastikan file backup benar-benar berbagi **Inode** yang sama dengan file asli, bukan sekadar file copy biasa.

---

## ✅ Final Verification
Output akhir struktur direktori setelah disaster recovery test:

```bash
ls -R -li
```
