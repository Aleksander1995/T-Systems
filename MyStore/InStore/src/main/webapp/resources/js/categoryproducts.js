function sendId(e) {
    var idProduct=+e;
    $.ajax({
        type: "POST",
        url: "/putBasket",
        data:{ id: idProduct},
        success: function () {
            $('#forBasket'+e).html('<img src="../../resources/images/basket-accept.png" onclick="sendId(${(product).id})" class="basket2">');
            $('#basket').html(' <a href="/getBasket"><img src="../../resources/images/basket-full.jpg" alt="Наша корзина"/></a>');
            $('#forBasket'+e+' .basket2').css({"padding": "5px",
                "border":"solid 3px lawngreen",
                "border-radius": "0 30px 0 30px"});
        },
        error:function () {
            $('.basket2').css({"padding": "5px",
            "border":"solid 3px red",
            "border-radius": "0 30px 0 30px"});
        }
    });
}
$(document).ready(function () {

    $('.form-control').keyup(function () {

       var brand=$('#brand').val().toLowerCase();
       var color=$('#color').val().toLowerCase();
       var pricefrom=$('#price-from').val().toLowerCase();
       var priceto=$('#price-to').val().toLowerCase();

        $(".categoryProduct").each(function () {
         var productBrand = $(this.querySelector(".pr")).text().toLowerCase();
         var productColor= $(this.querySelector(".colors")).text().toLowerCase();
         var productPrice= $(this.querySelector(".price")).text().toLowerCase();
            if(productBrand.indexOf(brand)==-1 || productColor.indexOf(color)==-1 || !((+pricefrom)<=(+productPrice) && (+productPrice)<=(+priceto) || (pricefrom=="" && priceto==""))){
                $(this).hide();
            }else {
                $(this).show();
            }
        });
    });
});
