#!/bin/bash

# --- BAGIAN 1: Mengambil Data (Input) ---
clear
echo "Siapa nama panggilanmu?"
read NAMA_USER                    # Script akan berhenti & menunggu ketikan user

HARI_INI=$(date)                  # Mengambil hasil perintah 'date' ke dalam variable
USER_ASLI=$(whoami)               # Mengambil user sistem yang sedang login

# --- BAGIAN 2: Menampilkan Data (Output) ---
clear
echo "========================================"
echo "Selamat Datang, Bos $NAMA_USER!"        # Memanggil variable NAMA_USER
echo "========================================"
echo "Laporan Sistem untuk User: $USER_ASLI"
echo "Waktu Laporan            : $HARI_INI"
echo "========================================"
echo "Semua sistem terpantau AMAN."
