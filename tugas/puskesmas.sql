-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Mar 2025 pada 03.58
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: puskesmas
--

-- --------------------------------------------------------

--
-- Struktur dari tabel kelurahan
--

CREATE TABLE kelurahan (
  id int(11) NOT NULL,
  nama varchar(45) NOT NULL,
  kec_id int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel kelurahan
--

INSERT INTO kelurahan (id, nama, kec_id) VALUES
(1, 'Kelurahan Neg', 1),
(2, 'Kelurahan Gla', 2),
(3, 'Kelurahan Sari', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel paramedik
--

CREATE TABLE paramedik (
  id int(11) NOT NULL,
  nama varchar(45) NOT NULL,
  gender char(1) DEFAULT NULL,
  tmp_lahir varchar(30) DEFAULT NULL,
  tgl_lahir date DEFAULT NULL,
  kategori enum('dokter','perawat','bidan') NOT NULL,
  telpon varchar(20) DEFAULT NULL,
  alamat varchar(100) DEFAULT NULL,
  unit_kerja_id int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel paramedik
--

INSERT INTO paramedik (id, nama, gender, tmp_lahir, tgl_lahir, kategori, telpon, alamat, unit_kerja_id) VALUES
(1, 'Dr. Herman', 'M', 'Pasuruan', '1986-03-21', 'dokter', '083124567890', 'Jl. Apel No. 10', 1),
(2, 'Dr. Ilma', 'F', 'Jakarta', '1980-06-12', 'dokter', '083124567890', 'Jl. Mangga No. 12', 2),
(3, 'Suster Lena', 'F', 'Jombang', '1994-09-01', 'perawat', '083124567890', 'Jl. Setapak No. 5', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel pasien
--

CREATE TABLE pasien (
  id int(11) NOT NULL,
  kode varchar(10) NOT NULL,
  nama varchar(45) NOT NULL,
  tmp_lahir varchar(30) DEFAULT NULL,
  tgl_lahir date DEFAULT NULL,
  gender char(1) DEFAULT NULL,
  email varchar(50) DEFAULT NULL,
  alamat varchar(100) DEFAULT NULL,
  kelurahan_id int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel pasien
--

INSERT INTO pasien (id, kode, nama, tmp_lahir, tgl_lahir, gender, email, alamat, kelurahan_id) VALUES
(1, 'P001', 'ALun Gani', 'Bogor', '1991-05-16', 'M', 'alun1@mail.com', 'Jl. Limau No. 10', 1),
(2, 'P002', 'Amanda', 'Bandung', '1999-08-24', 'F', 'atta@mail.com', 'Jl. Berjuang No. 5', 2),
(3, 'P003', 'Atta', 'Surabaya', '2000-11-15', 'M', 'manda@mail.com', 'Jl. Hidup No. 12', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel periksa
--

CREATE TABLE periksa (
  id int(11) NOT NULL,
  tanggal date NOT NULL,
  berat double DEFAULT NULL,
  tinggi double DEFAULT NULL,
  tensi varchar(20) DEFAULT NULL,
  keterangan varchar(100) DEFAULT NULL,
  pasien_id int(11) DEFAULT NULL,
  dokter_id int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel periksa
--

INSERT INTO periksa (id, tanggal, berat, tinggi, tensi, keterangan, pasien_id, dokter_id) VALUES
(1, '2025-03-10', 75.5, 166, '120/80', 'Pasien sehat', 1, 1),
(2, '2025-03-12', 60.5, 165, '110/70', 'Batuk', 2, 2),
(3, '2025-03-15', 70.3, 180, '130/90', 'Tekanan darah rendah', 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel unit_kerja
--

CREATE TABLE unit_kerja (
  id int(11) NOT NULL,
  nama varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel unit_kerja
--

INSERT INTO unit_kerja (id, nama) VALUES
(1, 'Unit Gawat Darurat'),
(2, 'Unit Poli Umum'),
(3, 'Unit Laboratorium');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel kelurahan
--
ALTER TABLE kelurahan
  ADD PRIMARY KEY (id);

--
-- Indeks untuk tabel paramedik
--
ALTER TABLE paramedik
  ADD PRIMARY KEY (id),
  ADD KEY unit_kerja_id (unit_kerja_id);

--
-- Indeks untuk tabel pasien
--
ALTER TABLE pasien
  ADD PRIMARY KEY (id),
  ADD KEY kelurahan_id (kelurahan_id);

--
-- Indeks untuk tabel periksa
--
ALTER TABLE periksa
  ADD PRIMARY KEY (id),
  ADD KEY pasien_id (pasien_id),
  ADD KEY dokter_id (dokter_id);

--
-- Indeks untuk tabel unit_kerja
--
ALTER TABLE unit_kerja
  ADD PRIMARY KEY (id);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel kelurahan
--
ALTER TABLE kelurahan
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel paramedik
--
ALTER TABLE paramedik
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel pasien
--
ALTER TABLE pasien
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel periksa
--
ALTER TABLE periksa
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel unit_kerja
--
ALTER TABLE unit_kerja
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel paramedik
--
ALTER TABLE paramedik
  ADD CONSTRAINT paramedik_ibfk_1 FOREIGN KEY (unit_kerja_id) REFERENCES unit_kerja (id) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel pasien
--
ALTER TABLE pasien
  ADD CONSTRAINT pasien_ibfk_1 FOREIGN KEY (kelurahan_id) REFERENCES kelurahan (id) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel periksa

--
ALTER TABLE periksa
  ADD CONSTRAINT periksa_ibfk_1 FOREIGN KEY (pasien_id) REFERENCES pasien (id) ON DELETE CASCADE,
  ADD CONSTRAINT periksa_ibfk_2 FOREIGN KEY (dokter_id) REFERENCES paramedik (id) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;