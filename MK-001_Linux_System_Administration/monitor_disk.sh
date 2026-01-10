#!/bin/bash


echo "=== SIMULASI MONITORING DISK (CERDAS) ==="

TOTAL_DISK=500
echo "Kapasitas Total: $TOTAL_DISK GB"
echo "Masukkan jumlah disk yang terpakai (GB):"
read TERPAKAI

SISA=$((TOTAL_DISK - TERPAKAI))

echo "-----------------------------"
echo "Sisa Space: $SISA GB"

# --- LOGIKA BARU DI SINI ---
# Batas aman adalah 50 GB. Jika di bawah 50, Bahaya.

if [ "$SISA" -lt 50 ]; then
    echo "⚠️  STATUS: CRITICAL / BAHAYA!"
    echo "Tindakan: Segera hapus log sampah!"
else
    echo "✅ STATUS: AMAN"
    echo "Tindakan: Lanjut ngopi."
fi
# ---------------------------

echo "-----------------------------"
