Loops (Perulangan)
Bayangkan Anda harus mem-backup 100 file log. ❌ Cara Manual: Ketik perintah cp log1.txt log1.bak, lalu cp log2.txt log2.bak, sampai 100 kali. (Capek & Rawan Salah). ✅ Cara Loop: Tulis perintahnya satu kali saja, lalu suruh Bash mengulanginya untuk setiap file.

📐 Rumus / Sintaks (For Loop)
Strukturnya seperti sandwich. Ada Roti Atas (for), Isi (do ...), dan Roti Bawah (done).

Bash

for VARIABEL_SEMENTARA in DAFTAR_ITEM
do
    perintah_1
    perintah_2
done

VARIABEL_SEMENTARA: Nama kotak untuk memegang item yang sedang diproses saat ini (misal: FILE).
DAFTAR_ITEM: Apa yang mau diproses? Bisa berupa daftar nama (A B C) atau pola file (*.txt).
*.txt (Wildcard): Artinya "Semua file yang belakangnya .txt".

🏢 Kapan dipakai di DevOps?
Bulk Backup: Mengarsipkan semua log hari ini.

Server Update: Melakukan apt update ke 50 server sekaligus.
Deployment: Mengupload 10 file konfigurasi ke folder tujuan.

🧪 Contoh Sederhana
Bash
# Loop mencetak angka 1 sampai 5
for ANGKA in 1 2 3 4 5
do
    echo "Hitungan ke: $ANGKA"
done
