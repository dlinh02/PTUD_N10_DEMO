<?php
include_once("Model/mDetailsProduct.php");
class CDetailsProduct
{

    function handleAddToCart()
    {

        if (isset($_REQUEST["submitAddToCart"])) {
            
            if (!isset($_SESSION['MaKhachHang'])) {
                header('location: view/dangnhap.php');
                exit();
            }

            $quantity = $_REQUEST["quantity"];
            $idProduct = $_REQUEST["idProduct"];
            $idCustommer = getIdCustommer();
            // kiểm tra số lượng sản phầm, nếu không đủ trả về số lượng còn trong kho
            $resultCheckQuantityProduct = checkQuantityProduct($quantity, $idProduct);

            // kiểm tra sản phẩm đã tổn tại trong giỏ hàng chưa, nếu có trả về số lượng sản phẩm
            $resultCheckProductsAlreadyInCart = checkProductsAlreadyInCart($idProduct, $idCustommer);

            if ($resultCheckQuantityProduct) {

                // nếu sản phẩm đã tồn tại thì cập nhật sản phẩm trong giỏ hàng
                if ($resultCheckProductsAlreadyInCart) {

                    // cộng số lượng thêm mới và số lượng đã có trong giỏ hàng
                    $quantity +=  $resultCheckProductsAlreadyInCart;
                    $responAddToCart = updateProductInCart($quantity, $idProduct, $idCustommer);
                } else {
                    $responAddToCart = addToCart($quantity, $idProduct, $idCustommer);
                }


                if ($responAddToCart) {
                    echo "<script> alert('thêm sản phầm vào giỏ hàng thành công') </script>";
                } else {
                    echo "<script> alert('thêm sản phầm vào giỏ hàng thất bại') </script>";
                }
            } else {
                echo "<script>alert('số lượng sản phẩm tồn kho không đủ')</script>";
            }
        };
    }
}

function addToCart($quantity, $idProduct, $idCustommer)
{
    $p = new MDetailsProduct();

    $tbl = $p->addToCart($quantity, $idProduct, $idCustommer);
    return $tbl;
};

function updateProductInCart($quantity, $idProduct, $idCustommer)
{
    $p = new MDetailsProduct();
    $tbl = $p->updateProductInCart($quantity, $idProduct, $idCustommer);
    return $tbl;
};

function getIdCustommer()
{
    if (isset($_SESSION['MaKhachHang'])) {
        return $_SESSION['MaKhachHang'];
    } else {
        header('PTUD_N10_DEMO/view/dangnhap.php');
    }
}

function checkQuantityProduct($quantity, $idProduct)
{
    $m = new MDetailsProduct();
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
    
        return false;
    }
}

function checkProductsAlreadyInCart($idProduct, $idCustommer)
{
    $m = new MDetailsProduct();
    $resultProductsInStock = $m->checkProductsAlreadyInCart($idProduct, $idCustommer);
    $row = mysqli_fetch_assoc($resultProductsInStock);

    // nếu sản phẩm đã tồn tài trong giỏ hàng
    if ($row) {
        return $row['SoLuong'];
    } else {
        return false;
    }
}
