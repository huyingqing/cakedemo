<template>
<!-- 外面最大的div，通过传参-->
    <div class="detaildiv">
        <!--第一个大图片 -->
        <div class="xqimg">
            <img  :src="product.xqimg" alt="">
            <!-- <p>{{product.cname}}</p> -->
        </div>
        <!--中间的详情div -->
        <div class="xqout">
            <div class="xqjs">
             <!-- 左边的div -->
            <div class="col-7 p-0 xiangqing">
            <div class="xqlb">
            <pre><span class="xqname" v-text="product.cname"></span><span class="sppingjia"> 商品评价 </span></pre>
            <!-- 预定时间 -->
            <p v-text="product.reserve"></p>
            <!-- 口味 -->
            <pre><span class="zhonglei" v-text="product.category"></span></pre>
            <!-- 详情1 -->
            <p class="pfontsizi" v-text="product.adetails"></p>
            <!-- 详情1 -->
            <p class="pfontsizi" v-text="product.bdetails"></p>
             <!-- 详情1 -->
            <p class="pfontsizi" v-text="product.cdetails"></p>
            <!-- 甜味 -->
            <p class="pfontsizi" v-text="product.sweet"></p>
            <!-- 标配餐具 -->
            <p class="pfontsizi" v-text="product.tableware"></p>
            <!-- 尺寸 -->
            <p class="pfontsizi" v-text="product.size"></p>
            <!-- 提示 -->
            <pre><span class="zhiyi"> ! </span>  <span class="pfontsizi pcolor" v-text="product.Storage"></span></pre>
            </div>
            <!-- 下面的div -->
             <div class="fenlaing">
                 <p v-text="product.Sweight"></p>
             </div>
            </div>
            
            <!-- 右边的div详情 -->
            <div class="col-5   youhui  ">
                <div class="">
                <pre><span class="fontcolor"> 换 购 </span>  |  买蛋糕可至购物车参加优惠换购        </pre>
            <a href=""><pre><span class="fontcolor"> 赠 品 </span>  |  参与"七夕活动"享抽盲盒机会     详情&gt;</pre></a>
            <a href=""><pre><span class="fontcolor"> 赠 券 </span>  |  2020年新用户赠券              详情&gt;</pre></a>
                </div>
            <!-- 下面的价格和按钮 -->
            <div class="foot">
                <p class="footprice">¥{{product.price}}</p>
                <button class="footbtn1" @click="join(lid)" >加入购物车</button>
                <router-link to="/product"><button  class="footbtn2">查看更多</button></router-link>
            </div>
            </div>
            </div>
        </div>
        <!-- 介绍大图 -->
        <div class="xqpcimgout">
           <div class="xqpcimgin">
                <img :src="product.xqpcimg" alt="">
           </div>
        </div>
        <!-- 选配件 -->
        <!-- 外面的div -->
         <div class="peijianout">
             <!-- 里面的div -->
             <div class="peijianin">
                 <p class="xuanpeijianp">选个配件</p>
                <!-- 选个配件 -->
                <ul class="peijianul">
                    <li class="peijianli" v-for="(item,index) of peijian" :key="index">
                        <img class="peijianimg" :src="item.img" alt="">
                        <p class="peijianp">{{item.title}}</p>
                        <p class="peijianp" v-text="`¥${(item.pricep).toFixed(2)}`"></p>
                          <img class="peijianimgp" src="../../public/img/home/header/gouwuche.png" alt="图片正在加载">
                        <span class="peijiank"></span>
                    </li>
                </ul>
             </div>
         </div>
    </div>
</template>

<script>
export default {
    // props:[lid],
    data(){
        return{
            // 保存服务器拿到的数组数据
            product:[],
            //声明数组保存数组对象
            peijian:[],
            // 声明变量，保存商品的信息
            lid:"",
            cname:"",//商品的名称
            title:'',//商品的英文名
            price:'',//商品的价格
            spec:'',//商品的规格
            img:'',//商品的图片
            count:1 //商品的数量，默认为1
        }
    },
    methods:{
        load(){
            // 监听product传过来的lid的变化
            let lid=this.$route.params.lid;
            // console.log(lid);
             // 获取商品的数组对象
             this.axios.get('/pro/detail?lid='+lid).then(res=>{
            // console.log('2222');
            this.product=res.data.results;
            
            this.lid=res.data.results.lid;
            this.cname=res.data.results.cname;
            this.title=res.data.results.title;
            this.price=res.data.results.price;
            this.spec=res.data.results.spec;
            this.img=res.data.results.img;
            // this.count=res.data.results.count;
            // console.log(this.product);
        });
         },
        // 点击购物车按钮保存商品数组信息
        join(lid){
            if(!this.$store.state.isLogin){
                this.$toast({
                message:"您需要先登录才能操作",
                position:"center",
                duration:3000
                });
            }else{
                this.$router.push(`/cart`);
                // this.load();
            // 点击之后，把当前商品的所有信息都搜集起来
            let goodsInfo={
                lid:this.lid,
                cname:this.cname,
                title:this.title,
                price:this.price,
                spec:this.spec,
                img:this.img,
                addCount:this.count
            }
            // 调用store中的mutations来将商品加入购物车
            this.$store.commit('addTocar',goodsInfo);
            // this.load();
            console.log(goodsInfo)
            }
            }
            
    },
    mounted(){
        this.load();
        // 获取配件的信息
        this.axios.get('/pro/peijian').then(res=>{
            // console.log('1')
            this.peijian=res.data.results
            // console.log(this.peijian)
        })
        
    }
}
</script>

<style scoped>
.detaildiv{
    width: 100%;
    min-width: 1500px;
    background-color: #f8f8f8;
}
.xqimg{
    width: 100%;
     min-width: 1500px;
     height: 705px;
    margin: 0 auto;
}
.xqimg>img{
    width: 100%;
    height: 100%;
    margin: 0 auto;
}
.xqout{
    width: 90%;
    min-width: 1600px;
    height: 600px;
    margin: 0 auto;
    position: relative;
    /* border: 1px solid #999; */
}
.xqname{
    font-size: 24px;
    font-weight: 1000;
}
.sppingjia{
    border: 1px solid #ffe32a;
    border-radius: 10px;
    background-color: #ffe32a;
}
.zhonglei{
    border: 1px solid #ffe32a;
    border-radius: 10px;
    background-color: #ffe32a;
}
.pfontsizi{
    font-size: 14px;
    /* color: #999; */
}
.pcolor,.zhiyi{
    color: red;
}
.zhiyi{
    border: 1px solid red;
    border-radius: 50%;
    /* background-color: pink; */
}
.fontcolor{
    color: red;
    font-size: 14px;
    border: 1px solid red;
    border-radius: 10px;
    /* padding-right: 10px; */
}
.xqjs{
    width: 80%;
    margin: -100px auto;
    display: flex;
    flex: auto;
    background-color: white;
    /* border: 1px solid #999; */
    
}
/* .xiangqing{
    justify-content: center;
} */
.youhui{
    /* padding-left: 20px; */
    text-align: right;
    border-left: 1px solid #999;
    padding: 40px 20px 40px 40px;

    /* margin-top:20px ; */
}
.xqlb{
    border-bottom: 1px solid #999;
    padding: 40px;
}
.fenlaing{
    padding:20px 40px;
}
a:hover{
    font-weight: 400;
}
.foot{
    margin-top: 270px;
    /* padding-right: 246px; */
}
.footprice{
    padding-right: 350px;
    font-size: 24px;
    font-weight: 600;
}
.footbtn1{
    outline: none;
    width: 150px;
    height: 50px;
    margin-right: 20px;
    border-radius: 10px;
    border: 1px solid #ccc;
    background-color: white;

}
.footbtn2{
    width: 150px;
    height: 50px;
    margin-right: 84px;
    border-radius: 10px;
    border: 0;
    background-color:#ffe32a;
    outline: none;
}
.xqpcimgout,.peijianout{
    width: 90%;
    min-width: 1600px;
    margin: 0 auto;
}
.xqpcimgin,.peijianin{
    width: 80%;
    margin: 0 auto;
    overflow: hidden;
}
.xqpcimgin>img{
    width: 100%;
    margin: 0 auto;
}
.peijianul{
    margin: 0;
    padding: 0;
}
.peijianli{
    /* width: 20px; */
    float: left;
    margin-right: 30px;
}
.peijianimg{
    width: 150px;
}
.peijianp{
    font-size: 14px;
    color: #000;
    margin-top: 6px;
}
.peijianimgp{
    width: 18px;
    position: absolute;
    z-index: 2;
    /* float: left; */
    margin:-40px 0px 0px 113px  ;
}
.peijiank{
    /* width: 20px;
    border: 15px solid #ffe32a;
    border-radius: 50%; */
  width: 10px;
  border: 12px solid #ffe32a;
  border-radius: 50%;
  position: absolute;
  margin-top: -45px;
  margin-left: 110px;
}
.peijianout{
    margin-top: 80px;
    padding-bottom: 80px;
}
.xuanpeijianp{
    font-size: 18px;
    font-weight: 500;
}
</style>