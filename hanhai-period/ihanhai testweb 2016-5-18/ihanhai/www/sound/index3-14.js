  function my_sound(filename) {
      // document.getElementById("showDiv1").innerHTML= filename;
    var snd = new Audio(filename); // buffers automatically when created
    snd.play();
  }

function divFunction(){
    //Some code
     // my_sound("left.m4a");
     play_single_sound2();
     play_single_sound();
}

function divFunction1(){
    //Some code
     // my_sound("left.m4a");
     play_single_sound2();
     // play_single_sound();
}

function play_single_sound() {
    document.getElementById('audiotag1').play();
    document.getElementById("content").innerHTML = 'play_single_sound';
  }

function play_single_sound2() {
    document.getElementById('audiotag2').play();
    document.getElementById("content").innerHTML = 'play_single_sound2';
  }


var canvas;
var ctx;
var w = 0;
var h = 0;
var timer;
var updateStarted = false;
var touches = [];
function update() {
  if (updateStarted) return;
  updateStarted = true;
  var nw = window.innerWidth;
  var nh = window.innerHeight;
  if ((w != nw) || (h != nh)) {
    w = nw;
    h = nh;
    canvas.style.width = w+'px';
    canvas.style.height = h+'px';
    canvas.width = w;
    canvas.height = h;
  }
  ctx.clearRect(0, 0, w, h);
  var i, len = touches.length;
  for (i=0; i<len; i++) {
    var touch = touches[i];
    var px = touch.pageX;
    var py = touch.pageY;
    ctx.beginPath();
    ctx.arc(px, py, 20, 0, 2*Math.PI, true);
    ctx.fillStyle = "rgba(0, 0, 200, 0.2)";
    ctx.fill();
    ctx.lineWidth = 2.0;
    ctx.strokeStyle = "rgba(0, 0, 200, 0.8)";
    ctx.stroke();
    console.log('drawn circle at ' + px +',' + py);
  }
  updateStarted = false;
}

function ol() {
     // play_single_sound2();
  canvas = document.getElementById('canvas');
  ctx = canvas.getContext('2d');
  timer = setInterval(update, 15);
  
canvas.addEventListener('touchend', function() {
  ctx.clearRect(0, 0, w, h);
    // my_sound("left.m4a");
    play_single_sound2();
    
   
});

canvas.addEventListener('touchmove', function(event) {
  event.preventDefault();
  touches = event.touches;
   play_single_sound2();



});
canvas.addEventListener('touchstart', function(event) {
  console.log('start');
    play_single_sound2();
});

};

 var touchzone = document.getElementById("all_canvas");
  // Add an event handler for the touchstart event
  // touchzone.addEventListener("touchstart", touchHandler, false);
  // function touchHandler(event) {
  //       play_single_sound2();
  // }

