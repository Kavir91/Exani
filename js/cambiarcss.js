
$(document).ready(function(){
var pasa = true;
    $(document).keydown(function(event){
	console.log(event);
        if(event.shiftKey&&(event.key==="z"||event.key==="Z")){
		if(pasa){
			$('body').css("background","#929090").css("color","#000");
                        $('#query').css("background","#929090").css("color","#000").css("border","4px #000 solid");
                        $('h1,h2,h3,h4').css("background","#929090").css("color","#000");
                        $('p').css("font-size","2.3em");
                        
			pasa=false;
		}else{
			$('body').css("background","#000").css("color","#fff");
                        $('#query').css("background","#000").css("color","#fff").css("border","4px #fff solid");
                        $('h1,h2,h3,h4').css("background","#000").css("color","#fff");
                        $('#logueo').css("background","#929090").css("color","#fff").css("border","4px #000 solid");
			pasa=true;
		}	
	}
    });
});
