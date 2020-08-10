import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    //标识用户是否登录
    // 如果用户已登录，islogin的值为sessionStorage中的islogin的值，即为true
    isLogin:localStorage.getItem('isLogin') || false,
    isLogin:localStorage.getItem('uname') || "",
  },
  mutations: {
    login_mutation(state,payload){
      state.isLogin=true;
      state.uname=payload.uname;
    },
    logout_mutations:(state)=>{
      state.isLogin=false;
      localStorage.clear();
    }
  },
  actions: {
  },
  modules: {
  }
})
