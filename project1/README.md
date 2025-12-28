Project berdasarkan materi Command_line, Text-fu, Advanced Text-fu dan Permission di Linux journey

## 🛠️ Teknologi & Konsep yang Digunakan
Project ini dibangun sepenuhnya menggunakan **Linux Bash Shell** dengan penerapan konsep:
* **Command Line Navigation:** Manajemen struktur direktori (`mkdir`, `cd`, `ls`).
* **Text-Fu & Pipelines:** Manipulasi stream data menggunakan `grep` (filtering), `sort` (ordering), dan Redirection (`>`, `|`).
* **Vim Editor:** Editing file konfigurasi dan laporan secara manual di terminal.
* **Linux Permissions:** Hardening keamanan file menggunakan `chmod` (Octal mode) untuk membatasi akses User, Group, dan Others.

## 🚀 Skenario Eksekusi
Berikut adalah alur kerja yang dilakukan dalam project ini:

1.  **Environment Setup:** Membuat struktur direktori terpisah untuk `data_mentah` dan `laporan_rahasia`.
2.  **Data Generation:** Simulasi pembuatan file log server (`server.log`) yang berisi campuran pesan INFO, WARN, dan ERROR.
3.  **Log Analysis:**
    * Menggunakan pipeline untuk memfilter baris "ERROR".
    * Mengurutkan data agar rapi.
    * Mengekspor hasil ke `error_2025.txt`.
4.  **Reporting:** Menambahkan Header "TOP SECRET" menggunakan **Vim**.
5.  **Security Hardening:**
    * Mengatur permission file menjadi `700` (Hanya Owner yang bisa akses).
    * Mengamankan folder laporan agar user lain hanya bisa *read-only* tanpa akses tulis.

## Catatan 
* **Least Privilege Principle:** Memberikan hak akses seminimal mungkin (hanya kepada yang butuh) adalah kunci keamanan server.
* **Automation:** Menggabungkan perintah kecil (`grep`, `sort`) dengan pipa (`|`) jauh lebih efisien daripada membuka file satu per satu.
* **Vim Proficiency:** Kemampuan mengedit teks langsung di terminal sangat krusial saat menangani remote server tanpa GUI.
