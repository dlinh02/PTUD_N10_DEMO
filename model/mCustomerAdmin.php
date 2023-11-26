<?php
    include_once("connect.php");

    class MCustomer {
        function selectAllCustomers() {
            $p = new ConnectDB();
            // $con;
            if ($p->connect_DB($con)) {
                $str = "SELECT * FROM khachhang";
                $tbl = mysqli_query($con, $str); // Use mysqli_query with the connection parameter
                $p->closeDB($con);
                return $tbl;
            } else {
                return false;
            }
        }

        function selectAllCustomerBySearch($search){
            $p = new ConnectDB();
            // $con;
            if($p -> connect_DB($con)){
                $str = "SELECT * FROM khachhang WHERE SoDienThoai like N'%$search%' or MaKhachHang like N'%$search%' or HoTen like N'%$search%'";
                $tbl = mysqli_query($con, $str);
                $p -> closeDB($con);
                return $tbl;
            }else{
                return false;
            }
        }

        function selectDelCustomer($MaKhachHang){
            $p = new ConnectDB();
            // $con;
            if($p -> connect_DB($con)){
                $str = "UPDATE khachhang SET trangThai = '0' WHERE MaKhachHang = '$MaKhachHang' LIMIT 1 ;";
                $tbl = mysqli_query($con, $str);
                $p -> closeDB($con);
                return $tbl;
            }else{
                return false;
            }
        }
    }
?>