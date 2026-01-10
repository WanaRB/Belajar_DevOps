#!/bin/bash

echo "=== MEMULAI DEPLOYMENT RAHASIA ==="

# 1. Coba buat folder di area root (Pasti gagal kalau user biasa)
mkdir /root/folder_rahasia 

error_1=$? 
if [ $error_1 -ne 0 ]; then
	echo "GAGAL: Tidak bisa membuat folder"
	exit 1
fi
#ERROR HANDLING
#Jika user tidak memakai sudo maka akan keluar echo GAGAL

# 2. Script ini bodoh, dia lanjut terus meski langkah 1 gagal
echo "Masuk ke folder..."
cd /root/folder_rahasia

# 3. Buat file
touch laporan.txt
echo "✅ File laporan berhasil dibuat!"
