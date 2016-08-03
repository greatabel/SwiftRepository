var api_url = "http://139.224.73.50"
// api_url = "http://127.0.0.1:5000"

var canvas;
var ctx;
// var tileSheet;
var w = 0;
var h = 0;
var timer;
var updateStarted = false;
var touches = [];
var previous_touches = [];

var threecount = 0;
var previous_Y_bound = 0;
// whether to decting 3 touches to refresh UI
var isDetecting = true;
var centerX = 0;
var centerY = 0;

   
    // var x=50;
    // var y=50;
    var yA = 0;
    var yB = 0;

    var dx=0;
    var dy=-1;
     var theCanvas ;
      var context ;

    var counter=0;
  // var tileSheet=new Image();
  // var tileSheetL = document.getElementById('left_img');
  // var tileSheetR = document.getElementById('right_img');

  // tileSheet.addEventListener('load', eventSheetLoaded , false);
  // var imagepath = '{{ url_for('static', filename = '/images/ships.png') }}';
  // document.getElementById("test").innerHTML = "test:" + imagepath;
  // tileSheet.src= imagepath;
var whicheye = -1;
var temp = 0;
var sightValue = 0;
var myPPI = 0;

var myElementL = document.querySelector("#div_left_img");
var myElementR = document.querySelector("#div_right_img");
// for 1/3 pixel , 1/3 pixel
var counterTurn = 0;
var stepPx = 0;

  function drawScreen() {
      // y = y + dy;
      // x = x + dx;
     //draw a background so we can wee the Canvas edges
               
       // tileSheetL = document.getElementById('left_img');


   // myElement.style.backgroundColor = "#D93600";
   myElementL.style.top = (yA - 25 ) +"px";
   myElementL.style.left = (centerX - 25) + "px";
   myElementL.style.display = 'block';

   // myElementR.style.backgroundColor = "#D93600";
   myElementR.style.top = (yB - 25 ) +"px";
   myElementR.style.left = (centerX +2) + "px";
   myElementR.style.display = 'block';




    // myElement.style.top = yA - 25;

      // context.drawImage(tileSheet, 0, 0,32,32,50,50,32,32);

    // ctx.drawImage(tileSheetL, centerX-25, yA - 25);
    // ctx.drawImage(tileSheetR, centerX+2, yB - 25);

    // // ctx.drawImage(tileSheet, 0, 0,32,32,centerX-64,centerY-64,32,32);
    // // ctx.drawImage(tileSheet, 0, 0,32,32,centerX+32,centerY+32,32,32);
         counter++;
         if (counter >1) {
            counter=0;
         }
         // window.setTimeout(drawScreen, 200);

  };

    // function eventSheetLoaded() {
    //     drawScreen();
    // };

// fix : when 2 points on canvas then click savebutton , it will draw wrong picture
function isAppropriateThreePoint(touches) {
  var limit = 50;
  var flag = true;
  if (touches.length == 3) {
    x1 = touches[0].pageX 
    y1 = touches[0].pageY 
    x2 = touches[1].pageX 
    y2 = touches[1].pageY 
    x3 = touches[2].pageX 
    y3 = touches[2].pageY 
    var a = Math.sqrt(((x2-x1) * (x2-x1)) + ((y2-y1) * (y2-y1)));
    var b = Math.sqrt(((x3-x2) * (x3-x2)) + ((y3-y2) * (y3-y2)));
    var c = Math.sqrt(((x1-x3) * (x1-x3)) + ((y1-y3) * (y1-y3)));
      if(Math.abs(a-b) > limit || Math.abs(a-c) > limit || Math.abs(b-c) > limit) {
      // the 3 points is not right
      flag = false

    }    
 }
 return flag ;
}

function update(touches) {
  if (updateStarted) return;
  updateStarted = true;
  var nw = window.innerWidth;
  var nh = window.innerHeight;
  if ((w != nw) || (h != nh)) {
    w = nw ;
    h = nh - 125;
    canvas.style.width = w+'px';
    canvas.style.height = h+'px';
    canvas.width = w;
    canvas.height = h;
  }
  
  ctx.clearRect(0, 0, w, h);
  var i, len = touches.length;
  if (len > 3) {
    len = 3;
  }
  // var temp = '';

  ctx.beginPath();



var cx = document.querySelector("canvas").getContext("2d");
  cx.beginPath();
 centerX = 0;
 centerY = 0;


  for (i=0; i<len; i++) {
    var touch = touches[i];
    var px = touch.pageX;
    var py = touch.pageY;

   centerX += touch.pageX;
   centerY += touch.pageY;
  
    cx.moveTo(px, py);

    if (i+1 < len) {
      cx.lineTo(touches[i+1].pageX, touches[i+1].pageY);

    }

    // ctx.beginPath();
    // ctx.arc(centerX, centerY, 20, 0, 2*Math.PI, true);
    // ctx.fillStyle = "rgba(0, 0, 200, 0.2)";
    // ctx.fill();
    // ctx.lineWidth = 2.0;
    // ctx.strokeStyle = "rgba(0, 0, 200, 0.8)";
    // ctx.stroke();
    
    // ctx.arc(px, py, 20, 0, 2*Math.PI, true);
    // ctx.fillStyle = "rgba(0, 0, 200, 0.2)";
    // ctx.fill();
    // ctx.lineWidth = 2.0;
    // ctx.strokeStyle = "rgba(0, 0, 200, 0.8)";
   
    console.log('＃' + px +',' + py);
    // temp += (i+'h:' + px +',' + py);
    // document.getElementById("content").innerHTML =  document.getElementById("content").innerHTML ＋ ',px=' +px +',py='+py;
  }

    if (len > 0) {
      // cx.moveTo(touches[0].pageX, touches[0].pageY);
      cx.lineTo(touches[0].pageX, touches[0].pageY);
      centerX = centerX/3;
      centerY = centerY/3;
    }
    cx.strokeStyle = "rgba(255, 0, 0, 1)";
    cx.stroke();

    

  if (len > 2) {
    x1 = touches[0].pageX 
    y1 = touches[0].pageY 
    x2 = touches[1].pageX 
    y2 = touches[1].pageY 
    x3 = touches[2].pageX 
    y3 = touches[2].pageY 

    var a = Math.sqrt(((x2-x1) * (x2-x1)) + ((y2-y1) * (y2-y1)));
    var b = Math.sqrt(((x3-x2) * (x3-x2)) + ((y3-y2) * (y3-y2)));
    var c = Math.sqrt(((x1-x3) * (x1-x3)) + ((y1-y3) * (y1-y3)));


    var r =   Math.sqrt(3) * (a + b + c) / 9;

    
    myPPI = r * window.devicePixelRatio * 25.4/ 19;
    previous_Y_bound = centerY + r + 10;

    // draw center 
    ctx.fillRect(centerX, centerY, 2,2);

    ctx.beginPath();
    ctx.arc(centerX, centerY, r, 0, 2*Math.PI, true);
    ctx.fillStyle = "rgba(255,255,255, 0.9)";
    ctx.fill();
    ctx.lineWidth = 2.0;
    ctx.strokeStyle = "rgba(0, 0, 200, 0.8)";
    ctx.stroke();
    
      // y = centerY ;
     counter=0
     if (  yA > centerY + r || yA < centerY - r || yB > centerY + r || yB < centerY - r) {
      yA = centerY;
      yB = centerY;
     }


  


    // drawScreen();
    
    // if ( r > 0 ) {
    //   clearInterval(timer);
    // }

  

    // temp += 'lena:'+ a +'r:' +r + 'radio:' + window.devicePixelRatio


  }
  // document.getElementById("content").innerHTML = temp;
  updateStarted = false;

}


    
   function moveTop(){ 

      if (temp % 2 === 0) {
         yA = yA + stepPx;  
      } else {
         yB = yB - stepPx;
      }


      // x = x + 2;
      update(previous_touches);
      drawScreen();
      window.setTimeout(drawScreen, 200);

};

function moveDown(){
      if (temp % 2 === 0) {
          yA = yA - stepPx;
      } else {
          yB = yB + stepPx;
      }
          // x = x + 2;
     update(previous_touches);
     drawScreen();

    window.setTimeout(drawScreen, 200);
}


function ol() {
  canvas = document.getElementById('canvas');
  ctx = canvas.getContext('2d');
       // tileSheet=new Image();
       //   tileSheet.src="ships.png";
   // tileSheetL = document.getElementById('left_img');
   // tileSheetR = document.getElementById('right_img');

    myElementL = document.querySelector("#div_left_img");
    myElementR = document.querySelector("#div_right_img");
    counterTurn = window.devicePixelRatio;

  update(touches);

  if(whicheye < 0) {
  $('#saveButton').prop('disabled', true);
  }
  // temp = Math.floor((Math.random() * 100) + 1);
  //  document.getElementById("measureResult").innerHTML = temp;

  // timer = setInterval(update, 200);
  // var timer1 = setInterval(drawScreen, 200);

// canvas.addEventListener('touchend', function() {
//   // ctx.clearRect(0, 0, w, h);
//   // drawScreen()
// });
// canvas.addEventListener('touchmove', function(event) {
//   event.preventDefault();
//   touches = event.touches;
// });
// canvas.addEventListener('touchstart', function(event) {
//   console.log('start');
// });

};

//------------------------

function myfilter(evt) {
  var filteredTouches = [];

  for (var i = 0; i < evt.touches.length ; i++) {
    if ( evt.touches[i].clientY >= previous_Y_bound) {
        filteredTouches.push(evt.touches[i]);
    }
  }
  return filteredTouches;
}

function circulateMeasure(p) {
    var returnValue = p * 25400 / myPPI;
    returnValue = 403 + 1.513 * returnValue;
    var floatingPointPart = (returnValue/25) % 1;
    var integerPart = Math.floor(returnValue/25);
    if(floatingPointPart >= 0.5){
      integerPart += 1;
    }
    returnValue = 25 * integerPart;
    return returnValue;
}

  
            document.addEventListener('touchstart', handleTouchStart, false);        
            document.addEventListener('touchmove', handleTouchMove, false);

            var xDown = null;                                                        
            var yDown = null;   

            var clickTimer = null;            
            var moveTimer = null; 

            function draw_measure(evt) {
                touches = evt.touches;
                if(isDetecting && evt.touches.length == 3) {
                   threecount += 1;
                   if (isAppropriateThreePoint(evt.touches))
                   {

                   
                  document.getElementById("content").innerHTML = "threecount:"+threecount+"isDetecting:"+isDetecting;




                if (moveTimer == null) {
                      moveTimer = setTimeout(function () {
                          moveTimer = null;
                          // alert("single");
                            isDetecting = false;
                     previous_touches = evt.touches;
                  // alert('a:'+JSON.stringify(previous_touches))
                    update(previous_touches)
                    yA = centerY;
                    yB = centerY;
                    drawScreen()
                      }, 200)
                  } else {
                      clearTimeout(moveTimer);
                      moveTimer = null;
                      isDetecting = true;
                      // alert("double"+ evt.touches.length);                  

                  }  

                }

                
                }
            }

            function handleTouchStart(evt) { 
                       draw_measure(evt); 
                var innerTouches = [];                                       
                if (!isDetecting) {
                innerTouches = myfilter(evt);
                } 
                else {
                innerTouches = evt.touches;
                }
                xDown = innerTouches[0].clientX;                                      
                yDown = innerTouches[0].clientY;
        // only area bellow measure need double touch
        if ( yDown >= previous_Y_bound) {
              if (clickTimer == null) {
                    clickTimer = setTimeout(function () {
                        clickTimer = null;
                        // alert("single");

                    }, 300)
                } else {
                    clearTimeout(clickTimer);
                    clickTimer = null;
                    // alert("double"+ evt.touches.length);
                    if(innerTouches.length == 1 ) {
                      var e = document.getElementById('showArea');
                      e.style.display = 'block';
                    }

                }
        }




            };                                                

            function handleTouchMove(evt) {
              
                evt.preventDefault();

                draw_measure(evt);

                var innerTouches = [];                                       
                if (!isDetecting) {
                innerTouches = myfilter(evt);
                } 
                else {
                innerTouches = evt.touches;
                }



                // document.getElementById("content").innerHTML = 'len:'+touches.length + '|'+xDown +'|'+ yDown;
                // alert('in handleTouchMove')
                if ( ! xDown || ! yDown ) {
                    return;
                }

                var xUp = innerTouches[0].clientX;                                    
                var yUp = innerTouches[0].clientY;

                var xDiff = xDown - xUp;
                var yDiff = yDown - yUp;

                if ( Math.abs( xDiff ) > Math.abs( yDiff ) ) {/*most significant*/
                    if ( xDiff > 0 ) {
                        /* left swipe */ 
                    } else {
                        /* right swipe */
                    }                       
                } else {

                     if(innerTouches.length == 1 && ( yUp >= previous_Y_bound) && (Math.abs( yDiff ) > 1) ) {
                      var e = document.getElementById('showArea');
                      e.style.display = 'none';
                    }

                    if (navigator.userAgent.indexOf('iPhone')) {
                          switch(window.devicePixelRatio)
                          {
                            case 1:
                              stepPx = 1;
                              break;
                            case 2:
                              myPPI = 326;
                              stepPx = 0.5;
                              break;
                            case 3:
                              myPPI = 401;
                              stepPx = 0.3333333;
                              break;
                            case 4:
                              stepPx = 0.25;
                              break;
                          }
                        }
                        

                    if ( yDiff > 0 ) {
                        /* up swipe */ 
                        temp += 1                    
                        sightValue = circulateMeasure(temp);


                        // document.getElementById("measureResult").innerHTML =  '<small>测量值:</small> <strong>'+sightValue +'</strong>'+"#ppi:"+myPPI+":"+temp;
                        document.getElementById("measureResult").innerHTML =  '<small>测量值:</small> <strong>'+sightValue +'</strong>' +window.devicePixelRatio;

                        moveTop();

                    } else { 
                        /* down swipe */
                        temp -= 1
                       sightValue = circulateMeasure(temp);

                        // document.getElementById("measureResult").innerHTML = '<small>测量值:</small> <strong>'+sightValue +'</strong>'+"#ppi:"+myPPI+":"+temp;
                        document.getElementById("measureResult").innerHTML = '<small>测量值:</small> <strong>'+sightValue +'</strong>';
                        moveDown();

                    }                                                                 
                }
                /* reset values */
                xDown = null;
                yDown = null;                                             
            };

function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,    
    function(m,key,value) {
      vars[key] = value;
    });
    return vars;
  }

// var bootstrap_alert = function() {}
// bootstrap_alert.warning = function(message) {
//         $('#alert_placeholder').html('<div class="alert alert-info" role="alert"><a class="close" data-dismiss="alert">×</a><span>'+message+'</span></div>')
//         }

function saveMeasure() {

   
    
  var patientid= getUrlVars()["patientid"];
  // document.getElementById("content").innerHTML= patientid +"保存成功！"



$.post( api_url + "/api/user/0/measures", { patientid: patientid, rawdata:sightValue, whicheye: whicheye })
  .done(function( data ) {
    reset();
    if(data == 201) {
      // document.getElementById("content").innerHTML= patientid +"保存成功！"
  // bootstrap_alert.warning('保存成功！');
    document.getElementById("measureResult").innerHTML = '保存成功！';

    }
  });

}
function reset() {
    isDetecting = true;
      myElementL.classList.remove("retina-border-scale");
    update(previous_touches);
    yA = centerY;
    yB = centerY;
   drawScreen();
     whicheye = -1;
   temp = 0;
   setRadio("radioR", "btn btn-primary btn-sm pull-left notActive");
   setRadio("radioL", "btn btn-primary btn-sm pull-right notActive");
     if(whicheye < 0) {
  $('#saveButton').prop('disabled', true);

  }
}

function cancelMeasure() {
    // isDetecting = true;

    // document.getElementById("content").innerHTML= "取消成功！"
      // document.getElementById("content").innerHTML= patientid +"保存成功！"
     // bootstrap_alert.warning('取消成功！');
    reset();
         document.getElementById("measureResult").innerHTML = '取消成功！';
  
}

// for fix bug : when multi-touch on screen ,the button is not received select/touch event
function touchStart_saveButton(event) {
  var  saveTouches = myfilter(event);
  if (saveTouches.length != event.touches.length && saveTouches.length == 1) {
     saveMeasure();
  }
 
}
function touchStart_cancelButton(event) {
  var  saveTouches = myfilter(event);
  if (saveTouches.length != event.touches.length && saveTouches.length == 1) {
     cancelMeasure();
  }
 
}



function setRadio(radioId, classvalue) {
    var radio = document.getElementById(radioId);
    radio.setAttribute("class", classvalue);
    radio.setAttribute("className", classvalue);
    $('#saveButton').prop('disabled', false);
}
function L() {
    setRadio("radioL", "btn btn-primary btn-sm pull-right");
    setRadio("radioR", "btn btn-primary btn-sm pull-left notActive");
    whicheye = 0;
}

function R(){
    setRadio("radioR", "btn btn-primary btn-sm pull-left");
    setRadio("radioL", "btn btn-primary btn-sm pull-right notActive");
    whicheye = 1;

}

function touchStart_L(event){
  L();
}

function touchStart_R(event){
  R();
}

// // $('#radioBtn a').on('click', function(){
//     alert('haha')
//     var sel = $(this).data('title');
//     var tog = $(this).data('toggle');
//     // $('#'+tog).prop('value', sel);
    
//     $('a[data-toggle="'+tog+'"]').not('[data-title="'+sel+'"]').removeClass('active').addClass('notActive');
//     $('a[data-toggle="'+tog+'"][data-title="'+sel+'"]').removeClass('notActive').addClass('active');
// // })