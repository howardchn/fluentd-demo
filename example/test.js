'use strict'
var fs = require("fs");

var data = fs.readFileSync('test.js');

console.log(data.toString());
console.log("程序执行结束!1111");

for(var i=0;i<3;i++){
    var j=i
}
console.log(window.i,j)
fs.readFile('index.js', function (err, data) {
    if (err) return console.error(err);
    console.log(data.toString());
});
console.log("程序执行结束!");