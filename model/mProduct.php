<?php
    include_once("connect.php");

    class MProduct {
        function selectAllProducts() {
            $p = new ConnectDB();
            // $con;
            if ($p->connect_DB($con)) {
                $str = "SELECT * FROM sanpham";
                $tbl = mysqli_query($con, $str); // Use mysqli_query with the connection parameter
                $p->closeDB($con);
                return $tbl;
            } else {
                return false;
            }
        }

        function selectAllProductBySearch($search){
            $p = new ConnectDB();
            // $con;
            if($p -> connect_DB($con)){
                $str = "SELECT * FROM sanpham WHERE TenSanPham like N'%$search%'";
                $tbl = mysqli_query($con, $str);
                $p -> closeDB($con);
                return $tbl;
            }else{
                return false;
            }
        }

        function selectDelProduct($MaSanPham){
            $p = new ConnectDB();
            // $con;
            if($p -> connect_DB($con)){
                $str = "UPDATE sanpham SET trangThai = '0' WHERE MaSanPham = '$MaSanPham' LIMIT 1 ;";
                $tbl = mysqli_query($con, $str);
                $p -> closeDB($con);
                return $tbl;
            }else{
                return false;
            }
        }

        function insertProduct($tenSP, $slt, $moTa, $giaBan, $giaNhap, $thuongHieu, $tenAnh, $hsd, $loaiSP, $nhaCC){
            $p = new ConnectDB();
            // $con;
            if($p -> connect_DB($con)){
                $str = "
                INSERT INTO `sanpham` (
                    `MaSanPham`, 
                    `TenSanPham`, 
                    `SoLuongTon`, 
                    `MoTa`, 
                    `GiaBan`, 
                    `GiaNhap`, 
                    `ThuongHieu`, 
                    `HinhAnh`, 
                    `HanSuDung`, 
                    `LoaiSanPham`, 
                    `NhaCungCap`, 
                    `trangThai`) 
                    VALUES ('TEST3', '$tenSP', '$slt', '$moTa', '$giaBan', '$giaNhap', '$thuongHieu', '$tenAnh', '$hsd', '$loaiSP', '$nhaCC', '1');
                ";
                echo"<script>alert('$str')</script>";
                $tbl = mysqli_query($con, $str);
                $p -> closeDB($con);
                return $tbl;
            }else{
                return false;
            }
        }




        function selectProductToEdit($MaSanPham){
            $p = new ConnectDB();
            // $con;
            if($p -> connect_DB($con)){
                $str = "SELECT * FROM sanpham WHERE MaSanPham = '$MaSanPham' LIMIT 1 ;";
                $tbl = mysqli_query($con, $str);
                $p -> closeDB($con);
                return $tbl;
            }else{
                return false;
            }
        }


        function updateProduct($ma, $ten, $slt, $moTa, $giaBan, $giaNhap, $thuongHieu, $nameImg, $hsd, $loaiSP, $nhaCC){
            $p = new ConnectDB();
            // $con;
            if($p -> connect_DB($con)){
                if($nameImg != ""){ // nếu có hình
                    $img = " `HinhAnh` = '$nameImg',";
                }else{
                    $img = "";
                }
                $str = "
                UPDATE `sanpham` SET 
                `TenSanPham` = '$ten', 
                `SoLuongTon` = '$slt',
                `MoTa` = '$moTa',  
                `GiaBan` = '$giaBan', 
                `GiaNhap` = '$giaNhap', 
                `ThuongHieu` = '$thuongHieu', 
                $img
                `HanSuDung` = '$hsd', 
                `LoaiSanPham` = '$loaiSP', 
                `NhaCungCap` = '$nhaCC', 
                `trangThai` = '1' 
                WHERE `MaSanPham` = '$ma';
                ";
                echo"<script>alert('$str')</script>";
                $tbl = mysqli_query($con, $str);
                $p -> closeDB($con);
                return $tbl;
            }else{
                return false;
            }
        }
    }
?>