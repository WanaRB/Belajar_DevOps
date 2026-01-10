Exit Status & Error Handling (Penanganan Error)

Dalam DevOps, script tidak boleh "masa bodo". Jika langkah A gagal, langkah B jangan dijalankan. 
Jangan sampai script bilang "Sukses Backup" padahal harddisk penuh.

📐 Rumus 1: Exit Code ($?)
Setiap perintah Linux yang selesai dijalankan akan meninggalkan "Jejak Kode" di variabel spesial bernama $?.
•	Angka 0 = Sukses (Tidak ada error).
•	Angka 1 - 255 = Gagal (Ada error).

Contoh:
Bash
ls /folder_ngawur
echo $?
# Output: 2 (atau angka selain 0, artinya Gagal karena folder tidak ada)

ls /home
echo $?
# Output: 0 (Sukses)

📐 Rumus 2: Operator Logika (&& dan ||)
Cara cepat menangani error tanpa mengetik if yang panjang.
1.Operator && (DAN):
	-"Lakukan A, jika sukses, baru lakukan B."
	-Rumus: perintah_A && perintah_B

2.Operator || (ATAU):
	-"Lakukan A, jika gagal, maka lakukan B (sebagai cadangan/pesan error)."
	-Rumus: perintah_A || perintah_B

Contoh DevOps:
Bash
# Update dulu, kalau sukses baru install
sudo apt update && sudo apt install nginx

# Coba ping google, kalau gagal beri pesan
ping google.com || echo "Internet Mati Bos!"
________________________________________

🛠️ LATIHAN PRAKTEK: Fixing The Broken Script
Anda diminta memperbaiki script milik Junior SysAdmin yang ceroboh. 
Script ini tujuannya sederhana: Membuat folder rahasia di dalam sistem, lalu membuat file catatan di dalamnya.

Masalah Script Saat Ini:
1.Dia mencoba membuat folder di area terlarang (/root) tanpa sudo.
2.Dia tidak mengecek error. Walaupun gagal buat folder, dia tetap memaksa masuk dan bikin file (akibatnya error beruntun).

Tugas Anda:
1.Buat file deploy_rahasia.sh.
2.Isi dengan KODE RUSAK di bawah ini dulu.
3.Jalankan (Lihat errornya).
4.PERBAIKI kodenya agar:
	-Menggunakan logika if atau && untuk mengecek keberhasilan mkdir.
	-Jika mkdir gagal, script harus berhenti (exit 1) dan bilang "Gagal buat folder".
	-(Tips: Anda boleh tambah sudo, tapi yang paling penting adalah penanganan errornya).

Kode Rusak:
Bash
#!/bin/bash

echo "=== MEMULAI DEPLOYMENT RAHASIA ==="

# 1. Coba buat folder di area root (Pasti gagal kalau user biasa)
mkdir /root/folder_rahasia

# 2. Script ini bodoh, dia lanjut terus meski langkah 1 gagal
echo "Masuk ke folder..."
cd /root/folder_rahasia

# 3. Buat file
touch laporan.txt
echo "✅ File laporan berhasil dibuat!"

Output yang diharapkan setelah DIPERBAIKI (Skenario Gagal): 
Script harusnya sadar dia gagal, lalu berhenti dengan sopan.

=== MEMULAI DEPLOYMENT RAHASIA ===
mkdir: cannot create directory... (pesan error asli linux)
❌ GAGAL: Tidak bisa membuat folder. Cek permission!
