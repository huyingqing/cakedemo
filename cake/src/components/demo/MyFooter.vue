<template>
<!-- 底部的div -->
    <div>
        <!-- 上排 -->
        <div class="outflex ">
            <!-- 左 -->
            <div class="col-4 m-0 p-3">
                <img src="../../../public/img/home/footer/logo1.png" alt=""><br>
                <p class="footerp">订购热线：4006-678-678（8:00 - 20:00)</p>
                <p class="footerp">客服邮箱：cs@mcake.com</p>
                <p class="footerp">地址：上海市普陀区同普路1130弄3号楼</p>
                <router-link to="/header"><p class="footerp">食品生产许可证：SC12431010700121</p></router-link>
            </div>
            <!-- 中 -->
            <div class="col-4 m-0">
                <div class="row col-12 justify-content-around m-0">
                <!-- 左边的ul -->
                <ul class="col-4 m-0 p-0">
                    <router-link to="/header"><li style="font-size:16px;color: white; margin-bottom: 22px;">关于我们</li></router-link>
                    <router-link to="/header"><li>企业介绍</li></router-link>
                    <router-link to="/header"><li>媒体合作</li></router-link>
                    <router-link to="/header"><li>招贤纳士</li></router-link>
                    <router-link to="/header"><li>呼叫中心</li></router-link>
                </ul>
                <!-- 中间ul -->
                <ul class="col-4 m-0">
                    <router-link to="/header"><li style="font-size:16px;color: white; margin-bottom: 22px;">帮助中心</li></router-link>
                    <router-link to="/header"><li>投诉与建议</li></router-link>
                    <router-link to="/header"><li>会员权益</li></router-link>
                    <router-link to="/header"><li>支付类</li></router-link>
                    <router-link to="/header"><li>订单相关</li></router-link>
                    <router-link to="/header"><li>配送服务</li></router-link>
                </ul>
                <ul class="col-4 m-0">
                    <router-link to="/header"><li style="font-size:16px;color: white; margin-bottom: 22px;">发现</li></router-link>
                    <router-link to="/header"><li>公告</li></router-link>
                </ul>
                </div>
            </div>
            <!-- 右 -->
            <div class="col-4 m-0 text-center p-5">
                <router-link to="/header"><img src="../../../public/img/home/footer/weibo.png" ></router-link>
                <router-link to="/header"><img src="../../../public/img/home/footer/weixin.png"></router-link>
            </div>
        </div>
        <!-- 第二排 -->
        <div class="outflex ">
            <!-- 左 -->
            <div class="col-4 m-0 p-3">
                <p class="footerp">上海卡法电子商务有限公司</p>
                <p class="footerp">地址：上海市普陀区同普路1130弄3号楼</p>
                <p class="footerp">洽谈电话：021-52691591</p>
                <p class="footerp">社会信用代码：913101070678091460</p>
                <router-link to="/header"><p class="footerp">食品经营许可证：JY13101070034251</p></router-link>
            </div>
            <!-- 中 -->
            <div class="col-4 m-0 p-3">
                <p class="footerp">上海卡法电子商务有限公司北京分公司</p>
                <p class="footerp">地址：北京市朝阳区东四环中路82号3座16层1908</p>
                <p class="footerp">洽谈电话：010-52088262</p>
                <router-link to="/header"><p class="footerp">社会信用代码：911101053484280752</p></router-link>
                <router-link to="/header"><p class="footerp">食品经营许可证：JY11105212634724</p></router-link>
            </div>
            <!-- 右 -->
            <div class="col-4 m-0 pt-3 pl-5 ">
                <p class="footerp">上海卡法电子商务有限公司杭州分公司</p>
                <p class="footerp">地址：杭州市拱墅区中环大厦607室</p>
                <p class="footerp">洽谈电话：0571-28103688</p>
                <router-link to="/header"><p class="footerp">社会信用代码：913301060920344424</p></router-link>
                <router-link to="/header"><p class="footerp">食品经营许可证：JY13301050141226</p></router-link>
            </div>
        </div>
        <!-- 第三排 -->
        <div class="outflex col-12 m-0 p-3 justify-content-around">
            <p class="footerp">Copyright © 2012-2020 上海卡法电子商务有限公司 版权所有 <router-link to="/header"><span class="footerspan">沪ICP备12022075号</span></router-link></p>
        </div>

    </div>
</template>
<style >
/* 使用弹性第一排 */
*{margin: 0;padding: 0;}
.outflex{
    width: 100%;
    min-width: 1500px;
    display: flex;
    flex-flow: nowrap;
    background-color: black;
    color: #fff;
    padding:40px 150px;
}
.footerp,.footerspan{
    font-size: 12px;
    margin-top: 13px;
    color: #999;
}
li{
    font-size: 12px;
    margin-top: 13px;
    color: #999;
    list-style: none;
}
a{
    text-decoration: none;
}
a:hover{
    text-decoration: none;
    font-weight: 600;
}

</style>