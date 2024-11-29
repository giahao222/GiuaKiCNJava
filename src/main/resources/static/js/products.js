(function ($) {
  'use strict';

  // Dropdown on mouse hover
  $(document).ready(function () {
    var currentURL = new URL(window.location.href);
    if (currentURL.pathname === '/products') {
      fetchProducts('/api/products');

      fetch('api/colors')
        .then((response) => response.json())
        .then((data) => {
          console.log(data);
          var productColors = $('#product_colors');
          var stringHtml = mapDataString(data);
          productColors.html(stringHtml);
        })
        .catch((error) => {
          console.log(error);
        });
    }
  });

  const fetchProducts = (url) => {
    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        var productList = $('#productList');
        var stringHtml = mapDataString(data);
        productList.html(stringHtml);
      })
      .catch((error) => {
        console.log(error);
      });
  };

  // Map Data
  const mapDataString = (data) => {
    var stringHtml = '';
    data.forEach((product) => {
      stringHtml += `
        <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
            <div class="card product-item border-0 mb-4">
                <div
                    class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <a href="/detail?id=${product.id}"><img class="img-fluid w-100" src="${product.image}" alt="" ></a>
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h6 class="text-truncate mb-3">${product.name}</h6>
                    <div class="d-flex justify-content-center">
                        <h6>$${product.price}</h6>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-between bg-light border">
                    <a href="/detail?id=${product.id}" class="btn btn-sm text-dark p-0"><i
                            class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                    <a href="" class="btn btn-sm text-dark p-0"><i
                            class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                </div>
            </div>
        </div>
        `;
    });
    return stringHtml;
  };
})(jQuery);
