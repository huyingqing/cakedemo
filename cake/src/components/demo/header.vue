<template>
    <div class="container-fluid p-0 pout">
        <div class="out">
        <!-- 左边的外部div -->
        <div class=" leftdiv" @click="lefthead()">
            <!-- 左边div -->
        <div @click="gengduo()" class="imgwidth" style="width:200px;padding:0px;border-right:0px">
            <router-link to="/home"><img style="hight:100%" src="../../../public/img/home/header/logo.png" alt=""></router-link>
        </div>
        <div style="border-left: 1px solid #ddd; cursor:pointer" @click="local">
            <img class="" src="../../../public/img/home/header/weizhi.png" alt="">
            <p class="outp">杭州</p>
        </div>
        <el-select v-model="value" placeholder="请选择">
            <el-option-group
            v-for="group in options"
            :key="group.label"
            :label="group.label">
            <el-option
                v-for="item in group.options"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
            </el-option-group>
        </el-select>
        <div @click="changpin()" >
            <router-link to="/header" >
            <img  src="../../../public/img/home/header/gengduo.png" alt=""><br>
            <p class="outp">所有产品</p>
            </router-link><br>
        </div>
        <div @click="gengduo()">
            <router-link to="/">
            <img src="../../../public/img/home/header/1.png" alt=""><br>
            <p class="outp">首页</p>
            </router-link><br>
        </div>
        <div @click="gengduo()">
            <router-link to="/header">
            <img src="../../../public/img/home/header/binggangaodian.png" alt=""><br>
            <p class="outp">小食</p>
            </router-link><br>
        </div>
        <div @click="gengduo()">
            <router-link to="/header">
            <img src="../../../public/img/home/header/new.png" alt=""><br>
            <p class="outp">最新活动</p>
            </router-link><br>
        </div>
        <div @click="gengduo()">
            <router-link to="/header">
            <img src="../../../public/img/home/header/qian.png" alt=""><br>
            <p class="outp">银行活动</p>
            </router-link><br>
        </div>
        <div @click="gengduo()">
            <router-link to="/header">
            <img src="../../../public/img/home/header/viphuiyuan.png" alt=""><br>
            <p class="outp">会员中心</p>
            </router-link><br>
        </div>
        </div>
    
        <!-- 左边的div -->
        <div class="rightdiv">
            <div class="dengludiv" @click="adenglu()">
            <img class="dengluimg"  src="../../../public/img/home/header/gerenzhongxin.png" alt=""><br>
            <span class="xiaoshou outp" >注册 | 登录</span>
            </div>
            <div @click="gouwu()">
            <router-link to="/header">
            <img src="../../../public/img/home/header/gouwuche.png" alt=""><br>
            <p class="outp">购物车</p>
            </router-link><br>
            </div>
            <div @click="gengduo()">
            <router-link to="/header">
            <img src="../../../public/img/home/header/ai238.png" alt=""><br>
            <p class="outp">更多</p>
            </router-link><br>
            </div>
        </div>
    </div>
    <!-- 弹窗点击杭州出现的div -->
    <div class="addr" v-show="isShow">
    <div class="adress" >
        <!-- 上面的div -->
        <div class="adresser">
        <p class="adresserp1"><img class="" src="../../../public/img/home/header/dizhi.png" alt=""></p>
        <p  class="active adresserp2" >杭州市</p>
        </div>
        <div>
            <ul class="adresserul">
                <li class="adresserli" v-for="(i,k) of address" :key="k"  >{{address[k].address}}</li>
            </ul>
        </div>
    </div>
    </div>
    <!-- 点击登录显示的页面 "-->
    <div class="denglul"  v-show="denglushow">
        <div class="dengluldiv">
            <table v-if="islogin">
            <tr>
                <td ><img  src="../../../public/img/home/header/gerenzhongxin.png" alt=""></td>
                <td  class="tdright tdfontsize">未登录</td>
            </tr>
            <tr>
                <td class="zhsize">账号密码登录</td>
                <td class="tdright sjsize"><a>手机验证码登录</a></td>
            </tr>
            <tr>
                <td colspan="2" class="tdinput"><input  type="text" :state="userunamestate" v-model="username" placeholder="请输入手机号码"  @blur="checkusername()"></td>
                <!-- <td><span></span></td> -->
            </tr>
             <tr>
                <td  colspan="2" class="tdinput"> <input type="password" :state="passwordstate" v-model="password"  placeholder="请输入密码"  @blur="checkuserpassword()"></td>
                <!-- <td></td> -->
            </tr>
            <tr>
                <td colspan="2" class="tdright tdfontsize"><a href="" class="wangjimima">忘记密码?</a></td>
                <!-- <td></td> -->
            </tr>
            <tr>
                <td colspan="2" class="tdfontsize tdinput">使用合作网站账号登录</td>
                <!-- <td></td> -->
            </tr>
            <tr>
                <td class="tdright tdfontsize"><a href=""><img  src="../../../public/img/home/header/zhifubao.png" alt=""></a></td>
                <td><a href=""><img  src="../../../public/img/home/header/weibo.png" alt=""></a></td>
            </tr>
            <tr>
                <td @click="login()" class=" tdbuttona"><span style="color: white; font-size: 16px;"  class="tdbuttona" >立即注册</span></td>
                <td @click="qrdenglu()" class="  tdbuttonb" ><span style="color: black; font-size: 16px;" class="tdbuttonb" >登 录</span></td>
            </tr>
        </table>
        <table v-else>
            <tr>
            <td colspan="2" class="zhsize">账号注册</td>
            <!-- <td></td> -->
            </tr>
            <tr>
                <td colspan="2" class="tdinput"><input v-model="pusername" :state="puserunamestate" @blur="checkUsername()"  type="text" name="zcuname" placeholder="手机号码"></td>
                <!-- <td></td> -->
            </tr>
            <tr>
                <td colspan="2" class="tdinput"><input v-model="ppassword" :state="ppasswordState"  @blur="checkPassword()" type="password" name="zcupwd" placeholder="密码(8-20位字符)"></td>
        <!-- <td></td> -->
            </tr>
            <tr>
                <td colspan="2" class="tdinput"><input v-model="ppassword2" :state="ppassword2State"  @blur="checkConPassword()" type="password" name="upwd2" placeholder="再次输入密码"></td>
                <!-- <td></td> -->
            </tr>
            <tr>
                <td @click="loginmust()" colspan="2" class="tdright yiyouzhanghao">已有账号，立即登录</td>
                <!-- <td></td> -->
            </tr>
            <tr>
                <td colspan="2" class=" zhucetd yiyouzhanghao tdinput "><span class="borderr" style="margin-top:-4px"></span> 《MCAKE购物协议》</td>
                <!-- <td class=""></td> -->
                
            </tr>
            <tr>
                <td @click="logout()" class="tdfontsize tdbuttona"><span style="color: white; font-size: 16px;"  class="tdbuttona">取消注册</span></td>
                <td @click="finish()" class=" tdfontsize tdbuttonb" ><span style="color: black; font-size: 16px;"  class="tdbuttonb" >完成注册</span></td>
            </tr>
            </table>
         </div>
    </div>
    <!-- 点击注册显示的页面v-show="istable2" -->
    <!-- <div class="denglul" v-show="istable2">
        <div class="dengluldiv">
            
        </div>
    </div>-->
    </div> 
</template>
<script>
export default {
    data(){
        //声明变量，保存地址数组
        return{
            address:[],
            //显示登录页面
            isShow:false,
            //显示地址
            denglushow:false,
            //显示登录注册表
            islogin:true,
            // //显示用户名验证结果
            // tishi:false,
            //保存用户输入的用户名
            username:'',
            //保存用户输入的密码
            password:'',
            //保存用户名状态
            userunamestate:'',
            //保存密码的状态
            passwordstate:'',
            //保存用户注册的用户名
            pusername:'',
            //保存用户注册的密码
            ppassword:'',
            //保存用户注册名状态
            puserunamestate:'',
            //保存用户注册密码状态
            ppasswordState:'',
            //保存确认密码
            ppassword2:'',
            //保存确认密码的状态
            ppassword2State:'',
          options: [{
          label: '热门城市',
          options: [{
            value: 'Shanghai',
            label: '上海'
          }, {
            value: 'Beijing',
            label: '北京'
          }]
        }, {
          label: '城市名',
          options: [{
            value: 'Chengdu',
            label: '成都'
          }, {
            value: 'Shenzhen',
            label: '深圳'
          }, {
            value: 'Guangzhou',
            label: '广州'
          }, {
            value: 'Dalian',
            label: '大连'
          }]
        }],
        value: ''
      
        }    
    },
    methods:{
        // 封装一个自定义函数
        headeblock(){
            if(this.denglushow==true){
                this.denglushow=false
            }else if(this.isShow==true){
            this.isShow=false
            }
            // this.headeblock()
        },
        //点击地址的div显示
        local(){
            this.isShow=!this.isShow;
            if(this.isShow==true){
                this.denglushow=false
            }
        },
        //点击登录的div显示
        adenglu(){
            this.denglushow=!this.denglushow;
            if(this.denglushow==true){
                this.isShow=false
            }
        },
        //点击头部左边的div都不会显示登录样式
        lefthead(){
            if(this.denglushow==true){
                this.denglushow=false
            }
        },
        //点击产品不显示其他的隐藏div
        changpin(){
            this.headeblock()
        },
        //点击购物车不会显示登录样式
        gouwu(){
            this.headeblock()
        },
        gengduo(){
            this.headeblock()
        },
        // 点击注册显示注册页面
        login(){
                    this.islogin=false
                },
        logout(){
                    this.islogin=true
                },
        loginmust(){
                this.islogin=true
        },

       //检验用户名
       checkusername(){
           let username = this.username;
        //校验用户名,用户名的规则为:字母、数字及下划线的组合,长度为6~12个字符
        let usernameRegExp = /^[0-9A-Za-z_]{6,12}$/
        if(usernameRegExp.test(username)){
          this.usernameState = 'success';
          return true;
        } else{
          this.usernameState = 'error';
          this.$toast({
            message:"请输入合法用户名",
            position:"top",
            duration:2000
          });
          return false;
        }
       },
       //校验密码
       checkuserpassword(){
          let password = this.password;
      //校验密码,密码的规则为:字母、数字及下划线的组合,长度为8~20个字符
      let passwordRegExp = /^[0-9A-Za-z_]{6,20}$/;
      if(passwordRegExp.test(password)){
        this.passwordState = 'success';
        return true;
      } else {
        this.passwordState = 'error';
        this.$toast({
          message:"请输入合法密码",
          position:"top",
          duration:2000
        });
        return false;
      }
     },
       qrdenglu(){
           if(this.checkusername() && this.checkuserpassword()){
          //如果所有信息都为合法的信息,则进行提交;
          this.axios.post('/user/login','username='+this.username+'&password='+this.password).then(res=>{
              if(res.data.code==0){
                this.$messagebox("登录提示","对不起,用户名或密码错误");
              }else{
                this.$router.push('/product');
              }
          })
      }
       },
       //注册
       checkUsername(){
        let username = this.pusername;
        //校验用户名,用户名的规则为:字母、数字及下划线的组合,长度为6~12个字符
        let usernameRegExp = /^[0-9A-Za-z_]{6,12}$/
        if(usernameRegExp.test(username)){
          this.usernameState = 'success';
          return true;
        } else{
          this.puserunamestate= 'error';
          this.$toast({
            message:"请输入合法用户名",
            position:"top",
            duration:2000
          });
          return false;
        }
    },
    checkPassword(){
      let password = this.ppassword;
      //校验密码,密码的规则为:字母、数字及下划线的组合,长度为8~20个字符
      let passwordRegExp = /^[0-9A-Za-z_]{6,20}$/;
      if(passwordRegExp.test(password)){
        this.passwordState = 'success';
        return true;
      } else {
        this.ppasswordState = 'error';
        this.$toast({
          message:"请输入合法密码",
          position:"top",
          duration:2000
        });
        return false;
      }
    },
    //检测确认密码
    checkConPassword(){
      let password2 = this.ppassword2;
      if(password2 == this.ppassword){
        this.ppassword2State = 'success';
        return true;
      } else {
        this.ppassword2State = 'error';
        this.$toast({
          message:"两次密码不一致",
          position:"top",
          duration:2000
        });
        return false;
      }
    },
            finish(){
            // this.islogin=true;
      //仍然进行用户名、密码及确认密码的校验
      if(this.checkUsername() && this.checkPassword() && this.checkConPassword()){
          //如果所有信息都为合法的信息,则进行提交;
          //post提交写法，get写法：/register/uname=?&upwd=?
          this.axios.post('/user/register','username='+this.username+'&password='+this.password).then(res=>{//res才是服务器返回的信息
            if(res.data.code==0){
              //注册失败
              this.$messagebox("注册提示","对不起,用户已存在");
            }else{
              //注册成功
              this.$router.push('/product');
            }
          })   
    }
    },

    },
    mounted(){
        //监听请求获取address地址
        this.axios.get('/pro/address').then(res=>{
            this.address=res.data
            // console.log(this.address)
        });
        // console.log("dayin")
        //用get传参的方式监听登录名和密码
       
    }
}
</script>
<style scoped >

/*设置菜单最外层div的位置为固定定位 */
.pout{
    height: 100px;
    } 
.out{
    position: fixed;
    z-index: 100;
    width: 100%;
    min-width: 1215px;
    border: 1px solid #ddd;
    background-color: white;
    }
.outp{
    font-size: 12px;
    margin-top: 13px;
    color: #999;
}
/* 浮动左边div,设置宽高*/
.leftdiv>div{
    width: 100px;
    height: 100px;
    float: left;
    border-right: 1px solid #ddd;
    text-align: center;
    padding-top: 30px;
    }
.leftdiv>div:hover,.rightdiv>div:hover{
    border-top: 2px solid orange;
    margin-top: -1px;
}

.imgwidth{
    border-right:0px;
}

/* 菜单div下面的图片的上边距 */
/* 浮动右边的div */
.rightdiv{
    float: right;
}
.rightdiv>div{
   width: 100px;
    height: 100px;
    float: left;
    border-left: 1px solid #ddd;
    text-align: center;
    padding-top: 30px;
    }
.dengluimg{
    margin-bottom: 10px;
}

/* 给a标签去掉下划线 */
.denglu{
    font-size:12px;
    color: #999;
}
.out p:hover,.xiaoshou:hover{
    color: #000;
    font-weight: 600;
}
a:hover{
text-decoration: none; 
}
.xiaoshou{
    cursor: pointer;
    margin-top: 3px;
}
/* 显示地址的div */
.addr{
    position: fixed;
    left: 0;
    top: 100px;
    width: 100%;
    height: 100%;
    z-index: 2;
    background:rgba(0, 0, 0, 0.5);
    /* display: none; */
}
.adress{
    width: 300px;
    height: 330px;
    padding-top: 35px;
    border: 1px solid #ddd;
    position: fixed;
    z-index: 6;
    margin-left:201px ;
    background: white;
    /* opacity: 1; */
}

/* 设置地址的第一个div */
.adresser{
    /* height: 100px; */
    padding:20px 30px 35px 40px;
    border-bottom: 1px solid #ddd;
    overflow: hidden;
    
}
.adresserp1{
    float: left;
}
.adresserp2{
    float: right;
    padding-top: 11px;
    font-size: 14px;
    font-weight:500;
    color: #555;
}
.adresserul{
    float: left;
    margin-left: 48px;
}
.adresserli{
    font-size: 16px;
    margin-top: 13px;
    color: #999;
}
.adresserli:hover{
    color: #000;
    font-weight: 600;
}
.denglu:hover{
    color: #000;
    font-weight: 600;
}
/* 设置登录的样式 */
.denglul{
    width: 100%;
    min-width: 1500px;
    position: fixed;
    left: 0;
    top: 100px;
    height: 100%;
    z-index: 2;
    background:rgba(0, 0, 0, 0.5);
    /* display: none; */
}
.dengluldiv{
    width: 100%;
    min-width: 1500px;
    height: 600px;
    margin: 0 auto;
    padding-top:160px ;
}
.dengluldiv>table{
    width: 340px;
    height: 380px;
    /* border: 0px solid #dddddd; */
    margin: 0 auto;
    border-collapse:collapse;
    background: white;
}
.dengluldiv>table>tr>td{
    height: 50px;
    /* text-align: center; */
    line-height: 35px;
    padding-top:15px;
    padding-left: 15px;
    padding-right: 15px;
    margin: 0 auto;
    
}
.dengluldiv>table a{
    text-decoration: none;
    color: #999;
}
.tdfontsize{
    font-size: 14px;
    color: #999;
}
.zhsize{
    font-size:18px;
    font-weight: bold;
    padding-bottom: 22px;
}
.sjsize{
    font-size: 16px;
}
.dengluldiv>table input{
    width: 300px;
    font-size: 14px;
    padding: 3px;
}
.tdinput{
    text-align: center;
    width: 300px;
}
.tdright{
    text-align: right;
    cursor: pointer;
}
.tdbuttona{
    width: 140px;
    height: 50px;
    background: #333;
    border: 0px;
    text-align: center;
    padding-bottom: 15px;
    cursor: pointer;
}
.tdbuttonb{
    width: 150px;
    background: #ffe32a; 
    border: 0px;
    height: 50px;
    text-align: center;
    padding-bottom: 15px; 
    cursor: pointer;
}
/* .dengluldiv>table a{
    color: white;
} */

/* 注册的样式——将第一个table的样式给第二个table */
.zhuce{
    margin-top: 12px;
}
.zhucetd{
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
    padding-bottom: 22px;
}
.zhucetd:hover{
    font-weight: 600;
}
.borderr{
    cursor: pointer;
    display: inline-block;
    width: 20px;
    height: 20px;
    border: 2px solid #ffe32a;
    border-radius: 50%;
    margin-right: -4px;
    text-align: center;
    vertical-align: middle;
}
.yiyouzhanghao:hover{
    font-weight: 600;
    /* font-size: 18px; */
}
</style>
<style >
/* .el-message-box__wrapper{
    width: 100%;
    min-width: 1500px;
    margin: 0 auto;
    padding: 0;
}
.el-message-box{
    width: 100%;
    padding: 0px;
    margin: -570px auto;
} */
</style>