🚩 Milestone Project 3: "The Forensic Hunter"
Gabungan Materi: Logging + Text-Fu (Grep/Cut/Sort/Uniq) + Command Line. Skenario: Server perusahaan diduga mengalami percobaan peretasan (Brute Force SSH) dan ada anomali pada service sistem. Kamu diminta oleh tim Security untuk membuat laporan investigasi berdasarkan bukti log.

🎯 Objectives (Misi)
Lakukan tugas berikut dan catat langkahnya.

1. Investigasi Keamanan (Security Audit)
Gunakan grep pada auth_evidence.log untuk mencari semua percobaan login yang Gagal ("Failed").
Tantangan Text-Fu: Dari baris yang gagal tadi, ambil hanya IP Address penyerangnya, lalu urutkan dan hitung berapa kali IP tersebut mencoba menyerang.
Clue: Gunakan cut (perhatikan pemisahnya spasi ke-berapa), sort, dan uniq -c.
Cari tahu perintah berbahaya apa yang dijalankan oleh user dewa setelah berhasil login.

2. Investigasi Sistem (System Crash Analysis)
Cek file sys_evidence.log.
Temukan penyebab kenapa Nginx mati mendadak. (Cari kata kunci "Killed" atau "Out of memory").
Simpan baris bukti penyebab kematian Nginx tersebut ke file baru bernama laporan_crash.txt.

3. Pelaporan
Tampilkan isi laporan_crash.txt.
