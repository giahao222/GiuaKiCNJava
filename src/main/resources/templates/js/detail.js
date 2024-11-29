$(document).ready(function () {
  var currentURL = new URL(window.location.href);
  var id = currentURL.searchParams.get('id');

  fetch(`/api/detail?id=${id}`)
    .then((response) => response.json())
    .then((data) => {
      console.log(data);
      var detailProduct = $('#detailProduct');
      var stringHtml = mapDataString(data);
      detailProduct.html(stringHtml);
    })
    .catch((error) => {
      console.log(error);
    });

  mapDataString = (data) => {
    var stringHtml = '';
    var sizeString = '';
    var sizeList = data.size.split(',');
    var colorList = data.colors.split(',');
    var colorString = '';
    sizeList.forEach((size) => {
      sizeString += `
        <div class="custom-control custom-radio custom-control-inline">
              <input type="radio" class="custom-control-input" id="${size}" name="size" value="${size}">
              <label class="custom-control-label" for="${size}">${size}</label>
        </div>
        `;
    });

    colorList.forEach((color) => {
      colorString += `
        <div class="custom-control custom-radio custom-control-inline">
            <input type="radio" class="custom-control-input" id="${color.toLowerCase()}" name="color" value="${color}">
            <label class="custom-control-label" for="${color.toLowerCase()}">${color}</label>
        </div>
        `;
    });

    stringHtml += `
      <div class="col-lg-5 pb-5">
        <div id="product-carousel" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner border">
              <div class="carousel-item active">
                  <img class="w-100 h-100" src="${data.image}" alt="Image">
              </div>
              <div class="carousel-item">
                  <img class="w-100 h-100" src="${data.image}" alt="Image">
              </div>
          </div>
          <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
              <i class="fa fa-2x fa-angle-left text-dark"></i>
          </a>
          <a class="carousel-control-next" href="#product-carousel" data-slide="next">
              <i class="fa fa-2x fa-angle-right text-dark"></i>
          </a>
        </div>
      </div>
      
      <div class="col-lg-7 pb-5">
        <input type="hidden" name="id" value="${data.id}">
        <input type="hidden" name="name" value="${data.name}">
        <input type="hidden" name="price" value="${data.price}">
        <input type="hidden" name="image" value="${data.image}">
        <h1 class="font-weight-semi-bold">${data.name}</h1>
        <h3 class="font-weight-semi-bold mb-4">$${data.price}</h3>
        <p class="mb-4">${data.description}</p>
        <div class="d-flex mb-3">
          <p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
            <div>${sizeString}</div>
        </div>

        <div class="d-flex mb-4">
          <p class="text-dark font-weight-medium mb-0 mr-3">Colors:</p>
          <div>${colorString}</div>
        </div>
        <div class="d-flex align-items-center mb-4 pt-2">
          <div class="input-group quantity mr-3" style="width: 130px;">
            <div class="input-group-btn">
              <button type="button" class="btn btn-primary btn-minus" >
                <i class="fa fa-minus"></i>
              </button>
            </div>
            <input id="quantity" type="text" class="form-control bg-secondary text-center" value="1">
            <div class="input-group-btn">
              <button type="button" class="btn btn-primary btn-plus">
                <i class="fa fa-plus"></i>
              </button>
            </div>
          </div>
            <button class="btn btn-primary px-3 btn-submit" type="button">
              <i class="fa fa-shopping-cart mr-1"></i>
              Add To Cart
            </button>
        </div>  
      </div>
      `;
    return stringHtml;
  };

  $(document).on('click', '.btn-plus', function () {
    console.log('plus');
    var quantity = $('#quantity').val();
    quantity++;
    $('#quantity').val(quantity);
  });

  $(document).on('click', '.btn-minus', function () {
    console.log('minus');
    var quantity = $('#quantity').val();
    if (quantity > 1) {
      quantity--;
    }
    $('#quantity').val(quantity);
  });

  $(document).on('click', '.btn-submit', function () {
    const id = $('input[name="id"]').val();
    const name = $('input[name="name"]').val();
    const price = $('input[name="price"]').val();
    const image = $('input[name="image"]').val();
    const size = $('input[name="size"]:checked').val();
    const color = $('input[name="color"]:checked').val();
    const quantity = $('#quantity').val();
    const data = {
      name: name,
      productId: id,
      price: price,
      image: image,
      size: size,
      color: color,
      quantity: quantity,
    };
    console.log(data);
    fetch('api/cart', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data),
    })
      .then((response) => {
        if (!response.ok) {
          alert('Add to cart failed');
        }
        window.location.href = '/cart';
      })
      .then((data) => {
        console.log(data);
      })
      .catch((error) => {
        console.log(error);
      });
  });
});
