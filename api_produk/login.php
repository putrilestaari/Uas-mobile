<?php
$koneksi = new mysqli('localhost', 'root', '', 'db_produk');
$username = $_POST['username'];
$password = $_POST['password'];

$data = mysqli_query($koneksi, "SELECT * FROM users WHERE username ='$username' AND password ='$password'");
$result = mysqli_fetch_array(mysqli_query($koneksi, $data));
if($result){
    echo json_encode([
        'pesan' => 'login Sukses'
    ]);
}else{
    echo json_encode([
        'pesan' => 'login Gagal'
    ]);
}
?>