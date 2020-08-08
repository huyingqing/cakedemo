import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import 'bootstrap/dist/css/bootstrap.min.css'
// import bootstrap from 'bootstrap/dist/js/bootstrap.min'
// 设置全局axios
import axios from 'axios'
import qs from 'qs'
//操作完如下3步就可以使用我们的组件库了
//1.导入MintUI
import MintUI from 'mint-ui'
import ElementUI from 'element-ui'
//2.导入MintUI的样式表文件
import 'mint-ui/lib/style.min.css'
//引入VueAwesomeswiper轮播
import VueAwesomeswiper from 'vue-awesome-swiper'

// import 'swiper/css/swiper.css' // 进行全组组件样式加载/
import MH from './components/demo/MyHeader.vue'
import MF from './components/demo/MyFooter.vue'
import header from './components/demo/header.vue'
import BC from './components/demo/Backtop.vue'

// //为防止多次点击同一路由跳转控制台报错，做一个push处理
// const originalPush = VueRouter.prototype.push
// VueRouter.prototype.push = function push(location) {
//   return originalPush.call(this, location).catch(err => err)
// }


//3.通过Vue.use()方法注册为插件
Vue.component("my-header",MH)
Vue.component("my-footer",MF)
Vue.component("sm-header",header)
Vue.component("my-backetop",BC)




Vue.use(VueAwesomeswiper)
// Vue.use(Swiper)
Vue.use(MintUI)
Vue.use(ElementUI)
//创建全局页头
// Vue.componet("my-header",MH)
//引入全局axios
axios.defaults.baseURL = 'http://127.0.0.1:3001'
Vue.prototype.axios = axios;
// //组件中使用
// this.axios.get('/user/login').then(res=>{res.data})
Vue.config.productionTip = false



new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
