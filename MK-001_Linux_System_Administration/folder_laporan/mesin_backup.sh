#!/bin/bash

echo "=== MEMULAI PROSES BACKUP OTOMATIS ==="

# Loop mencari semua file berakhiran .txt
# Tanda * artinya "Apa saja" (Wildcard)
for FILE in *.txt
do
    echo "-----------------------------------"
    echo "Target ditemukan: $FILE"
    echo "Sedang memproses backup..."
    
    # Simulasi proses (tambah .bak di belakang nama file)
    cp $FILE $FILE.bak
    
    sleep 1 # Jeda 1 detik biar terlihat kerja
    echo "✅ Sukses! $FILE aman."
done

echo "-----------------------------------"
echo "=== SEMUA SELESAI ==="
