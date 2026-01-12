#!/bin/bash

# 1. Buat Fungsi 'print_header' yang menerima 1 argumen ($1)
print_header() {
	echo "======================================"
	echo "START: $1"
	echo "======================================"
}

# 2. Panggil fungsi tersebut
print_header "Update System"
sleep 1
echo "✅ Sukses"

print_header "Install Nginx"
sleep 1
echo "✅ Sukses"

print_header "Config Firewall"
sleep 1
echo "✅ Sukses"

#ketika dijalankan maka akan menghasilkan output: 
#======================================
#START: Update System
#======================================
#✅ Sukses
#======================================
#START: Install Nginx
#======================================
#✅ Sukses
#======================================
#START: Config Firewall
#======================================
#✅ Sukses
