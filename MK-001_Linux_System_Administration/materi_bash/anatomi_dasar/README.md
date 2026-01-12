Anatomi Dasar Script (Struktur Wajib)
Setiap script Bash WAJIB punya kepala dan badan.

📐 Rumus / Sintaks
Bash
#!/bin/bash
# ^ (Kepala/Shebang)

perintah_linux_1
perintah_linux_2
# ^ (Badan/Isi)
•	#!/bin/bash (Shebang): Baris keramat. Wajib ada di baris nomor 1. Ini memberi tahu Linux: "Tolong baca file ini pakai bahasa Bash".
•	Komentar (#): Semua tulisan setelah tanda # tidak akan dijalankan. Cuma catatan buat manusia.

🏢 Kapan dipakai di DevOps?
Setiap kali Anda membuat otomatisasi apa pun (Backup, Deploy, Cleaning), baris pertamanya pasti #!/bin/bash.
🧪 Contoh
Bash
#!/bin/bash
# Script sapaan sederhana
echo "Halo, Server!"
________________________________________

2. Execution Permission (Izin Jalan)
Secara default, Linux MELARANG file teks dijalankan sebagai program (untuk mencegah virus). 
Anda harus memberi izin dulu.

📐 Rumus / Sintaks
Bash
chmod +x nama_file.sh
•	chmod: Change Mode (Ubah mode file).
•	+x: Plus Executable (Tambah izin eksekusi/jalan).

🏢 Kapan dipakai di DevOps?
Saat Anda menaruh script di server CI/CD (seperti Jenkins/GitLab). 
Jika lupa chmod +x, proses deployment akan gagal dengan error Permission Denied.
________________________________________

3. Menjalankan Script (Eksekusi)
Setelah diberi izin, cara menjalankannya ada aturannya.

📐 Rumus / Sintaks
Bash
./nama_file.sh
•	. (Titik): Artinya "Di folder ini".
•	/ (Garis miring): Pemisah folder.
•	Artinya: "Jalankan file yang ada di folder ini".
________________________________________

4. Variables (Kotak Penyimpanan)
Ini adalah konsep terpenting. Variabel adalah Kotak untuk menyimpan data sementara.

📐 Rumus 1: Membuat Variabel (Menyimpan)
Bash
NAMA_KOTAK="Isinya"
•	Syarat: TIDAK BOLEH ada spasi di sebelah tanda =.
o	Salah: NAMA = "Dewa" ❌
o	Benar: NAMA="Dewa" ✅

📐 Rumus 2: Memanggil Variabel (Menggunakan)
Bash
echo "$NAMA_KOTAK"
•	Gunakan tanda Dollar $ untuk mengambil isi kotak.
•	Gunakan tanda kutip dua " agar aman.

🏢 Kapan dipakai di DevOps?
Untuk menyimpan konfigurasi yang sering berubah.
•	Contoh: VERSI_APP="v1.0".
•	Kalau versi aplikasi update ke v2.0, Anda cukup ubah satu baris itu saja, tidak perlu cari-cari di ribuan baris kode lain.
________________________________________

5. Input User (Interaksi)
Membuat script berhenti sejenak dan meminta user mengetik sesuatu.

📐 Rumus / Sintaks
Bash
read NAMA_VARIABEL
•	Apapun yang diketik user akan disimpan ke dalam NAMA_VARIABEL.

🏢 Kapan dipakai di DevOps?
Untuk tool interaktif. Misal: Script untuk setup server awal yang bertanya: "Masukkan IP Database:" atau "Masukkan Password:".

