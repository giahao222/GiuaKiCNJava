document.addEventListener("DOMContentLoaded", function () {
    // Tính toán tổng tiền (nếu có logic ở client-side)
    calculateTotal();
    function calculateTotal() {
        let total = 0;
        document.querySelectorAll(".productTotalPrice").forEach(priceElement => {
            const price = parseInt(priceElement.textContent.replace(' vnđ', '').replace(',', ''), 10);
            total += isNaN(price) ? 0 : price;
        });
        document.querySelector(".total span").textContent = total.toLocaleString() + ' vnđ';
    }
});

$(document).ready(function() {
    // Lắng nghe sự kiện click vào nút xóa
    $('button[data-target="#confirmDeleteModal"]').click(function() {
        var productIdToDelete = $(this).data('id');  // Lấy id của sản phẩm từ data-id

        // Hiển thị hộp thoại xác nhận
        var isConfirmed = confirm("Bạn có chắc chắn muốn xóa sản phẩm này?");

        if (isConfirmed) {
            // Nếu người dùng xác nhận, gửi yêu cầu xóa sản phẩm
            $.ajax({
                url: '/cart/delete/' + productIdToDelete,  // Đảm bảo URL đúng
                type: 'DELETE',  // Phương thức HTTP là DELETE
                success: function(response) {
                    alert("Sản phẩm đã được xóa khỏi giỏ hàng!");
                    $('#product-' + productIdToDelete).remove(); // Xóa sản phẩm khỏi giao diện mà không cần tải lại trang
                },
                error: function() {
                    alert('Xóa sản phẩm thất bại!');
                }
            });
        }
    });
});

document.getElementById("checkoutBtn").addEventListener("click", function() {
    // Gửi yêu cầu thanh toán đến backend
    fetch("/api/orders/create", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            // Dữ liệu đơn hàng (thay đổi theo cấu trúc dữ liệu của bạn)
            order: {
                userId: 1, // Ví dụ, id người dùng đăng nhập
                totalAmount: 100.00 // Tổng số tiền của đơn hàng
            },
            orderItems: [
                { productId: 1, quantity: 2, price: 50.00 }, // Ví dụ sản phẩm trong đơn hàng
                { productId: 2, quantity: 1, price: 50.00 }
            ]
        })
    })
    .then(response => response.json())
    .then(data => {
        // Xử lý phản hồi từ server
        console.log("Order created successfully", data);
        alert("Thanh toán thành công!"); // Hiển thị thông báo thanh toán thành công
        // Có thể chuyển hướng người dùng tới trang xác nhận thanh toán hoặc giỏ hàng
        window.location.href = "/"; // Ví dụ chuyển hướng tới trang cảm ơn
    })
    .catch(error => {
        console.error("Error creating order:", error);
        alert("Đã có lỗi xảy ra, vui lòng thử lại!");
    });
});

