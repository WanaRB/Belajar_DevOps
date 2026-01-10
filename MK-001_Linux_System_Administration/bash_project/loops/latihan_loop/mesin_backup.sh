#!/bin/bash 

echo "=== MEMULAI BACKUP OTOMATIS ==="

for FILE in *.txt
do
	echo "Menemukan file: $FILE"
	cp "$FILE" "$FILE.bak" #copy file dan mengubahnya menjadi berektensi .bak

	echo "--> sukses backup $FILE.bak"
	sleep 1 
done

echo "=== SELESAI ==="
