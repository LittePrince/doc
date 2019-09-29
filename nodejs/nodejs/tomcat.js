var http = require("http")
var fs = require('fs')
var server= http.createServer();
server.on("request",function(req,res){
	fs.readFile('./resource/index.html',function(err,data){
		if(err){
			res.setHeader('Content-Type','text/plan; charset=utf-8')
			res.end('文件读取失败')
		}else{
			res.setHeader('Content-Type','text/html;charset=utf-8')
			res.end(data)
		}
	})
	
})
server.listen(3000,function(){
	console.log('服务已启动')
})