#!/bin/bash

echo "=== FILE CREATOR ==="
if [ $# -ne 1 ]; then
	echo "ERROR: Mohon masukkan nama file!"
	echo "Contoh: ./bikin_file.sh laporan.txt"
	exit 1
fi
echo "Sedang membuat file $1" # <--- GANTI NAMA_FILE JADI $1
touch "$1" # <--- GANTI JADI $1

echo "Selesai!"
