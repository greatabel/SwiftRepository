// function show(){
//     //修改div的显示内容
// 	document.getElementById("Div_primitiveAndReferenceType").innerHTML = "test1 from javascript";
//     document.getElementById("Div_Functions").innerHTML = "test2";
//     document.getElementById("Div_constructors_and_prototypes").innerHTML = "test3";
// }



//http://localhost:8080/zrb/mobile/proList.jspx
//http://192.168.1.76:8080/zrb/mobile/proList.jspx
// console.log('test1');

var json_data1 = {"results":[{"id":"1f9e7d1a-a1ad-4365-8c42-7086fd3b7923","title":"贵州黔西县城关镇莲城大道东侧 黔西县客车站29.73亩商住地","img":"upload/image/20150318/20150318161841252.jpg","type":"0","orderId":1},
{"id":"4c78d800-99ed-4b9d-8985-13fcb8a14cb0","title":"甘肃武威市交通运输局客运中心综合楼资产整体转让","img":"upload/image/20150227/20150227142756155.jpg","type":"4","orderId":9}
,{"id":"0b70858e-abe1-4b0a-877d-24eaff72d673","title":"四川眉山市东坡大道西侧88亩商住用地","img":"upload/image/20150212/20150212091243889.jpg","type":"0","orderId":10}],"count":595};

// var result = [];
// for(var i in json_data)
//     result.push([i, json_data [i]]);

// console.log('result.length='+result.length);
// console.log(result);
function load_recentItem(json_dataB){

	 var  data = JSON.parse(json_dataB);
	// alert(data);

	for (var key in data) {
	    if (data.hasOwnProperty(key)) { // this will check if key is owned by data object and not by any of it's ancestors
	       
	    	if(key =='count')
	    	{
	    		recentlist_Count = data[key];
	    	}
	    	if(key == 'results')
	    	{
	    		recentlist_List = recentlist_List.concat(data[key]); 
	    	}
	        // this will show each key with it's value
	    }
	}
	// alert('recentlist_Count='+recentlist_Count+'recentlist_List.length='+recentlist_List.length+recentlist_List[0]["img"]);
	
	// console.log('after>>');
	// console.log(recentlist_Count);
	// console.table(recentlist_List);
	// console.log(recentlist_List.length);
}

function set_recentItem(myrecentlist_List){
	var mycontent = '<ul class="media-list">';
	for(var i=0;i<myrecentlist_List.length;i++){
		var imgUrl = 'http://hanhainet.com:81/' + myrecentlist_List[i].img;
		//防止api没有传给我图片
		if(myrecentlist_List[i].img == "null" || myrecentlist_List[i].img == null || myrecentlist_List[i].img == "")
		{
			imgUrl = "images/default_news.jpg";
		}
		var dtStr = myrecentlist_List[i].desc2.substring(0,10);
		var realestateStr = myrecentlist_List[i].desc1;
		if(myrecentlist_List[i].desc1 == "null" || myrecentlist_List[i].desc1 == null || myrecentlist_List[i].desc1 == "")
		{
			realestateStr = "未知  ";
		}
		mycontent +=  '<li class="media"> <a class="pull-left" href="#"> <img class="media-object"  src="'+imgUrl
		+'" height="70" width="70" > </a>\
        <div class="media-body">\
          <a href="detail.html?from=recent&id='+myrecentlist_List[i].id+'">  <h4 class="media-heading">'+myrecentlist_List[i].title+' </h4></a>\
            <div class="media">\
                <p>土地用途： '+ realestateStr +' | 出让时间：'+dtStr
                '</p>\
                <p>收藏  	赞 		下载</p>\
            </div>\
        </div>\
    </li>';
	}
    mycontent +='</ul>' ;
  document.getElementById("recentDiv").innerHTML = mycontent;
}




function load_dataItem(json_dataB){

	 var  data = JSON.parse(json_dataB);
	// alert(data);
	var datalist_Count = 0;
	var datalist_List = [];
	for (var key in data) {
	    if (data.hasOwnProperty(key)) { // this will check if key is owned by data object and not by any of it's ancestors
	       
	    	if(key =='count')
	    	{
	    		datalist_Count = data[key];
	    	}
	    	if(key == 'results')
	    	{
	    		datalist_List =  data[key];
	    	}
	        // this will show each key with it's value
	    }
	}
	// alert('recentlist_Count='+recentlist_Count+'recentlist_List.length='+recentlist_List.length+recentlist_List[0]["img"]);
	set_dataItem(datalist_List);
	
}
function set_dataItem(mydata_List){
	if(mydata_List!=null && mydata_List.length>=4){
		
		for(var i=0;i<4;i++)
	{	
		// test +='\n'+mydata_List[i].title;
		$("#imgDiv"+i.toString() ).attr("src", 'http://hanhainet.com:81/'+mydata_List[i].img);
		// $("#imgDiv"+i.toString() ).attr("src", 'http://hanhainet.com:81/'+mydata_List[i].img);
 		// $('a[class=linkDiv+'+i.toString() +']').attr('href','detail.html?type=8&id='+mydata_List[i].id);
		$("#titleDiv"+i.toString() ).html(mydata_List[i].title);
		$("a[class=linkDiv"+i.toString()+"]").attr("href","detail.html?from=listpage&type=8&id="+mydata_List[i].id);
	}
	

	
	}
}



function show_recenteList(pagesize,pageno)
{
	//最新项目展示模块
	$.getJSON('http://61.183.87.134:8090/zrb/mobile/proList.jspx?pageSize='+pagesize+'&pageNo='+pageno, function(data) {

		

	    //data is the JSON string
	var mystring = JSON.stringify(data);
	load_recentItem(mystring);
	set_recentItem(recentlist_List);
	});
}


//加载更多
$(document).ready( function () {
    $('#addMoreDiv').on('click', function () {
        // alert('addMore click event');
        index_PageNo += 1;
        show_recenteList(index_PageSize,index_PageNo);

    });
    

});

//----------------------------------------------
//推介会展示模块
$.getJSON('http://61.183.87.134:8090/zrb/mobile/bu.jspx?type=8&pageSize=10&pageNo=1', function(data) {
    
var mystring = JSON.stringify(data);
load_dataItem(mystring);

});
var index_PageSize = 10;
var index_PageNo = 1;

var recentlist_Count = 0;
var recentlist_List = [];

show_recenteList(index_PageSize,index_PageNo);

