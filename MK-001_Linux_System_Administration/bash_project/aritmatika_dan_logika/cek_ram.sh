#!/bin/bash

TOTAL_RAM=8000
BATAS_AMAN=1000

echo "=== SERVER MONITORING TOOL ==="
echo "Total RAM Server: $TOTAL_RAM MB"

echo "Masukkan RAM yang dipakai (MB): "
read ram_terpakai

sisa_ram=$(( TOTAL_RAM-ram_terpakai ))

echo "-------------------------"
echo "Menghitung"
sleep 1
echo "Sisa RAM anda saat ini: $sisa_ram MB"

if [ $sisa_ram -lt $BATAS_AMAN ]; then 
	echo "STATUS: BAHAYA! Memori Kritis"
	echo "Tindakan: Segera bersihkan cache!"
else 
	echo "STATUS: AMAN. Server berjalan normal."
fi

echo "-------------------------"
