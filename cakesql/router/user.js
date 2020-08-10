const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//console.log(pool);
//创建路由器对象
const router=express.Router();
//往路由器对象添加路由

//用户登录的接口post请求
router.post('/login',(req,res)=>{
	//声明变量保存用户输入的值
	let username=req.body.username;
	let password=req.body.password;
	//保存查询语句
	let sql="select uid,uname,upwd from users where uname=? and upwd=?";
	pool.query(sql,[username,password],(err,results)=>{
		if(err) throw err;
		console.log(results)
		if(results.length==0){
			res.send({message:'登录名或密码错误',code:0})
		}else{
			res.send({message:'登录成功',code:1,results:results[0]})
			}
	})
})

//用户注册的接口post请求
router.post('/register',(req,res)=>{
    //获取用户提交的用户名等信息
    let username = req.body.username;
    //以用户名为条件进行查找操作,如果用户存在,则产生合法的错误信息
    //如果用户不存在,则将用户的相关信息写入数据表 -- xzqa_author  
    let sql = 'SELECT COUNT(uid) AS count FROM users WHERE uname=?';
    pool.query(sql,[username],(err,results)=>{
        if(err) throw err;       
        if(results.count==0){
            res.send({message:'注册失败',code:0});
            console.log(results)
        } else {
            //获取密码信息
            let password = req.body.password;            
            //完成数据写入操作
            let sql = 'INSERT INTO users (uname,upwd) VALUES(?,?)';
            pool.query(sql,[username,password],(err,results)=>{
                if(err) throw err;
                res.send({message:'注册成功',code:1});
            });
        }
    })

});

//路由器对象导出
module.exports=router;