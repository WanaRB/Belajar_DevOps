#!/bin/bash 

#Script ini membuat file backup dengan ekstensi .bak untuk semua file yang ada di folder ini

echo "=== MEMULAI BACKUP OTOMATIS ==="

for FILE in *.txt
do
	echo "Menemukan file: $FILE"
	cp "$FILE" "$FILE.bak" #copy file dan mengubahnya menjadi berektensi .bak

	echo "--> sukses backup $FILE.bak"
	sleep 1 
done

echo "=== SELESAI ==="
