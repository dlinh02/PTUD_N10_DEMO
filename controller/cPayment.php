<?php
include_once("Model/mPayment.php");
class CPay
{
    function getAllProduct()
    {
        $p = new MPay();
        $tbl = $p->getAllProduct();
        return $tbl;
    }

    function getInfoUsers()
    {
        $p = new MPay();
        $tbl = $p->getInfoUsers();
        return $tbl;
    }

    // function handlePay()
    // {
    //     if (isset($_REQUEST['btnPay'])) {
    //         $HoTen = $_REQUEST['HoTen'];
    //         $SoDienThoai = $_REQUEST['SoDienThoai'];
    //         $Email = $_REQUEST['Email'];
    //         $DiaChi = $_REQUEST['DiaChi'];
    //         $tongTien = $_REQUEST['TongTien'];
    //         $maSanPham = $_REQUEST['MaSanPham'];
    //         $maNhanVien = '1';
    //         $tongTienDonHang = $_REQUEST["tongTienDonHang"];
    //         $maKhachHang = $_SESSION['MaKhachHang'];
    //         $soLuong = $_REQUEST['SoLuong'];

    //         $p = new MPay();
    //         $tbl = $p->addOrder($HoTen, $SoDienThoai, $Email, $DiaChi, $tongTien, $maSanPham, $maNhanVien, $tongTienDonHang, $maKhachHang, $soLuong);
    //         return $tbl;
    //     }
    // }

    function handlePay()
    {
        if (isset($_REQUEST['btnPay'])) {
            $HoTen = $_REQUEST['HoTen'];
            $SoDienThoai = $_REQUEST['SoDienThoai'];
            $Email = $_REQUEST['Email'];
            $DiaChi = $_REQUEST['DiaChi'];
            $maNhanVien = '1'; // cho tạm là 1 sau này nhân viên sẽ là online 
            $tongTienDonHang = $_REQUEST["tongTienDonHang"];
            $maKhachHang = $_SESSION['MaKhachHang'];
            $tongTien = $_REQUEST['TongTien']; // mảng
            $maSanPham = $_REQUEST['MaSanPham']; // mảng 
            $soLuong = $_REQUEST['SoLuong']; // mảng
            $idOrder = false;

            $checkQuantity = true; //
            foreach ($maSanPham as $index => $item) {
                // kiểm tra số lượng tồn kho có đáp ứng được không
                $resultProductsInStock =  checkQuantityProduct($soLuong[$index], $maSanPham[$index]);
                if (!$resultProductsInStock) {
                    echo "<script> alert('số lượng của sản phẩm: $maSanPham[$index] trong kho không đủ') </script>";
                    $checkQuantity = false;
                }
            };
            
            if ($checkQuantity) {
                // tạo hoá đơn 
                $idOrder = createOrder($tongTienDonHang);
            }
            
            foreach ($maSanPham as $index => $item) {
                // nếu các thành phần kiểm tra đều đáp ứng đủ số lượng thì vào điều kiện này
                

                // nếu đã tạo đơn hàng thành công thì tạo chi tiết hoá đơn
                if ($idOrder) {
                    $result_createDetailsOrder = createDetailsOrder(
                        $HoTen,
                        $SoDienThoai,
                        $Email,
                        $DiaChi,
                        $tongTien[$index],
                        $maSanPham[$index],
                        $maNhanVien,
                        $maKhachHang,
                        $soLuong[$index],
                        $idOrder
                    );

                    // nếu thêm sản phẩm vào chi tiết sản phẩm thành công thì trừ đi số lượng đã thêm vào chi tiết
                    if ($result_createDetailsOrder) {
                        $quantityProductsInStock = getQuantityProduct($maSanPham[$index]);
                        updateProductsStock($maSanPham[$index], $quantityProductsInStock - $soLuong[$index]);
                        // xoả sản phẩm đã thanh toán trong  giỏ hàng
                        deleteProductInCart($maKhachHang, $maSanPham[$index]);
                        echo "<script> alert('thanh toán thành công')</script>";
                        echo header("refresh: 0; url = 'index.php?'");
                    }
                }
            }
        }
    }
}

function checkQuantityProduct($quantity, $idProduct)
{
    $m = new MPay();
    $quantityProductsInStock = 0;
    $resultProductsInStock = $m->getQuantityProductsInStock($idProduct);
    $row = mysqli_fetch_assoc($resultProductsInStock);

    // nếu kết quả tổn tại
    if ($row) {
        $quantityProductsInStock = $row['SoLuongTon'];
    }

    // kiểm tra số lượng thêm có bé hơn hoặc bằng số lượng tổn kho
    if ($quantity <= $quantityProductsInStock) {
        return true;
    } else {
        return $quantityProductsInStock;
    }
}

function createOrder($tongTienDonHang)
{
    $m = new MPay();
    $result = $m->createOrder($tongTienDonHang);

    return $result;
}

function createDetailsOrder(
    $HoTen,
    $SoDienThoai,
    $Email,
    $DiaChi,
    $tongTien,
    $maSanPham,
    $maNhanVien,
    $maKhachHang,
    $soLuong,
    $MaHoaDon
) {
    $m = new MPay();
    $result = $m->createDetailsOrder(
        $HoTen,
        $SoDienThoai,
        $Email,
        $DiaChi,
        $tongTien,
        $maSanPham,
        $maNhanVien,
        $maKhachHang,
        $soLuong,
        $MaHoaDon
    );

    return $result;
}

function getQuantityProduct($maSanPham)
{
    $m = new MPay();
    $result = $m->getQuantityProductsInStock($maSanPham);

    if ($result) {
        $row = mysqli_fetch_assoc($result);
        return $row['SoLuongTon'];
    } else {
        false;
    }
}

function updateProductsStock($maSanPham, $soLuong)
{
    $m = new MPay();
    $result = $m->updateProductsStock($maSanPham, $soLuong);
    if ($result) {
        return true;
    } else {
        false;
    }
}

function deleteProductInCart($maKhachHang, $maSanPham)
{
    $m = new MPay();
    $result = $m->deleteProductInCart($maKhachHang, $maSanPham);
    if ($result) {
        return true;
    } else {
        false;
    }
}
