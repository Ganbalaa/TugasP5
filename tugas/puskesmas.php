<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "dbpuskesmas";

// Buat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Query untuk menampilkan semua data
$sql = "SELECT * FROM pasien";
$result = $conn->query($sql);

// Tampilkan data
if ($result->num_rows > 0) {
    echo "<table border='1'>";
    echo "<tr><th>ID</th><th>Nama</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>".$row["id"]."</td><td>".$row["nama"]."</td></tr>";
    }
    echo "</table>";
} else {
    echo "Data tidak ada";
}

// Tutup koneksi
$conn->close();
?>