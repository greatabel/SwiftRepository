// function show(){
//     //修改div的显示内容
// 	document.getElementById("Div_primitiveAndReferenceType").innerHTML = "test1 from javascript";
//     document.getElementById("Div_Functions").innerHTML = "test2";
//     document.getElementById("Div_constructors_and_prototypes").innerHTML = "test3";
// }


function show() {
    // alert('test')
    console.log('here')

};

show();

$.getJSON('http://127.0.0.1:8000/api/tasks/', function(data) {
    //data is the JSON string
    console.log(data);
});
 

