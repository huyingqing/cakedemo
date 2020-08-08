<template>
    <div class="proout">
        <!-- 引入头部 -->
        <!-- <sm-header></sm-header> -->
        <!-- 口味场景的筛选 -->
        <!-- 外面最大的div -->
        <div class="prdout">
            <!-- 口味div -->
            <div class="prdoutoutdiv">
                    <ul class="pactive ullia " >
                    <!-- 循环得到每一个场景 -->
                    <li  class=" ullia">口味：</li>
                    <li  class="pactive ullia " ><a class=" ullia " href="/product">全部</a></li>
                    <li class="ullia" v-for="(i,k) of proaddr" :key="k" v-bind:class="{active:currentIndex == k}">
                    <span class=" ullia" v-text="i.proaddr" @click="goto(k+1)"></span>
                    </li>
                </ul>
            </div>
            <!-- 先完成一个功能的 -->
            <!-- <div class="prdoutoutdiv"> -->
                <!-- <ul > -->
                    <!-- 循环得到每一个场景 -->
                    <!-- <li>口味：</li> -->
                    <!-- <li class="pactive  ullia">全部</li> -->
                    <!-- <li :id="i.fenlei" v-for="(i,k) of scene" :key="k">{{i.scene}}</li> -->
                <!-- </ul> -->
            <!-- </div> --> 
        </div>
        <!-- 商品列表 -->
            <!-- 外面最大的div -->
            <div  class="plistoutdiv">
                <!-- 里面设置宽度的div -->
                <div class="plisttwodiv">
                <!-- 每一个小的div 使用for循环展示出来-->
                <ul>
                    <li class="pli"  v-for="(item,k) of imglists" :key="k">
                        <router-link :to="`/detail/${item.lid}`">
                        <img  :src="item.img" alt="图片未加载"  class="pimg">
                        <div class="pfistdiv">
                        <span class="plistfirstp" v-text="item.cname"></span>
                          <p class="psecendp" v-text="item.title"></p>
                         <span class="pspan" style="color: #000; " v-text="`¥${(item.price).toFixed(2)}`"></span>
                         <p class="pp"></p>
                          <img class="pimgp" src="../../public/img/home/header/gouwuche.png" alt="图片正在加载">
                        </div>                        
                        </router-link>
                    </li>
                </ul>
                <!-- 分页项 -->
                <div class="fenyediv">
                <ul class="fenyeul">
                    <li class="fenyeli" :class="{disabled:page==1}">
                    <a href="javascript:;" :class="{disabled:page==1}" @click="change(-1,$event)">上一页</a>
                    </li>
                    <li class="fenyeli ina" v-for="i of pagecount" :key='i' :class="{active:i==page}">
                    <a href="javascript:;"  v-text=i  @click="changepage(i)"></a>
                    </li>
                    <li class="fenyeli " :class="{disabled:page==pagecount}">
                    <a href="javascript:;" :class="{disabled:page==pagecount}" @click="change(+1,$event)">下一页</a>
                    </li>
                </ul>  
                 </div>      
                </div>   
            
            </div>
         
        <!-- 引入底部 -->
        <!-- <my-footer></my-footer> -->
    </div>
</template>

<script>
import 'bootstrap/dist/css/bootstrap.min.css'

export default {
    data(){
        return{  
            //url传参
            cid:1, 
            //头部选项卡选中的下标
            currentIndex: 0,
            //存储文章分类信息
            proaddr:[],
            scene:[],
            //存储所有商品数据
            imglists:[],
            //存储当前页码
            page:1,
            //声明变量存储服务器返回的总页数
            pagecount:0,
        }
    },
    methods:{
        //  点击商品分类列表将列表id传给url
        goto(cid){
        console.log(cid);
        this.$router.push(`/fenlei/${cid}`);
        this.currentIndex=cid-1;
        // console.log(this.currentIndex);
       },
       change(n,e){
         if(e.target.className.indexOf("disabled")==-1)
         {
           console.log(e)
           this.changepage(this.page+parseInt(n));
         }
       },
       changepage(i){
         this.page=i
         this.load();
       },
   
        //点击
        //查询第一行分类信息场景
        // getlistscene(){
        //     this.axios.get("/pro/productscene").then(res=>{
        //     this.scene=res.data.results;  
        //     console.log(this.scene)     
        // });
        // },
        //获取第二行分类信息口味
        getlistproaddr(){
            this.axios.get("/pro/product").then(res=>{
            this.proaddr=res.data.results;
            console.log(this.proaddr)         
        });
        },
        load(){
            this.axios.get('/pro/articles?cid='+this.cid+'&page='+this.page).then(res=>{
              this.imglists=res.data.imglists;
              console.log(this.imglists)
              //将服务器返回的总页数储存到pagecount变量中
                this.pagecount=res.data.pagecount;
                console.log(this.pagecount);
            //    data.forEach(item => {
            //        this.imglists.push(item);
            //    });
            })
    },

    },
    watch:{
       
        //分类查询监听地址栏变化
        $route(){
            this.cid=this.$route.params.cid
            //判断得到的参数，执行全局查找
            this.load();
        }
    },
    mounted(){
        //监听表头和列表
        // this.getlistscene();
        this.getlistproaddr();
        this.load();

    //     //获取第一行行分类
    //   this.axios.get("/pro/product").then(res=>{
    //         this.proaddr=res.data.results;
    //         console.log(this.proaddr)         
    //     });
    },
    
}
</script>

<style scoped>

.proout{
    width: 100%;
    background-color: #f8f8f8;
    padding-top: 100px;
    
}
/* 场景和口味的大div */
.prdout{
    width: 50%;
    min-width: 1500px;
    margin: 0px auto;
    background-color: #fff;
    overflow: hidden;
    padding: 30px 10px;
    /* margin-top: 100px; */
    background-color: #eee;
}
.prdoutoutdiv{
    width: 80%;
    /* min-width: 1400px; */
    margin: 0 auto;
    overflow: hidden;
    background-color: white;
    padding: 30px;
}
/* 浮动prdoutoutdiv下的li */
.prdoutoutdiv>ul>li{
    float: left;
    padding: 10px 22px;
    font-size: 16px;
    color: #999;
}
.prdoutoutdiv>ul>li>a{
    color: #000;
}
/* 清除浮动 */
.prdoutoutdiv>ul{
    clear: both;
}
/* .pactive{
    background-color: yellow;
} */
.listoutdiv{
  width: 100%;
   min-width: 1500px;
    margin: 0px auto;
    padding-top:70px ;
    position: relative;
    /* border-bottom: 1px solid #ddd; */

}
/*设置商品列表 */
.plistoutdiv{
    width: 100%;
   min-width: 1500px;
    margin: 0px auto;
    padding-top:70px ;
    position: relative;
}
.plisttwodiv{
    width: 90%;
    min-width: 1400px;
    width: 700px;
    height: 700px;
    margin: 0 auto;
    position: relative;
    overflow: hidden;
}
.plisttwodiv>ul{
    width: 100%;
    margin: 0 auto;
    position: absolute;
    left: 0;
    top: 0;
    overflow: hidden;
    /* border-bottom: 1px solid #ddd; */
    /* float: left;
    height: 500px;
    padding: 12px;
    margin: 0 auto; */
}
/* 浮动商品列表li */
.pli{
    width: 300px;
    height: 300px;
    float: left;
    margin: 0 auto;
    /* margin: 0 10px; */
    margin-left: 40px;
    /* position: a; */
    background-color: white;
    margin-bottom: 150px;
}
.ullia{
    cursor: pointer;
    color: #000;
}
ullia:hover{
    background-color: yellow;
    color: #000;
}
.pimg{
    width: 100%;
}
.pfistdiv{
 position: absolute;
 margin-top: 10px;
}
.plistfirstp{
    font-size: 17px;
    color: #000;
    margin-top: 10px;
}
.psecendp{
    font-size: 12px;
    color: #999;
    margin-top: 10px;
    margin-bottom: 14px;
}
.pspan{
    margin-top: 65px;
    font-size: 17px;
    color: #000;
}
.pimgp{
    padding-left: 191px;
    margin-top: -11px;
    padding-top: 12px;
  position: absolute;

}
.pp{
  width: 10px;
  border: 20px solid yellow;
  border-radius: 50%;
  position: absolute;
  margin-top: -33px;
  margin-left: 244px;
}
.fenyediv{
    position: absolute;
    overflow: hidden;
    top: 600px;
    left: 80%;
    min-width: 1200px;
}
.fenyeul{
    margin: 0;
    overflow: hidden;
   /* background-color: #ddd; */
}
.fenyeli{
   float: left;
   font-size: 16px;
   width: 60px;
   height: 35px;
   text-align: center;
   margin: 0;
   line-height: 33px;
}
.fenyeli>a{
    text-decoration: none;
    color: #000;
   border-bottom: 2px solid #555;

}
.ina{
    width: 30px;
}
.fenyeli>a:hover{
    font-weight: 700;
}
</style>