<template>
<!-- 最外面的div -->
    <div class="cartout">
        <!-- 显示有东西的购物车div,头部 -->
        <div class="cartheader">
            <div class="carheaderin">
                <img class="carheaderimg"  src="../../public/img/home/gouwuche/mycart.png" alt="">
                <p ><pre><span class="carheaderspan"> 赠券 </span>  已满足条件，订单完成可获赠优惠券  <span class="carts">已参加</span></pre></p>
            </div>
        </div>
        <!-- 商品信息 -->
        <div class="xinxi">
            <div class="xinxiin">
            <ul class="xinxiinul">
                <li>商品信息</li>
                <li>规格</li>
                <li>数量</li>
                <li>单价</li>
                <li>操作</li>
            </ul>
            </div>
        </div>
        <!-- 购物列表 -->
        <div class="xinxi">
            <div class="xinxiin cartlistin">
                <div class="cartlistp">
                    <p ><pre><span class="carheaderspan"> 换购 </span>  已满足换购条件，可换购优惠商品  <span class="carts">去换购</span></pre></p>
                </div>
                <!-- 使用根据lid显示指定的列表 -->
                <div class="cartflot" >
                    <ul class="cartul" v-for="(item,k) of this.$store.state.car" :key="k">
                        <!-- 第一个 -->
                        <!-- <li>圆圈</li> -->
                        <!-- 第1列商品信息 -->
                        <li class="cartimg">
                        <img class="liimg" :src="item.img" alt="">
                        <p class="cartname1">{{item.cname}}</p>
                        <p class="cartname2">{{item.title}}</p>
                        </li>
                        <!-- 第2列规格 -->
                        <li ><p class="cartp">{{item.spec}}</p></li>
                        <!-- 第3列数量 -->
                        <li class="cartbtn">
                            <button @click="btnminus(item)" class="cartbtn1">-</button>
                            <input  readonly :value="item.addCount">
                            <button @click="btnadd(item)" class="cartbtn1">+</button>
                        </li>
                        <!-- 第4列单价 -->
                        <li class="cartprice"><p>¥{{(item.price*item.addCount).toFixed(2)}}</p></li>
                         <!-- 第5列删除操作  -->
                         <li class="cartdlet" @click="remove(item)"><img src="../../public/img/home/gouwuche/icon41.png" alt=""></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 选配件 -->
        <!-- 外面的div -->
         <div class="xinxi">
             <!-- 里面的div -->
             <div class="xinxiin">
                 <p class="xuanpeijianp">加个配件</p>
                <!-- 选个配件 -->
                <div class="peijiandiv">
                    <ul class="peijianul">
                    <li class="peijianli" v-for="(item,index) of peijian" :key="index">
                        <img class="peijianimg" :src="item.img" alt="">
                        <p class="peijianp">{{item.title}}</p>
                        <p class="peijianp" > ¥{{(item.pricep).toFixed(2)}}</p>
                          <img class="peijianimgp" src="../../public/img/home/header/gouwuche.png" alt="图片正在加载">
                        <span class="peijiank"></span>
                    </li>
                </ul>
                </div>
             </div>
         </div>
         <!-- 已选商品 -->
        <div class="xinxi">
            <div class="xinxiin">
                <!-- 浮动第一排 -->
                <div class="ulflotdiv">
                <ul class="footflot">
                <li>
                    <!-- <pre><img src="../../public/img/home/gouwuche/icon10.png" alt="">  <span class="footspan"></span> -->
                    <!-- </pre> -->
                </li>
                <!-- 第二列 -->
                <li>
                    <!-- <p class="footp">已选{{count}}件商品</p>
                    <p class="footpsm">共计{{count}}件商品</p> -->
                </li>
                </ul>
                <ul class="footflotright">
                    <!-- 第三列 -->
                <li>
                    <p class="footp">合计：</p>
                </li>
                <!-- 第四列 -->
                <li>
                    <p class="footprice">￥{{total.toFixed(2)}}元</p>
                </li>
                </ul>
                </div>
                
                <!-- 第二排 -->
                <div class="peisongout">
                    <div class="peisong">
                        <p >配送范围内满100元包邮</p>
                    </div>
                    <div class="peibut">
                        <router-link to="/product"><button class="peijianbtn1">继续挑选</button></router-link>
                        <button class="peijianbtn2" >结 算</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            //声明数组保存配件数组对象
            peijian:[],
            // 声明变量保存数量
            n:0,
            // 声明变量储存加入购物车的产品信息
            goodsInfo:"",
            count:""
        }
    },
    methods:{
        // 点击减号，数量-1
        btnminus(item){
           if(item.addCount>1){
               item.addCount--
            // 将变量后的值赋给缓存中的addCount
            // this.$store.state.car.addCount=item.addCount
           }
        },
        //点击加号，数量+1
        btnadd(item){
            item.addCount++;
            // this.$store.state.car.addCount=item.addCount
        },
        // 删除购物车
        remove(item){
            let removestr="您确定要删除该商品吗？";
            // 如果确定删除，那么就将缓存的数据赋值为一个空数组
            if(confirm(removestr)==true){
                this.$store.state.car=this.$store.state.car.filter(i=>{
                    //返回空数组
                    return i!=item;
                })
                // 得到最新的对象，把对象解析为json字符串，然后保存到本地缓存
                let shopcar=JSON.stringify(this.$store.car);
                localStorage.setItem('car',shopcar);
                // 将移除对象后的新数组赋值给store里面缓存的car数组
                this.$store.state.car=this.$store.state.car
            }
        },
    },
    mounted(){
        // 获取配件的信息
        this.axios.get('/pro/peijian').then(res=>{
            // console.log('1')
            this.peijian=res.data.results
            // console.log(this.peijian)
        });
    },
    computed:{
        total(){
            let sum=0;
            for(var i of  this.$store.state.car){
                sum+=i.price*i.addCount;
            }
            return sum;
        }
    }
}
</script>

<style scoped>
.cartout{
    width: 100%;
    min-width: 1500px;
    background-color: #f8f8f8;
}
.cartheader{
    width: 80%;
    min-width: 1500px;
    margin: 0 auto;
}
.carheaderin{
    width: 50%;
    min-width: 1500px;
    margin: 0 auto;
    padding: 100px 105px;
}
.carheaderimg{
    margin-bottom: 30px;
}
.carheaderspan{
    font-size: 16px;
    border: 1px solid red;
    border-radius: 10px;
    background-color: red;
    color: white;
}
.carts{
    color: red;
}
.xinxi{
    width: 100%;
    min-width: 1500px;
    /* background: white; */
    overflow: hidden;
    padding-bottom: 20px;
}
.xinxiin{
    width: 70%;
    min-width: 1300px;
    background-color: white;
    margin: 0 auto;
    overflow: hidden;
}
.xinxiinul{
    overflow: hidden;
    margin: 0;
}
.xinxiinul>li{
    float: left;
    font-size: 16px;
    color: #000;
    margin: 0px 110px;
    padding:20px 0px ;
}
.cartlistspan{
    /* padding:10px 10px; */
    padding-top: 10px;
}
.cartlistin{
    padding: 40px 0px;
}
/* .cartlistp{
    padding-top: 24px;
} */
.cartul{
    overflow: hidden;
}
.cartul>li{
    float: left;
}
.cartimg{
    margin-left: 40px ;
}
.liimg{
    width: 100px;
}
.cartname1{
    position: absolute;
    font-size: 18px;
    font-weight: 500;
    color: #000;
    margin: -90px 0px 0px 108px ;
}
.cartname2{
    position: absolute;
    margin: -58px 0px 0px 108px ;
}
.cartp{
    font-size: 14px;
    color: #000;
    margin: 30px 0px 0px 200px;
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
    padding-top: 20px;
}
.ulflotdiv{
    padding-top: 75px;
    padding-bottom: 70px;
    overflow: hidden;
    padding-left: 50px;
}
.footflot{
    float: left;
    overflow: hidden;
}
.footflot>li,.footflotright>li{
    float: left;
    margin: 10px 10px 10px 10px ;
}
.footflotright,.peibut{
    float:right;
    margin: 0px 200px;
}
.footpsm{
    font-size: 14px;
}
.footxuanze{
    border: 10px solid ;
}
.footspan,.footp{
    font-size: 16px;
    color: #000;
    margin-bottom: 0px;
}
.footprice{
    font-size: 24px;
    font-weight: 600;
    color: #000;
    margin-top: -7px;
    margin-left: 35px;
}
.peisong{
    float: left;
    margin-left: 160px;
}
.peisongout{
    padding-bottom: 135px;
}
.peijianbtn1{
    width: 150px;
    height: 50px;
    margin-right: 30px;
    background-color: white;
    border: 1px solid #999;
    border-radius: 30px;
    outline: none;
}
.peijianbtn2{
    width: 150px;
    height: 50px;
    background-color: #ffe32a;
    border: 0;
    border-radius: 30px;
    outline: none;
}
.cartbtn{
    margin-left: 180px;
}
.cartbtn1{
    width: 25px;
    height: 25px;
    border: 1px;
    background-color:#ddd;
    border-radius: 50%;
    outline: none;
    margin: 30px 0px;
    font-size: 14px;
}
.cartbtn1:hover{
    font-weight: 600;
}
input{
    width: 15px;
    text-align: center;
    border: 0;
}
.bntfont{
    font-size: 16px;
    color: #000;
}
.cartprice{
    margin-top: 40px;
    padding-left: 200px;
    font-size: 18px;
    color: #000;
}
.cartdlet{
    margin-top: 40px;
    padding-left: 200px;
}
.peijiandiv{
    padding: 0px 50px;
}
</style>