🛠️ LATIHAN PRAKTEK: Fixing The Broken Script
Anda diminta memperbaiki script milik Junior SysAdmin yang ceroboh. 
Script ini tujuannya sederhana: Membuat folder rahasia di dalam sistem, lalu membuat file catatan di dalamnya.

Masalah Script Saat Ini:
Dia mencoba membuat folder di area terlarang (/root) tanpa sudo.
Dia tidak mengecek error. Walaupun gagal buat folder, dia tetap memaksa masuk dan bikin file (akibatnya error beruntun).

Tugas Anda:
Buat file deploy_rahasia.sh.
Isi dengan KODE RUSAK di bawah ini dulu.
Jalankan (Lihat errornya).

PERBAIKI kodenya agar:
Menggunakan logika if atau && untuk mengecek keberhasilan mkdir.
Jika mkdir gagal, script harus berhenti (exit 1) dan bilang "Gagal buat folder".
(Tips: Anda boleh tambah sudo, tapi yang paling penting adalah penanganan errornya).
