# Palsu

Bohongan adalah zero-config JSON server untuk mocking REST APIs, dibangun menggunakan Elixir. Terinspirasi dari [json-server](https://github.com/typicode/json-server), Bohongan menyediakan REST API palsu yang bisa langsung digunakan untuk prototyping dan mocking.

## Fitur

- ✨ Tanpa konfigurasi
- 🚀 REST API lengkap berdasarkan struktur data
- 📦 Mendukung GET, POST, PUT, DELETE
- 🔄 Auto-routes untuk semua resources
- 💾 In-memory storage

## Instalasi

```bash
# Clone repository
git clone https://github.com/raizora/bohongan.git
cd bohongan

# Install dependencies
mix deps.get
```

## Penggunaan

Ada tiga cara untuk menjalankan server:

### 1. Development Mode (dengan IEx shell)

```bash
iex -S mix
```

### 2. Production Mode (dengan Mix)

```bash
mix run --no-halt
```

### 3. Production Release

Untuk environment production yang lebih optimal, gunakan release:

```bash
# Build release
./scripts/build.sh

# Jalankan server
./scripts/start.sh

# Atau dengan custom port
PORT=3000 ./scripts/start.sh
```

## Konfigurasi

Server dapat dikonfigurasi menggunakan environment variables:

```bash
# Mengubah port (default: 4000)
PORT=3000 iex -S mix
```

## API Endpoints

### GET /:path
Mengambil data dari path tertentu

```bash
curl http://localhost:4000/users
```

### POST /:path
Membuat data baru

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"name":"John","email":"john@example.com"}' \
  http://localhost:4000/users
```

### PUT /:path
Mengupdate data yang ada

```bash
curl -X PUT \
  -H "Content-Type: application/json" \
  -d '{"name":"John Updated","email":"john@example.com"}' \
  http://localhost:4000/users/1
```

### DELETE /:path
Menghapus data

```bash
curl -X DELETE http://localhost:4000/users/1
```

## Contoh Penggunaan

```bash
# Start server
iex -S mix

# Buat user baru
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"name":"Budi","email":"budi@example.com"}' \
  http://localhost:4000/users

# Ambil semua users
curl http://localhost:4000/users

# Buat post untuk user
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"title":"Post Pertama","content":"Isi post","userId":1}' \
  http://localhost:4000/posts

# Ambil semua posts
curl http://localhost:4000/posts
```

## Berkontribusi

Kami sangat terbuka untuk kontribusi! Silakan buat issue atau pull request di GitHub.

## Lisensi

MIT