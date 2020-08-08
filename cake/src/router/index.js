import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import MyHeader from '../components/demo/MyHeader'
// import shoufengqin from '../components/demo/shoufengqin'
import Product from '../views/product.vue'
import Fenlei from '../views/Fenlei.vue'
import Detail from '../views/Detail.vue'
import Cart from '../views/Cart.vue'




//1.导入头部组件文件

// 引入Home组件


//测试案例结束
Vue.use(VueRouter)


const routes = [
  {
    path:'/cart',
    component:Cart,
    // props:true
  },
  {
    path:'/detail/:lid',
    name:'Detail',
    component: Detail,
    props:true
  },
  {
    path:'/fenlei/:cid',
    // name:'Fenlei',
    component: Fenlei,
    // props:true
  },
  {
    path:'/product',
    name:'Product',
    component: Product,
    // props:true
  },
  {
    path: '/header',
    name: 'MyHeader',
    component: MyHeader
  },
 
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  // {
  //   path: '/about',
  //   name: 'About',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
