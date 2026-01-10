# MK-001: Linux System Administration & Bash Scripting
**The Bash Manifesto: Fundamental Skills for DevOps Engineers**

Dokumen ini berisi rangkuman sintaks, rumus, dan aturan main (best practices) dari materi Bash Scripting. Gunakan ini sebagai referensi cepat saat membangun script otomatisasi.

---

## 📋 Daftar Isi
1. [Anatomi Script](#1-anatomi-script-structure)
2. [Variables (Penyimpanan Data)](#2-variables-penyimpanan-data)
3. [Input & Arguments](#3-input--arguments)
4. [Aritmatika (Math)](#4-aritmatika-math)
5. [Logic & Decisions (If/Else)](#5-logic--decisions-ifelse)
6. [Loops (Perulangan)](#6-loops-perulangan)
7. [Error Handling](#7-error-handling)

---

## 1. Anatomi Script (Structure)
Agar file teks dikenali dan bisa dijalankan oleh sistem operasi Linux.

### Syntax Dasar
```bash
#!/bin/bash             # SHEBANG: Wajib ada di Baris 1
# Ini adalah komentar   # Catatan (Diabaikan komputer)

echo "Hello World"      # Perintah
exit 0                  # Keluar dengan status Sukses
⚠️ Wajib DiingatShebang (#!/bin/bash): Tanpa ini, sistem menebak interpreter yang dipakai. Bisa error jika sistem defaultnya bukan Bash.Permission: Script tidak bisa jalan sebelum diberi izin.Bashchmod +x nama_script.sh
./nama_script.sh
2. Variables (Penyimpanan Data)Menyimpan konfigurasi agar dinamis dan mudah diubah.SyntaxBash# MENYIMPAN (Assign)
# Aturan Fatal: DILARANG ada spasi di sebelah tanda sama dengan (=)
NAMA="Dewa"             # String
PORT=8080               # Integer
TANGGAL=$(date)         # Command Substitution (Hasil perintah linux)

# MEMANGGIL (Call)
echo "$NAMA"            # Gunakan tanda Dollar ($) dan kutip dua (")
3. Input & ArgumentsCara script menerima data dari luar.A. Arguments (DevOps Standard)Digunakan untuk otomatisasi (CI/CD, Robot). Data dikirim saat perintah dijalankan../script.sh data1 data2VariableFungsi$1Argumen pertama$2Argumen kedua$0Nama script itu sendiri$#Total jumlah argumenB. Interactive (User Input)Digunakan untuk tool manual. Script berhenti menunggu ketikan manusia.Bashecho "Masukkan nama:"
read NAMA_USER
4. Aritmatika (Math)Bash tidak otomatis menghitung. Wajib menggunakan kurung ganda.SyntaxBash# $(( ... ))
HASIL=$(( 10 + 20 ))
SISA=$(( A - B ))
Catatan: Bash hanya mendukung Integer (Bilangan Bulat). 10 / 4 hasilnya 2, bukan 2.5.5. Logic & Decisions (If/Else)Otak dari script untuk mengambil keputusan.SyntaxBash# Perhatikan SPASI setelah '[' dan sebelum ']'
if [ "$NAMA" = "Dewa" ]; then
    echo "Akses Diterima"
else
    echo "Akses Ditolak"
fi
Cheat Sheet OperatorTipeOperatorArtiContohAngka-eqEqual (Sama dengan)[ $A -eq 10 ]-neNot Equal (Tidak sama)[ $A -ne 0 ]-ltLess Than (Kurang dari)[ $A -lt 5 ]-gtGreater Than (Lebih dari)[ $A -gt 100 ]String=Teks sama persis[ "$A" = "admin" ]-zString kosong[ -z "$1" ]File-fFile ada[ -f "/etc/hosts" ]6. Loops (Perulangan)Melakukan tugas yang sama berulang kali (Bulk Action).SyntaxBash# Wildcard (*): Mengambil semua file .txt
for FILE in *.txt
do
    echo "Memproses backup: $FILE..."
    cp "$FILE" "$FILE.bak"
done
7. Error HandlingMembuat script tangguh (Robust) dan tidak ceroboh.SyntaxBash# 1. Cek Exit Code Manual ($?)
mkdir /root/folder_rahasia
if [ $? -ne 0 ]; then
    echo "GAGAL: Tidak punya akses root!"
    exit 1  # Stop script seketika
fi

# 2. Operator Cepat (Short-Circuit)
# && (DAN) -> Jalan Kanan jika Kiri SUKSES
sudo apt update && sudo apt upgrade

# || (ATAU) -> Jalan Kanan jika Kiri GAGAL
ping google.com || echo "Koneksi Internet Mati"
Created by Dewa | DevOps Journey 2025
