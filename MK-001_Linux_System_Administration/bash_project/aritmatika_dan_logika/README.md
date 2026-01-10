Aritmatika (Matematika di Terminal)
Bash secara default menganggap angka 10 dan 20 sebagai teks (huruf), bukan angka. 
Jika Anda tulis 10+20, dia hanya akan mencetak tulisan "10+20". Kita harus memaksa Bash masuk ke mode kalkulator.

📐 Rumus / Sintaks
Gunakan tanda kurung ganda: $(( ... ))
Bash
HASIL=$(( ANGKA_1 + ANGKA_2 ))
•	Operator: + (Tambah), - (Kurang), * (Kali), / (Bagi - hanya hasil bulat tanpa koma).
•	Syarat: Tidak boleh ada spasi di operator assignment (=). Tapi di dalam kurung $(( ... )) boleh ada spasi biar rapi.

🏢 Kapan dipakai di DevOps?
•	Menghitung sisa disk space: TOTAL - TERPAKAI = SISA.
•	Menghitung uptime atau durasi proses backup.

🧪 Contoh
Bash
A=10
B=5
JUMLAH=$(( A + B ))  # Hasilnya 15
________________________________________

2. Logic (If / Else)
Ini adalah otak dari script. Mengambil keputusan berdasarkan kondisi. "JIKA kondisi terpenuhi, MAKA lakukan A. JIKA TIDAK, lakukan B."

📐 Rumus / Sintaks
Hati-hati, spasi di sini SANGAT KRUSIAL.
Bash
if [ KONDISI ]; then
    perintah_jika_benar
else
    perintah_jika_salah
fi
•	[ dan ] : Kurung siku pembuka dan penutup. WAJIB ADA SPASI di kiri dan kanannya.
o	❌ Salah: [$A -gt 10]
o	✅ Benar: [ $A -gt 10 ]
•	then : Penanda dimulainya perintah jika benar.
•	fi : Kebalikan dari if, penanda akhir blok logika.

🔑 Operator Pembanding Angka
•	-eq : Equal (Sama dengan)
•	-ne : Not Equal (Tidak sama dengan)
•	-gt : Greater Than (Lebih besar dari)
•	-lt : Less Than (Lebih kecil dari)
•	-ge : Greater or Equal (Lebih besar atau sama dengan)
•	-le : Less or Equal (Lebih kecil atau sama dengan)

🏢 Kapan dipakai di DevOps?
•	Monitoring: JIKA penggunaan RAM -gt 90, MAKA kirim alert email.
•	Security: JIKA user ID -ne 0 (bukan Root), MAKA tolak akses.

