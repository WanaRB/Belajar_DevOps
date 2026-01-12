#!/bin/bash

# 1. Buat Fungsi 'print_header' yang menerima 1 argumen ($1)
print_header() {
	echo "======================================"
	echo "START: $1"
	echo "======================================"
}

# 2. Panggil fungsi tersebut untuk 3 task tadi
print_header "Update System"
sleep 1
echo "✅ Sukses"

print_header "Install Nginx"
sleep 1
echo "✅ Sukses"

print_header "Config Firewall"
sleep 1
echo "✅ Sukses"
