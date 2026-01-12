#!/bin/bash

#User menjalankan script dengan nama file
#Contoh: ./bikin_file.sh Hello_World.txt
#Maka akan ada file Hello_World.txt yang dibuat

echo "=== FILE CREATOR ==="
if [ $# -ne 1 ]; then
	echo "ERROR: Mohon masukkan nama file!"
	echo "Contoh: ./bikin_file.sh laporan.txt"
	exit 1
fi
#membuat percabangan untuk mengatasi jika user tidak memasukkan nama file
#percabangan dibuat agar hanya ketika user memasukkan 1 argument maka script akan berjalan

echo "Sedang membuat file $1" 
touch "$1" 

echo "Selesai!"
