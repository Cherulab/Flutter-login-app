<?php
    $con = mysqli_connect('localhost', 'root', 'root', 'userdata') or die('tidak terkoneksi');
    error_log(print_r($_POST, true)); 
?>