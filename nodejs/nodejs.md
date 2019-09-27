# Node.js介绍



node就是一个服务器。

- 企业需求
  - 具有服务端开发经验更好
  - front-end                                  //前端
  - back-end                                  //后端
  - 全栈开发工程师
  - 掌握基本的网站开发能力

# 什么是node？

- Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine
  - node.js不是一门语言
  - node.js不是库、不是框架
  - node.js是一个javaScript运行时环境
    - 简单点来说Node.js可以解析和执行JavaScript代码
    - 以前只有浏览器可以解析执行javaScript代码
    - 也就是说现在javaScript可以完全脱离浏览器来运行，一切归功于：node.js
  - 浏览器中的javaScript
    - EcmaScript		基本的语法（if,var,function,object,array）
    - BOM                    浏览器中的对象
    - DOM                    dom文件对象，隶属于BOM
  - Node.js中的javaScript
    - 没有BOM、DOM
    - 只有EcmaScript
    - 在Node这个JavaScript执行环境中为JavaScript提供了一些服务器级别的操作API
      - 例如文件读写
      - 网络服务的构建
      - 网络通信
      - http服务器
      - 等。。。

- Node.js 使用了一个事件驱动、非阻塞式 I/O 的模型，使其轻量又高效。
  - event-driven 时间出动
  - non-blocking I/O model非阻塞IO模型（异步）
  - lightweight and efficient轻量和搞笑

- Node.js package ecosystem ,npm is largest ecosystem of open source libraries in the world
  - npm是世界上最大的开源生态系统
  - 绝大多数JavaScript相关的包都存放在了npm上，这样做的目的是为了让开发人员更方便的去下载使用我。
  - `npm install packagename `

# node.js能做什么

- web服务器后台
- 命令行工具
  - npm (node)
  - git (c语言)
  - hexo (node)
  - ... ...
- 对于前端开发工程师来讲，接触node最多的是他的命令行工具
  - 自己写的很少，主要是使用别人第三方的
  - webpack
  - gulp
  - npm

# 预备知识

- HTML
- CSS
- JavaScript
- 简单的命令行操作
  - cd 
  - ls
  - ... ...
- 具有服务端开发经验更佳。

# 一些资源

深入浅出node.js

- 朴灵
- 偏理论，理解底层逻辑

node.js权威指南

- Api讲解
- 也没有业务，没有实战

# 这门课你能学到什么

- B/S编程模型
  - 任何服务端技术这种BS编程模型都是一样，和语言无关
- 模块化编程
  - RequireJS
  - SeaJS
  - `@import('文件路径')`
  - 以前认知的JavaScript只能通过script标签来加载
  - 在Node中开源像`@import()`一样来引用加载JavaScript脚本文件
- Node常用API
- 异步编程
  - 回调函数
  - Promise
  - async
  - generator
- Express Web 开发框架
- EcmaScript 6
  - 在课程中穿插讲解
  - 它知识一个新的语法而已

# 安装node环境

略

# Hello World

1.创建白那些JavaScript脚本文件

2.打开终端，定位到脚本文件所属目录

3.运行 node 文件名

# 例子：读/写文件

1.使用require方法加载fs核心模块

```javascript
//语法格式 fs.readFile("文件路径",function(error,data))
//当文件读取成功后error为空，失败后data为空
var fs = require('fs')
fs.readFile("./helloworld.js",function(error,data){
	if(error==null)
		console.log(data.toString())
})
fs.writeFile('./helloword.js','写入了这行数据',function(error){
    console.log('文件写入成功，这是回调函数')
})
```

data不加toString函数的二进制数据`<Buffer 76 61 72 20 66 6f 6f 20 3d 27 62 61 72 27 0d 0a 63 6f 6e 73 6f 6c 65 2e 6c 6f 67 28 66 6f 6f 29>`

