<?php
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $data = array();

        $ref = $_POST['ref'];
		$name = $_POST['name'];
		$delivery_date = $_POST['delivery_date'];
		$address = $_POST['address'];
		$zipcode = $_POST['zipcode'];
		$url = $_POST['url'];

        $query = mysqli_query($con, "SELECT * FROM programs WHERE ref='$ref' AND name='$name' AND delivery_date='$delivery_date' AND address='$address' AND zipcode='$zipcode' AND url='$url'");
		
        $cek = mysqli_fetch_array($query);

        if(isset($cek) && $cek != null){
            $data['ref'] = $cek['ref'];
            $data['name'] = $cek['name'];
            $data['delivery_date'] = $cek['delivery_date'];
            $data['address'] = $cek['address'];
            $data['zipcode'] = $cek['zipcode'];
            $data['url'] = $cek['url'];
            echo json_encode($data);
        }else{
            $data['msg'] = "DATA TIDAK ADA";
            echo json_encode($data);
        }
        
        
    }
    
?>
