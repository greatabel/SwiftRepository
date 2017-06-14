function getQueryString() {
  var result = {}, queryString = location.search.slice(1),
      re = /([^&=]+)=([^&]*)/g, m;

  while (m = re.exec(queryString)) {
    result[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
  }

  return result;
}



function load_recentItem(json_dataB){

	 var  data = JSON.parse(json_dataB);
	// alert(data);
	var recentlist_Count = 0;
	var recentlist_List = [];
	for (var key in data) {
	    if (data.hasOwnProperty(key)) { // this will check if key is owned by data object and not by any of it's ancestors
	       
	    	if(key =='count')
	    	{
	    		recentlist_Count = data[key];
	    	}
	    	if(key == 'results')
	    	{
	    		recentlist_List = data[key];
	    	}
	        // this will show each key with it's value
	    }
	}
	// alert('recentlist_Count='+recentlist_Count+'recentlist_List.length='+recentlist_List.length+recentlist_List[0]["img"]);
	set_recentItem(recentlist_List);
	
}

function set_recentItem(myrecentlist_List){
	var mycontent = '<ul class="list-group">';
	

	for(var i=0;i<myrecentlist_List.length;i++)
	{	

		mycontent +='<li class="list-group-item"> <a href="detail.html?from=listpage&type='
		+mylisttype.toString() +'&id='
		+myrecentlist_List[i].id + '"> '
		+myrecentlist_List[i].title +'</a></li>'
 

		
	}
    mycontent +='</ul>' ;
  document.getElementById("listDiv").innerHTML = mycontent;
  
}

// -------main ------

var mylisttype = getQueryString()["listtype"];

// http://61.183.87.134:8090/zrb/mobile/bu.jspx?type=1&pageSize=10&pageNo=1

$.getJSON('http://61.183.87.134:8090/mobile/bu.jspx?type='+mylisttype+'&pageSize=10&pageNo=1', function(data) {

	

    //data is the JSON string
var mystring = JSON.stringify(data);

load_recentItem(mystring);

});



