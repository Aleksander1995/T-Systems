alert('Я – JavaScript!');
 $(document).ready(function(){
 $(".tab_content .tab_item").not(":first").hide();
 $(".tab").click(function() {
     $(".tab").removeClass("active").eq($(this).index()).addClass("active");
     $(".tab_content .tab_item").hide().eq($(this).index()).fadeIn();
     var menu=$(this).text();
     alert(menu);
     if(menu == "Продукция"){
         $.ajax({
         type: "POST",
         url: "/getAll",
         success: function (data) {

             var myProducts = jQuery.parseJSON(data);
             console.log('success',myProducts[0].category);
             console.log('success',myProducts[0].productName);

             $('#product-out').html(myProducts[0].productName);
             alert(myProducts[0].productName);


         }
         });
         }
     }).eq(0).addClass("active");

 });
