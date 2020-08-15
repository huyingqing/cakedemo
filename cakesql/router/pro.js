const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//console.log(pool);
//创建路由器对象
const router=express.Router();
//往路由器对象添加路由

// 首页
//页头部分
//1.监听请求获取address地址
router.get('/address',(req,res)=>{
	// res.send('ok')
	let sql='select address from address';
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send(result)
	})
})


//主体部分
//1.获取轮播图图片 post  /reg
router.get('/bannerList',(req,res)=>{
	// res.send('ok')
	let sql="select img,href from cakecarousel";
	pool.query(sql,(err,result)=>{
		if(err)throw err;
		res.send(result)
	})
})

//2.获取首页三排图片
router.get('/threepictrue',(req,res)=>{
	// res.send('ok')
	let sql='select img,href from threepictrue';
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send(result)
	})
})

//3.发请求 拿到本季推荐下的图片
router.get('/bigpicture',(req,res)=>{
	// res.send('ok')
	let sql='select img,href from bigpicture';
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send(result)
	})
})

//4.发请求 拿到首页第一部分的6个商品列表
router.get('/onlist',(req,res)=>{
	// res.send('ok')
	let sql='select * from list';
	pool.query(sql,(err,result)=>{
		if(err)throw err;
		res.send(result)
		// console.log(result)
	})
})

//5.发送请求，拿到数据库中的taste
router.get('/product',(req,res)=>{
	// console.log("ok")
	let sql="select fenlei,proaddr from protaste";
	pool.query(sql,(err,results)=>{
		if(err) throw err
		// res.send(result)
		// console.log(result)
		res.send({message:'查询成功',code:1,results:results});
	})
})

//5.发送请求，拿到数据库中的taste
router.get('/productscene',(req,res)=>{
	// console.log("ok")
	let sql="select fenlei,scene from scene";
	pool.query(sql,(err,results)=>{
		if(err) throw err
		// res.send(results)
		res.send({message:'查询成功',code:1,results:results});
	})
})

//6.分页查询
router.get('/articles',(req,res)=>{
    //获取客户端URL地址栏的参数
    let cid = req.query.cid;
		// console.log('这是cid'+cid)
    //获取当前的页码
    let page = req.query.page;
  //   if(!page){
		// 	page=1
		// }
		// console.log('这是page'+page)
    //分页实质上利用了SELECT语句的LIMIT子句
    //其标准计算公式为 (页码-1) * 每页显示记录数
    let offset = (page-1) * 4;
    //获取总记录数的操作        
    let sql = 'SELECT COUNT(lid) AS count FROM list WHERE fenlei=?';
    pool.query(sql,[cid],(err,result)=>{
        if(err) throw err;
        //获取出总记录数
        //因为聚合函数只有一个返回结果,所以result[0]将返回该结果
        //而结果是一个对象,包含有count的属性(count属性实质是SQL语名中字段的别名)
        let rowCount = result[0].count;
				// console.log(rowCount)
       //声明每页显示6条
			 let pagesize=4;
        //声明变量pagecount用于存储计算出来总页数
		let pagecount = Math.ceil(rowCount / pagesize);
		  //所以现在必须通过上述公式计算出 offset参数值   
        //以获取到的参数为条件在文章数据表中进行查找操作    
        sql = 'SELECT lid,fenlei,cname,title,price,img FROM list WHERE fenlei = ? LIMIT ' + offset + ',4';
        pool.query(sql,[cid],(err,results)=>{
            if(err) throw err;
            res.send({message:'查询成功',code:1,imglists:results,pagecount:pagecount,rowCount:rowCount});
        });

    });
   
});

//获取详情页的信息
router.get('/detail',(req,res)=>{
	// console.log(req);
	let lid=req.query.lid;
	// console.log(lid)
	let sql='select * from list where lid=?';
	pool.query(sql,[lid],(err,results)=>{
		if(err) throw err;
		// console.log('1');
		res.send({message:'查询成功',code:1,results:results[0]})
		
	})
})

//请求配件的图标
router.get('/peijian',(req,res)=>{
	let sql='select title,pricep,img from peijian'
	pool.query(sql,(err,results)=>{
		if(err) throw err;
		// console.log(results)
		res.send({message:'查询成功',code:1,results:results})
	})
})
//路由器对象导出
module.exports=router;

