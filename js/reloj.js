 function playAud() {
     myaud.play();
 }

 function pauseAud() {
     myaud.pause();
     clearInterval(p);
     clearInterval(k);
 } 
  function playAud2() {
     myaud2.play();
 }

 function pauseAud2() {
     myaud2.pause();
     clearInterval(q);
     clearInterval(w);
 } 

$(document).ready(function() {
    var myaud = $('#aud2')[0].id;
    var myaud2 = $('#aud2')[0].id;
    setInterval(function(){playAud()}, 7200000);
    setInterval(function(){pauseAud()}, 7800000);
    setInterval(function(){playAud2()}, 8400000 );
    setInterval(function(){pauseAud2()}, 9000000);

});  
