//http://61.183.87.134:8090/zrb/mobile/proDetail.jspx?id=1f9e7d1a-a1ad-4365-8c42-7086fd3b7923
function getQueryString() {
  var result = {}, queryString = location.search.slice(1),
      re = /([^&=]+)=([^&]*)/g, m;

  while (m = re.exec(queryString)) {
    result[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
  }

  return result;
}

function loadDetailItem(json_dataB){

var  data = JSON.parse(json_dataB);
	// alert(data);
	var mycontent =  "内容";
	var myimgList = [];
	var mytitle  = "标题";
	var mypublisher = "发布人";
	for (var key in data) {
	    if (data.hasOwnProperty(key)) { // this will check if key is owned by data object and not by any of it's ancestors
	       
	    	if(key =='content')
	    	{
	    		mycontent = data[key];
	    	}
	    	if(key == 'imglist')
	    	{
	    		myimgList = data[key];
	    	}
	    	if(key == 'title'){
	    		mytitle = data[key];
	    	}
	    	if(key == 'publisher'){
	    		mypublisher = data[key];
	    	}
	        // this will show each key with it's value
	    }
	}
	document.getElementById("titleDiv").innerHTML = mytitle;
	document.getElementById("contentDiv").innerHTML = mycontent;
	document.getElementById("publisherDiv").innerHTML = mypublisher;
	set_imglist(myimgList);
	// alert(myimgList[0].pic +' # '+myimgList[0].title);
	// alert(myimgList.length+"<br/>"+mytitle+"<br/>#"+mypublisher+mycontent);

}

function set_imglist(myimgList){

var imagecontent = '';
var image_lilist = '';
	for(var i=0;i<myimgList.length;i++)
	{	
		var imgurl = 'http://hanhainet.com:81/'+ myimgList[i].pic
		var myclass='item';
		if(i == 0)
			{
				myclass='item active';	
				image_lilist += ' <li data-target="#myCarousel" data-slide-to="'+i+'" class="active"></li>';
			}
		else{
			   image_lilist +='<li data-target="#myCarousel" data-slide-to="'+i+'"></li>';
		}


 
      imagecontent+='      <div class="'+myclass+'">'+
      '<img src="'+imgurl+'" style="width:100%;height:250px" alt="First slide">'+
      '<div class="container">\
        <div class="carousel-caption">\
          <h3>'+myimgList[i].title+'</h3>\
        </div>\
      </div>\
    </div>';

    //     imagecontent+='      <div class="'+myclass+'">'+
    //   '<img src="'+imgurl+'" style="width:100%;height:250px" alt="First slide">'+
    //   '<div class="container">\
    //     <div class="carousel-caption">\
    //       <h1>Slide one</h1>\
    //       <p>abel test</p>\
    //       <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>\
    //     </div>\
    //   </div>\
    // </div>';
		
	}
	// alert(imagecontent);

	// imagecontent ='    <div class="item active">'+
	// '<img src="http://hanhainet.com:81/upload/image/20150113/20150113171330182.jpg"\
	// style="width:100%;height:250px" data-src="" alt="Second    slide">\
 //      <div class="container">\
 //        <div class="carousel-caption">\
 //          <h1>Slide 2</h1>\
 //          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae egestas purus. </p>\
 //          <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>\
 //        </div>\
 //      </div>\
 //    </div>';

	var mycontent = '<div id="myCarousel" class="carousel slide" data-ride="carousel">\
  <ol class="carousel-indicators">'+image_lilist+
  '</ol>'+
  '<div class="carousel-inner">'+    
      imagecontent+
  '</div>\
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">\
  <span class="glyphicon glyphicon-chevron-left"></span></a> \
  <a class="right carousel-control" href="#myCarousel" data-slide="next">'+
  '<span class="glyphicon glyphicon-chevron-right"></span></a>   </div>';
	


    
     // alert(mycontent);
     if(myimgList!=null && myimgList.length >1){
     	    document.getElementById("mysliderDiv").innerHTML = mycontent;
     	     $("#myCarousel").swiperight(function() {  
		      // alert('prev');
		      $("#myCarousel").carousel('prev');  
		    });  
		   $("#myCarousel").swipeleft(function() { 
		    //alert('next');
		      $("#myCarousel").carousel('next');  
		   }); 
   
     }

  
}


var myfrom = getQueryString()["from"];
var myid = getQueryString()["id"];
// alert(myfrom+"#haha#"+ myid);
var mytype =  getQueryString()["type"];


switch(myfrom){ 
case "recent":    
  $.getJSON('http://61.183.87.134:8090/zrb/mobile/proDetail.jspx?id='+myid, function(data) {
		var mystring = JSON.stringify(data);
		loadDetailItem(mystring);

		}); 
  break; 
case "listpage": 

  $.getJSON('http://61.183.87.134:8090/zrb/mobile/bu_detail.jspx?type='+mytype+'&id='+myid, function(data) {
  	// alert('http://61.183.87.134:8090/zrb/mobile/bu_detail.jspx?type='+mytype+'&id='+myid);
		var mystring = JSON.stringify(data);
		loadDetailItem(mystring);

		});
  break; 
} 


