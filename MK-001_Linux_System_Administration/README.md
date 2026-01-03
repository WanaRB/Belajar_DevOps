# 🐧 Linux System Administration - Master Cheatsheet

> **Role:** DevOps Engineer Path  
> **Status:** ✅ Phase 1 Completed  
> **Focus:** CLI Mastery, Server Management, & Automation Prep

Dokumen ini adalah rangkuman teknis ("Cheat Sheet") dari materi Linux System Administration. Panduan ini dirancang untuk kebutuhan pengelolaan server *Headless* (Tanpa GUI) dan persiapan menuju Automation.

---

## 📂 1. Navigation & File Operations
*Dasar pergerakan di terminal. Jangan sampai tersesat.*

| Command | Fungsi |
| :--- | :--- |
| `pwd` | **Print Working Directory**. Mengecek posisi folder saat ini. |
| `ls -la` | List semua file (termasuk hidden file `.`) dengan detail izin & tanggal. |
| `cd [dir]` | Masuk folder. `cd ~` (Home), `cd ..` (Mundur satu level), `cd -` (Balik ke folder sebelumnya). |
| `mkdir -p [a/b]` | Buat folder (termasuk sub-foldernya jika belum ada). |
| `cp -r [asal] [tujuan]` | Copy folder dan isinya (**Recursive**). |
| `mv [asal] [tujuan]` | **Move**: Memindah file, atau **Rename**: Mengganti nama file. |
| `rm -rf [path]` | ⚠️ **Hapus Paksa** folder & isinya. Tidak ada Recycle Bin! |
| `man [command]` | Manual. Buku panduan lengkap untuk setiap perintah. |

> **💡 Pro Tip:** Linux itu **Case Sensitive**. `File.txt`, `file.txt`, dan `FILE.TXT` adalah tiga file yang berbeda.

---

## 📜 2. Text-Fu (Data Manipulation)
*Memproses teks, log, dan output tanpa membuka editor.*

| Command | Fungsi |
| :--- | :--- |
| `cat [file]` | Mencetak seluruh isi file ke layar. |
| `tail -f [file]` | **Follow**. Monitor ujung file secara *Real-Time* (Wajib untuk debugging Log). |
| `head -n 10 [file]` | Lihat 10 baris pertama file. |
| `grep "error" [file]` | Mencari baris yang mengandung kata "error". |
| `|` (Pipe) | Operan output perintah kiri ke perintah kanan. |
| `>` vs `>>` | `>` Menimpa (Overwrite). `>>` Menambah (Append) di baris baru. |
| `wc -l` | **Line Count**. Menghitung jumlah baris. |

> **💡 Power Combo:** `cat access.log | grep "404" | wc -l` (Hitung berapa kali error 404 terjadi).

---

## 🛡️ 3. User & Permissions (Security)
*Prinsip "Least Privilege": Berikan akses seminimal mungkin.*

| Command | Fungsi |
| :--- | :--- |
| `chmod 700 [file]` | **Private**. Hanya pemilik yang bisa baca/tulis/eksekusi. |
| `chmod 755 [file]` | **Standard Script/Dir**. Pemilik Full, orang lain cuma bisa Baca/Masuk. |
| `chmod +x [file]` | **Executable**. Memberi izin agar script bisa dijalankan (`./script.sh`). |
| `chown user:group [file]` | Mengganti pemilik dan grup file. |
| `sudo useradd -m [user]` | Membuat user baru beserta folder home-nya. |
| `sudo passwd [user]` | Mengatur/Reset password user. |

---

## ⚙️ 4. Process & Systemd (Service Management)
*Mengelola aplikasi background dan siklus hidup service.*

| Command | Fungsi |
| :--- | :--- |
| `ps aux` | Task Manager snapshot. Melihat semua proses & PID yang berjalan. |
| `htop` / `top` | Task Manager interaktif. Monitor CPU/RAM real-time. |
| `kill [PID]` | Menghentikan proses secara sopan (SIGTERM). |
| `kill -9 [PID]` | ⚠️ **Force Kill**. Membunuh proses bandel seketika (SIGKILL). |
| `systemctl start [app]` | Menyalakan service **Sekarang**. |
| `systemctl enable [app]` | Menyalakan service **Otomatis saat Booting**. |
| `systemctl status [app]` | Cek kesehatan service (Active/Dead/Failed). |

> **💡 PID (Process ID):** Nomor identitas unik setiap aplikasi yang berjalan. Gunakan PID untuk mematikan aplikasi yang hang.

---

## 💾 5. Storage & Filesystem
*Manajemen Disk, Partisi, dan Mounting.*

| Command | Fungsi |
| :--- | :--- |
| `df -h` | Cek sisa kapasitas disk (**Human Readable** -> GB/MB). |
| `du -sh [dir]` | Cek ukuran total sebuah folder tertentu. |
| `lsblk` | Melihat struktur pohon disk, partisi, dan mount point. |
| `blkid` | Mengecek **UUID** disk (Penting untuk config fstab). |
| `mount [dev] [dir]` | Menempelkan disk ke folder agar terbaca sistem. |
| `umount [dir]` | Melepas disk dengan aman (Eject). |
| `ln -s [asli] [link]` | Membuat **Symlink** (Shortcut). |
| `/etc/fstab` | File konfigurasi untuk **Mounting Permanen** (Auto-mount saat boot). |

> **💡 Swap Memory:** "RAM Darurat" di harddisk. Mencegah server crash saat RAM fisik habis, meski performa melambat.

---

## 🕵️ 6. Logging & Troubleshooting
*Kotak hitam server untuk investigasi forensik.*

| File / Command | Fungsi |
| :--- | :--- |
| `/var/log/syslog` | Log umum sistem (Ubuntu/Debian). |
| `/var/log/auth.log` | Log keamanan (Siapa yang login? Siapa pakai sudo?). |
| `/var/log/nginx/` | Log aplikasi spesifik (contoh Web Server). |
| `dmesg` | Log Kernel/Hardware (Cek error disk, USB, driver saat boot). |
| `journalctl -xe` | Cek log error Systemd (Jika `systemctl start` gagal). |

---

## 🌐 7. Network Basics (Bonus Material)
*Perintah dasar jaringan yang wajib diketahui DevOps.*

| Command | Fungsi |
| :--- | :--- |
| `ip a` | Cek IP Address interface server. |
| `ping [ip]` | Cek koneksi ke server lain. |
| `curl localhost` | Test akses web server dari terminal (Browser teks). |
| `ss -lntp` | Cek **Port** berapa saja yang sedang terbuka/listen. |
| `ufw allow [port]` | Membuka firewall untuk port tertentu. |

---

## 🤖 8. Automation Prep (Bash & SSH)
*Jembatan transisi menuju Automation & Scripting.*

| Command | Fungsi |
| :--- | :--- |
| `ssh-keygen -t rsa` | Membuat pasangan kunci (Private 🔑 & Public 🔒). |
| `ssh-copy-id [user]@[ip]` | Memasang Public Key ke server (Agar login **Tanpa Password**). |
| `scp -P [port] [file] [tujuan]` | **Secure Copy**. Kirim file laptop ↔ server via SSH. |
| `tar -czvf [nama.tar.gz] [dir]` | Kompres folder (`c`=create, `z`=zip, `v`=verbose, `f`=file). |
| `export NAMA="Isi"` | Membuat Environment Variable sementara. |
| `nano ~/.bashrc` | Config user. Tempat simpan Alias dan Variable permanen. |
| `source ~/.bashrc` | Reload config bash agar perubahan terbaca instan. |

---

## 📝 9. Text Editors (Nano vs Vim)
*Alat tempur utama mengedit konfigurasi.*

| Fitur | Nano (Mudah) | Vim (Powerful) |
| :--- | :--- | :--- |
| **Save** | `Ctrl + O` | `:w` |
| **Exit** | `Ctrl + X` | `:q` |
| **Save & Exit** | - | `:wq` |
| **Force Exit** | `Ctrl + X` (lalu `N`) | `:q!` |
| **Mode** | Tidak ada (Langsung ketik) | `i` (Insert), `Esc` (Normal), `v` (Visual) |

> **💡 Recommendation:** Gunakan **Nano** untuk edit cepat. Pelajari **Vim** untuk efisiensi jangka panjang di lingkungan server minimalis.

---
*Created by Dewa - Software Engineering Student & Aspiring DevOps Engineer*
