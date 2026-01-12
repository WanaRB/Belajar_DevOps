#!/bin/bash

KAMPUS="Bina Sarana Informatika"
JURUSAN="RPL"
#cara mengetik variabel di bash
#jangan ada spasi (bash sensitif dengan spasi)

clear
echo "=== FORM DATA MAHASISWA ==="
echo "Siapa nama anda ?"
read NAMA
#untuk input rumusnya read nama_variabel taruh dibawah echo berisi pertanyaan
#perintah diatas akan menaruh input dengan pertanyaan siapa nama anda ke variabel NAMA

echo "---------------------------------------"
echo "Nama	: $NAMA"
echo "Jurusan	: $JURUSAN"
echo "Kampus	: $KAMPUS"
echo "--------------------------------------"
#pakai $nama_variabel untuk memanggil variabel 

#pakai command chmod +x nama_file.sh untuk memberi izin execute ke file agar bisa dijalankan
#./nama_file.sh untuk menjalankan file
