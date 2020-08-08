<template>
    <div class="proout">
        <!-- 引入头部 -->
        <!-- <sm-header></sm-header> -->
        <!-- 口味场景的筛选 -->
        <!-- 外面最大的div -->
        <div class="prdout">
            <!-- 场景div -->
             <div class="prdoutoutdiv">
                    <ul>
                   <!-- 循环得到每一个场景 -->
                     <li>口味：</li>
                    <li class="pactive"><a class="ullia" href="/product">全部</a></li>
                    <li v-for="(i,k) of proaddr" :key="k"><a :href="`/fenlei/1`">{{proaddr[k].proaddr}}</a></li>
                </ul>
            </div> 
            <!--  -->
            <!-- <div class="prdoutoutdiv">
                <ul>
                    循环得到每一个场景 -->
                    <!-- <li>场景：</li>
                    <li class="pactive"><a href="">全部</a></li>
                    <li v-for="(i,k) of scene" :key="k"><a href="">{{scene[k].scene}}</a></li>
                </ul>
            </div> -->
        </div>
        <!-- 商品列表 -->
            <!-- 首页第一部分的6个商品列表 -->
            <!-- 外面最大的div -->
            <div  class="plistoutdiv">
                <!-- 里面设置宽度的div -->
                <div class="plisttwodiv">
                <!-- 每一个小的div 使用for循环展示出来-->
                <ul>
                    <li class="pli"  v-for="(i,k) of imglists" :key="k">
                        <router-link :to="`/detail/${i.lid}`">
                        <img  :src="imglists[k].img" alt="图片未加载"  class="pimg">
                        <div class="pfistdiv">
                        <span class="plistfirstp">{{imglists[k].cname}}</span>
                          <p class="psecendp">{{imglists[k].title}}</p>
                         <span class="pspan" style="color: #000; " v-text="`¥${(imglists[k].price).toFixed(2)}`"></span>
                         <p class="pp"></p>
                          <img class="pimgp" src="../../public/img/home/header/gouwuche.png" alt="图片正在加载">
                        </div>                        
                        </router-link>
                    </li>
                </ul>
                </div>
            </div>
        <!-- 引入底部 -->
        <!-- <my-footer></my-footer> -->
    </div>
</template>

<script>
export default {
    // props:["cid"],
    data(){
        return{
            // 声明变量保存场景数组
            proaddr:[],
            //声明变量保存口味数组
            scene:[],
            //声明变量保存商品数组数组
            imglists:[]
        }
    },
    watch:{
         $route(){
            this.cid=this.$route.params.cid
            //判断得到的参数，执行全局查找
            this.load();
        }
    },
    mounted(){
        this.axios.get("/pro/product").then(res=>{
            this.proaddr=res.data.results             
        });
        this.axios.get("/pro/productscene").then(res=>{
            this.scene=res.data.results          
        });
        this.axios.get('/pro/onlist').then(res=>{
        this.imglists=res.data
        // console.log(this.cid)
    //   // console.log(this.imglists)
    //   // let arryobj=Array.prototype.slice.call(arguments);
    //   // console.log(arryobj)
    })
    }
}
</script>

<style scoped >
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
    /* background-color: #eee; */
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
.prdoutoutdiv>ul>li>a:hover{
    text-decoration: none;
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
    width: 1280px;
    height: 1500px;
    margin: 0 auto;
    position: relative;
    overflow: hidden;
}
.plisttwodiv>ul{
    width: 100%;
    height: 2000px;
    margin: 0 auto;
    position: absolute;
    left: 0;
    top: 0;
    overflow: hidden;
    border-bottom: 1px solid #ddd;
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
    padding-left: 192px;
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
</style>