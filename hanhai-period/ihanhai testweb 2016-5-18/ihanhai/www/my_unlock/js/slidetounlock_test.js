$(function() {
 document.getElementById("content").innerHTML = navigator.userAgent.toLowerCase();

    $("#slider").draggable({
        axis: 'x',
        containment: 'parent',
        drag: function(event, ui) {
            console.log('here1',ui.position.left);
            if (ui.position.left > 58) {
                console.log('here2',ui.position.left);
                $("#well").fadeOut();
            } else if(ui.position.left < -58){
                    $("#well").fadeOut();
                // Apparently Safari isn't allowing partial opacity on text with background clip? Not sure.
                // $("h2 span").css("opacity", 100 - (ui.position.left / 5))
            }
        },
        stop: function(event, ui) {
            console.log('ui.position.left=',ui.position.left)
            if (ui.position.left < 301) {
                $(this).animate({
                    left: 0
                })
            }
        }
    });
    
    // The following credit: http://www.evanblack.com/blog/touch-slide-to-unlock/
    
    $('#slider')[0].addEventListener('touchmove', function(event) {

        event.preventDefault();
        var el = event.target;
        var touch = event.touches[0];
        curX = touch.pageX - this.offsetLeft - 73;
        document.getElementById("content").innerHTML = curX
        console.log('curX=',curX);
        // if(curX <= 0) return;
        if(curX <= -60){
            $('#well').fadeOut();
        }
        if(curX > 60){
            $('#well').fadeOut();
        }
        el.style.webkitTransform = 'translateX(' + curX + 'px)'; 
    }, false);
    
    $('#slider')[0].addEventListener('touchend', function(event) {  
        this.style.webkitTransition = '-webkit-transform 0.3s ease-in';
        this.addEventListener( 'webkitTransitionEnd', function( event ) { this.style.webkitTransition = 'none'; }, false );
        this.style.webkitTransform = 'translateX(0px)';
    }, false);

});

