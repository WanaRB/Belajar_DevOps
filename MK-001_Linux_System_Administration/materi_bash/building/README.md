Arguments (Parameter Input)
Masalah: Selama ini script Anda selalu "Cerewet". 
Dia selalu bertanya: "Siapa namamu?" lalu menunggu (read). 
Di dunia DevOps (CI/CD Automation), tidak ada manusia yang standby di depan layar untuk menjawab pertanyaan script. 
Script dijalankan oleh robot (Jenkins/GitLab).
Jika script berhenti menunggu input, proses deployment akan macet selamanya.

Solusi: Kirim datanya bersamaan dengan saat script dijalankan. 
Bukan: ./script.sh -> (Tanya) -> (Jawab). 
Tapi: ./script.sh data_yang_dikirim

📐 Rumus / Sintaks ($1, $2, ...)
Bash menyediakan variabel otomatis berdasarkan urutan kata saat script dipanggil.
Bash
./script.sh  Dewa   DevOps
    ^          ^      ^
   $0         $1     $2
•	$0: Nama script itu sendiri.
•	$1: Argumen pertama.
•	$2: Argumen kedua (dan seterusnya).
•	$#: Jumlah total argumen yang diberikan.

🏢 Kapan dipakai di DevOps?
•	Deploy Script: ./deploy.sh v1.2 production
o	$1 = v1.2
o	$2 = production
•	Create User: ./create_user.sh andi
________________________________________

🛠️ LATIHAN PRAKTEK: Building (Konversi Script)
Anda akan mengubah script interaktif (yang pakai read) menjadi script otomatis (yang pakai Argument $1).
Skenario: Script bikin_file.sh saat ini masih minta-minta input. Ubahlah agar dia bisa menerima nama file langsung dari perintah awal.
Tugas Anda:
1.Buat file bikin_file.sh.
2.Isi dengan kode di bawah (Kode ini BENAR, tapi kita mau ubah metodenya).
3.MODIFIKASI script tersebut:
	-Hapus bagian echo "Mau buat file apa?" dan read NAMA_FILE.
	-Ganti variabel $NAMA_FILE menjadi $1.
	-Tambahkan validasi: JIKA user lupa memasukkan argumen (alias $1 nya kosong/kosong string), MAKA script harus error dan kasih tahu cara pakainya.
	-Hint Validasi: Gunakan if [ -z "$1" ]; then ... fi. (-z artinya Zero length / Kosong).

Kode Awal (Versi Manual/Interactive):
Bash
#!/bin/bash

echo "=== FILE CREATOR ==="
echo "Masukkan nama file yang mau dibuat:"
read NAMA_FILE  # <--- HAPUS INI

echo "Sedang membuat file $NAMA_FILE..." # <--- GANTI NAMA_FILE JADI $1
touch "$NAMA_FILE" # <--- GANTI JADI $1
echo "Selesai!"

Ekspektasi Output Setelah Dimodifikasi:
•Skenario 1 (Gagal - Lupa Argumen):
Plaintext
$ ./bikin_file.sh
ERROR: Mohon masukkan nama file!
Contoh: ./bikin_file.sh laporan.txt

•Skenario 2 (Sukses):
Plaintext
$ ./bikin_file.sh dataku.txt
=== FILE CREATOR ===
Sedang membuat file dataku.txt...
Selesai!

