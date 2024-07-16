<?php
$koneksi = new mysqli('localhost', 'root', '', 'db_produk');
$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];
$data = mysqli_query($koneksi, "insert into users set username ='$username', email='$email', password='$password'");
if($data){
    echo json_encode([
        'pesan' => 'Registrasi Sukses'
    ]);
}else{
    echo json_encode([
        'pesan' => 'Registrasi Gagal'
    ]);
}
?>