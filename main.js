function validateFormNV() {
    var hoTen = document.getElementById('hoTen').value;
    var matkhau = document.getElementById('matkhau').value;
    var Email = document.getElementById('Email').value;
    var SDT = document.getElementById('SDT').value;
    var DiaChi = document.getElementById('DiaChi').value;

    // Khởi tạo đối tượng chứa thông báo lỗi
    var errorMessages = {
        hoTen: '',
        matkhau: '',
        Email: '',
        SDT: '',
        DiaChi: ''
    };

    // Kiểm tra điều kiện và lưu thông báo lỗi
    if (hoTen.trim() === '' || !/^[a-zA-Z\s]+$/.test(hoTen)) {
        errorMessages.hoTen = 'Họ và tên không được để trống và phải là chữ.';
    }

    if (matkhau.trim() === '') {
        errorMessages.matkhau = 'Mật khẩu không được để trống.';
    }

    if (Email.trim() === '' || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(Email)) {
        errorMessages.Email = 'Email không hợp lệ.';
    }

    if (SDT.trim() === '' || !/^[0]\d{9}$/.test(SDT)) {
        errorMessages.SDT = 'Số điện thoại không hợp lệ.';
    }

    if (DiaChi.trim() === '' || !/^[a-zA-Z\d][a-zA-Z\d\s]*[a-zA-Z]$/.test(DiaChi)) {
        errorMessages.DiaChi = 'Địa chỉ không hợp lệ.';
    }

    // Hiển thị thông báo lỗi trong thẻ <small>
    document.getElementById('hoTen-mess').innerHTML = errorMessages.hoTen;
    document.getElementById('matkhau-mess').innerHTML = errorMessages.matkhau;
    document.getElementById('Email-mess').innerHTML = errorMessages.Email;
    document.getElementById('SDT-mess').innerHTML = errorMessages.SDT;
    document.getElementById('DiaChi-mess').innerHTML = errorMessages.DiaChi;

    // Kiểm tra xem có thông báo lỗi nào không
    for (var field in errorMessages) {
        if (errorMessages[field] !== '') {
            return false; // Có ít nhất một lỗi, không submit form
        }
    }

    return true; // Không có lỗi, có thể submit form
}




function validateFormSP() {
    var tenSP = document.getElementById('tenSP').value;
    var thuongHieu = document.getElementById('thuongHieu').value;
    var SLT = document.getElementById('SLT').value;
    var giaNhap = document.getElementById('giaNhap').value;
    var giaBan = document.getElementById('giaBan').value;
    var HSD = document.getElementById('HSD').value;

    // Khởi tạo đối tượng chứa thông báo lỗi
    var errorMessages = {
        tenSP: '',
        thuongHieu: '',
        SLT: '',
        giaNhap: '',
        giaBan: '',
        HSD: ''
    };

    // Kiểm tra điều kiện và lưu thông báo lỗi
    if (tenSP.trim() === '') {
        errorMessages.tenSP = 'Tên sản phẩm không được để trống.';
    }

    if (thuongHieu.trim() === '') {
        errorMessages.thuongHieu = 'Thương hiệu không được để trống.';
    }

    if (SLT <= 0) {
        errorMessages.SLT = 'Số lượng tồn phải lớn hơn 0.';
    }

    if (giaNhap <= 0) {
        errorMessages.giaNhap = 'Giá nhập phải lớn hơn 0.';
    }

    if (giaBan <= giaNhap) {
        errorMessages.giaBan = 'Giá bán phải lớn hơn giá nhập.';
    }

    var currentDate = new Date().toISOString().split('T')[0];
    if (HSD <= currentDate) {
        errorMessages.HSD = 'Hạn sử dụng phải lớn hơn ngày hiện tại.';
    }

    // Hiển thị thông báo lỗi trong thẻ <small>
    document.getElementById('tenSP-mess').innerHTML = errorMessages.tenSP;
    document.getElementById('thuongHieu-mess').innerHTML = errorMessages.thuongHieu;
    document.getElementById('SLT-mess').innerHTML = errorMessages.SLT;
    document.getElementById('giaNhap-mess').innerHTML = errorMessages.giaNhap;
    document.getElementById('giaBan-mess').innerHTML = errorMessages.giaBan;
    document.getElementById('HSD-mess').innerHTML = errorMessages.HSD;

    // Kiểm tra xem có thông báo lỗi nào không
    for (var field in errorMessages) {
        if (errorMessages[field] !== '') {
            return false; // Có ít nhất một lỗi, không submit form
        }
    }

    return true; // Không có lỗi, có thể submit form
}
