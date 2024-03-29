import Vue from 'vue'
import App from './App.vue'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import '../src/assets/reset.css'
import 'font-awesome/css/font-awesome.min.css'
import router from './router/index'
import request from './utils/request'
import './assets/base.less'
// import axios from 'axios'

Vue.use(ElementUI)
Vue.prototype.request = request  //挂载到原型,全局使用
Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
