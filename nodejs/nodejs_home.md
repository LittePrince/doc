# 15 响应类型ContentType

- 'text/plain' 	普通文本
- ’text/html‘       进行html渲染

```javascript
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
```

# 16 ContentType快速查询

<http://tool.oschina.net/> 

# 2-1 代码风格及代码的分号问题

--主要讲一些规范

--当你采用了无分号的代码风格的时候，只需要注意三个情况就行了

--1. 当一行代码时以：（[或者`开头的时候，则在前面不上一个分号



# 2-2 

# 2-6在node中使用模板引擎

1.用npm安装art-template

2.在需要使用的文件模块中加载art-template

​	只需要使用require方法加载就可以了 require('art-template')

3.