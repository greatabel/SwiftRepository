var api_url = "http://139.224.73.50"
api_url = "http://127.0.0.1:5000"

$.getJSON(api_url + '/api/user/0/measures', function(data) {
    children = ['梦遥','冬冬']
    //data is the JSON string
    var startcontent =  '<div class="row">' +
                '<div class="text-center">'+
                    '<h2>{0}历史数据</h2>'+
                '</div>' +                
                '<table class="table table-hover"><thead><tr>' +
                            '<th class="text-center">屈光度</th>' +
                            '<th class="text-center">左右眼</th>' +
                            '<th class="text-center">时间</th>' +
                        '</tr></thead>'+
                   '<tbody>' ;
    var endcontent = '<tr><td></td>'+                          
                            '<td class="text-right"><h4><strong>综合:</strong></h4></td>' +
                            '<td class="text-center text-danger"><h4><strong>{0}</strong></h4></td>'+
                        '</tr>'+
                    '</tbody>'+
                '</table></div>';
    var mycontent = startcontent.replace('{0}',children[0]);
    // console.log('data=',data.length,data[0],data[1])
    // var results = $.parseJSON(data);
    var results = data;
    console.log(results.length);
    var count = 0;
    for (var key in results) {
        if(results[key]["patientid"] == 0  && count < 10) {


            count += 1
            mycontent +=                 '<tr>'+
                                '<td class="col-md-3 text-center">'+results[key]["rawdata"] + '</td>' +
                                '<td class="col-md-3 text-center">'+(results[key]["whicheye"] == 0 ? "左":"右") + '</td>' +
                                '<td class="col-md-3 text-center">'+ results[key]["createdate"] + '</td></tr>'
                                        }
    }

    mycontent +=    endcontent.replace('{0}','左眼视力比较稳定');

    mycontent += startcontent.replace('{0}',children[1]);                
            '</div>'
        // var results = $.parseJSON(data);
        count = 0;
    for (var key in results) {
        if(results[key]["patientid"] == 1 && count < 10) {
            count += 1
            mycontent +=                 '<tr>'+
                                '<td class="col-md-3 text-center">'+results[key]["rawdata"] + '</td>' +
                                '<td class="col-md-3 text-center">'+(results[key]["whicheye"] == 0 ? "左":"右") + '</td>' +
                                '<td class="col-md-3 text-center">'+ results[key]["createdate"] + '</td></tr>'
                            }
    }
    mycontent +=    endcontent.replace('{0}','右眼视力比较稳定') ;

    document.getElementById("patientDiv").innerHTML = mycontent;   



});

