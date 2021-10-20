### 接口服务

### 本地开发环境配置
+ 克隆项目到本地
```
git clone https://github.com/。。。
```
+ 创建数据库nodedemo并导入项目根目录下的nodedemo.sql
```
CREATE SCHEMA `nnodedemo` DEFAULT CHARACTER SET utf8mb4 ;
```
> 注意数据库字符编码为utf8mb4 
+ 更改数据库配置
  src/common/config/database.js
  
```
const mysql = require('think-model-mysql');

module.exports = {
    handle: mysql,
    database: 'nodedemo',
    prefix: 'nodedemo_',
    encoding: 'utf8mb4',
    host: '127.0.0.1',
    port: '3306',
    user: 'root',
    password: 'root',
    dateStrings: true
};
```


+ 安装依赖并启动
```
npm install
npm start
```
访问http://127.0.0.1:8360/



### 功能列表


....


