$(document).ready(function(){
    $("#panelinstrucc").focus();
    //para ocultar descripciones aria
    $('div[name=Adesc]').hide();

    $('.cont').addClass('hide');
    count=$('.questions').length;
     $('#question'+1).removeClass('hide');
     
     $(document).on('click','.next',function(){
         last=parseInt($(this).attr('id'));     
         nex=last+1;
         $('#question'+last).addClass('hide');
         
         $('#question'+nex).removeClass('hide');
     });
     
     $(document).on('click','.previous',function(){
             last=parseInt($(this).attr('id'));     
             pre=last-1;
             $('#question'+last).addClass('hide');
             
             $('#question'+pre).removeClass('hide');
     });

     $(document).on('click','.return',function(){
       window.location.href = "totales.php";
     });

});

