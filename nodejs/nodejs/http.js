var http = require("http")

var server= http.createServer();
server.on("request",function(req,res){
	
	var url = req.url
	if(url==='/plain'){
		res.setHeader("Content-Type","text/plain; charset=utf-8")
		res.end('<h1>你好</h1>')
	}else if(url==='/html'){
		res.setHeader("Content-Type","text/html; charset=utf-8")
		res.end('<h1>你好</h1>')
	}
})
server.listen(3000,function(){
	console.log('服务已启动')
})