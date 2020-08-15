<template>
<div>
  <!-- <my-header></my-header> -->
  <!-- 首页轮播图 -->
   
  <div class="carouse">
    <!--vue-awesome-swiper 文档copy-->
    <swiper ref="mySwiper" :options="swiperOptions" class="swiper ">
      <swiper-slide v-for="(i,k) of imgList" :key="k">
        <router-link to="/product"><img class="swiperimg" :src="i.img" alt="图片未加载"></router-link>
        </swiper-slide>
      <div class="swiper-pagination" slot="pagination"></div>
    </swiper>
  </div>
  <!-- 首页新品推荐字符 -->
  <div class="index-title">
    <!--餐具图 -->
    <div><img src="../assets/img/knifeFork.png" alt=""></div>
    <div class="title">
      <h3>
        <span class="titlespan">新品推荐</span>
      </h3>
      <p class="titlep">New Recommend</p>
    </div>
    <h4>New</h4>
  </div>
  <!-- 首页三排图片 -->
  <div class="season-wrap">
    <div class="season-pic">
    <ul   >
      <li v-for="(i,k) in imgcook" :key="k"><router-link to="/product"><img class="imgsize"  :src="i.img" alt="图片未加载"></router-link></li>
    </ul>
    </div>
  </div>
  <!-- 首页本季推荐字符 -->
  <div class="index-title">
    <!--餐具图 -->
    <div><img src="../assets/img/knifeFork.png" alt=""></div>
    <div class="title">
      <h3>
        <span class="titlespan">本季推荐</span>
      </h3>
      <p >Seasonal Recommend</p>
    </div>
    <h4>Seasonal</h4>
  </div >
  <!-- 本季推荐下的图片 -->
  <div class="imgbig">
    <div>
    <router-link :to="imgbig01.href" v-if="imgbig01.href!=undefined"><img  :src="imgbig01.img" alt="图片未加载" class="imgbig-img"></router-link>
  </div>
  </div>
  <!-- 首页第一部分的6个商品列表 -->
  <!-- 外面最大的div -->
  <div  class="listoutdiv">
    <!-- 里面设置宽度的div -->
    <div class="listtwodiv">
      <!-- 每一个小的div 使用for循环展示出来-->
       <ul>
         <li  v-for="(i,k) of imglists.slice(1,7)" :key="k">
            <router-link :to="`/detail/${imglists[k].lid}`">
              <img  :src="imglists[k].img" alt="图片未加载" >
            <div class="fistdiv">
              <p class="listfirstp ">{{imglists[k].cname}}</p>
              <p class="eglistfirstp">{{imglists[k].title}}</p>
            </div>
            <div class="seconddiv">
              <span class="seconddivspan" style="color: #000;">¥{{(imglists[k].price).toFixed(2)}}</span>
              <p class="seconddivp"></p>
              <img src="img/home/header/gouwuche.png" alt="图片正在加载">
            </div>
            </router-link>
         </li>
       </ul>
    </div>
  </div>
  <!-- 萌系推荐 -->
    <!-- 首页本季推荐字符 -->
  <div class="index-title">
    <!--餐具图 -->
    <div><img src="../assets/img/knifeFork.png" alt=""></div>
    <div class="title">
      <h3>
        <span class="titlespan">萌系推荐</span>
      </h3>
      <p class="titlep">Lovely</p>
    </div>
    <h4>Seasonal</h4>
  </div >
  <!-- 第一部分列表的下的大图 -->
  <div class="imgbig">
    <div>
    <router-link :to="imgbig02.href" v-if="imgbig02.href!=undefined"><img  :src="imgbig02.img" alt="图片未加载" class="imgbig-img"></router-link>
  </div>
  </div>
    <!-- 首页第一部分的6个商品列表 -->
  <!-- 外面最大的div -->
  <div  class="listoutdiv">
    <!-- 里面设置宽度的div -->
    <div class="listtwodiv">
      <!-- 每一个小的div 使用for循环展示出来-->
       <ul>
         <li  v-for="(i,k) of imglists.slice(6)" :key="k">
            <router-link :to="`/detail/${imglists.slice(6)[k].lid}`">
              <img  :src="imglists.slice(6)[k].img" alt="图片未加载" >
            <div class="fistdiv">
              <p class="listfirstp">{{imglists.slice(6)[k].cname}}</p>
              <p class="eglistfirstp">{{imglists.slice(6)[k].title}}</p>
            </div>
            <div class="seconddiv">
              <span class="seconddivspan" style="color: #000;">¥{{(imglists[k].price).toFixed(2)}}</span>
              <p class="seconddivp"></p>
              <img src="img/home/header/gouwuche.png" alt="图片正在加载">
            </div>
            </router-link>
         </li>
       </ul>
    </div>
  </div>
  <!-- <my-footer></my-footer> -->
  

  </div>

</template>

<script>
// 官方文档 参数及各项api配置的使用 https://www.swiper.com.cn/api/index.html
// 安装 npm i vue-awesome-swiper -S \ npm i swiper -S
import 'swiper/css/swiper.css' // 组件引入
import { swiper, swiperSlide } from 'vue-awesome-swiper'  // 组件样式
// import axios from 'axios'
export default {
  data(){
    return{
      // 创建空数组，保存轮播图片数组
      imgList:[],
      swiperOptions: {
        pagination: {
          el: '.swiper-pagination'
        },
        autoplay:{
          delay:2000  // 1秒时长切换
        },
        loop: true
      },
      // 声明空数组，保存首页三排图片数组
      imgcook:[],
      //本季推荐下的图片 声明变量保存空数组
      imgbig:[],
      imgbig01:{},
      imgbig02:{},
      //声明变量，保存首页第一部分的6个商品列表
      imglists:[],
      // imglistobj:{}

    }  
  },
  methods:{
    getBannerList(){
      // 发请求 拿到 cake数据
      this.axios.get('/pro/bannerList')
      .then(res=>{
        // console.log(res.data)
        this.imgList = res.data
      })
    },

  },
  // 挂载后发送请求，以获取数据
  mounted(){
    this.getBannerList();
    // 发请求 拿到首页三排图片
    this.axios.get('/pro/threepictrue').then(res=>{
      this.imgcook=res.data
    });
    //发请求 拿到本季推荐下的图片
    this.axios.get('/pro/bigpicture').then(res=>{
      // console.log(res.data)
      // this.imgbig=res.data
      [this.imgbig01,this.imgbig02]=res.data;
      // console.log(this.imgbig01)
    });
    this.axios.get('/pro/onlist').then(res=>{
      this.imglists=res.data
      // console.log(this.imglists)
      // let arryobj=Array.prototype.slice.call(arguments);
      // console.log(arryobj)
    })
  }
}
</script>

<style scoped>
a{
  font-weight:0;
}
  .carouse{
    width: 100%;
    min-width: 1280px;
    /* border:1px solid red; */
  }
  /*样式穿透*/
  .swiper >>> .swiper-pagination-bullet{
    background-color:white;
  }
  .swiperimg{
    width: 100%;
  }
  /* 设置餐具图的样式 */
  /* 最外面的div */
  .index-title {
    width: 80%;
    min-width: 1500px;
    height: 350px;
    padding-top: 106px;
    margin: 0  auto;
}
.index-title .title {
    margin-top: -15px;
    margin-left: 80px;
    width: 200px;
  }
.titlespan{
    color: #101010;
    font-size: 26px;
    font-weight: bold;
}
.titlep{
    margin-top: 20px;
    line-height: 0px;
    color: #c3c3c3;
    font-size: 16px;
}
.eglistfirstp{
   font-size: 12px;
    margin-top: 13px;
    color: #999;
}
.index-title>h4{
    font-size: 20px;
    text-align: center;
    margin-top: -65px;
    color: #c3c3c3;
}
/*  设置首页三排图片  */
.season-wrap{
    width: 1400px;
    margin: 0 auto;
    position: relative;
}

.season-pic{
    width: 1280px;
    height: 426px;
    margin: 0 auto;
    position: relative;
    overflow: hidden;
}
.season-pic>ul{
    height: 468px;
    margin: 0 auto;
    position: absolute;
    left: 0;
    top: 0;
    overflow: hidden;
}
.season-pic>ul>li{
  float: left;
    height: 426px;
}
.imgbig{
  width: 100%;
  min-width: 1400px;
}
.imgbig>div{
  width: 100%;
  margin: 0 auto;
}
.imgbig-img{
  width: 100%;
}
/* 设置第一部分第一排的list购物表 */
.listoutdiv{
  width: 100%;
   min-width: 1500px;
    margin: 0px auto;
    padding-top:70px ;
    position: relative;
    /* border-bottom: 1px solid #ddd; */

}
.listtwodiv{
    width: 90%;
    min-width: 1400px;
    width: 1280px;
    height: 1000px;
    margin: 0 auto;
    position: relative;
    overflow: hidden;
}
/* .listtwodiv{
  float: left;
  height: 1200px;
  padding: 12px;
  margin: 0 auto;
} */
.listtwodiv>ul{
  height: 1000px;
    margin: 0 auto;
    position: absolute;
    left: 0;
    top: 0;
    overflow: hidden;
    border-bottom: 1px solid #ddd;
}
.listtwodiv>ul>li{
    float: left;
    height: 500px;
    padding: 12px;
    margin: 0 auto;
}
.fistdiv{
  position: absolute;
  margin-top: -400px;
  margin-left: 20px;
}
.seconddivspan{
  position: absolute;
  margin-top: -50px;
  margin-left: 20px;
  font-size: 18px;
}
.seconddivp{
  width: 20px;
  border: 20px solid yellow;
  border-radius: 50%;
  position: absolute;
  margin-top: -63px;
  margin-left: 341px;
}
.seconddiv>img{
  width: 20px;
  position: absolute;
  margin-top: -50px;
  margin-left: 350px;
}
.listfirstp{
  font-size: 16px;
  color: #000;
}


</style>
