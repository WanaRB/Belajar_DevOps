Milestone Project 2: "The Web Server Setup"
Gabungan Materi: Packages + Process Utilization + Init (Systemd) + Text-Fu.

📜 Skenario Misi
Anda adalah DevOps Engineer yang diminta men-deploy web server Nginx. 
Namun, atasan Anda paranoid. Dia ingin bukti bahwa server berjalan efisien 
(tidak makan RAM berlebih) dan log aksesnya bisa dipantau.

🎯 Objectives (Misi)
Lakukan tugas berikut di terminal. 
Jangan lupa catat langkah-langkahnya untuk laporan.

1. Deployment & Persistence (Packages & Systemd)
Pastikan nginx terinstall.
Pastikan Nginx dalam kondisi Nyala (Active) DAN Otomatis Nyala saat Booting (Enabled).
Buktikan statusnya dengan satu perintah.

2. Deep Process Inspection (Process & Utilization)
Cek Nginx menggunakan ps aux.
Tantangan Analisa: Nginx biasanya punya 1 Master Process (yang dijalankan root) dan beberapa Worker Process (yang dijalankan user www-data).
Temukan PID dari Master Process.
Temukan PID dari Worker Process.
Cek penggunaan RAM Nginx menggunakan free -h (untuk overview sistem) dan top atau htop (khusus untuk melihat beban Nginx).

3. Traffic Simulation & Log Analysis (Text-Fu)
Buka terminal baru atau gunakan curl localhost sebanyak 3-5 kali untuk menembak server sendiri (agar log akses terisi).
Lokasi log Nginx biasanya di /var/log/nginx/access.log.
Gunakan perintah manipulasi teks untuk menampilkan Hanya User Agent (Browser/Curl) yang mengakses server dari file log tersebut.
Clue: Gunakan cat atau tail, lalu cut atau awk (eksplorasi sedikit). Pola log Nginx standar memisahkan data dengan spasi atau kutip.

4. Automation Cleanup
Matikan service Nginx.
Pastikan Nginx tidak akan nyala otomatis lagi jika server di-restart besok.
