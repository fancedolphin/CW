import vue from 'vue'
import Router from 'vue-router'
import HomeView from '../views/HomeView.vue'

vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'home',
            component: HomeView
          },
          {
            path: '/Secondhand',
            name: 'Secondhand',
            component: () => import(/* webpackChunkName: "about" */ '../views/Secondhand.vue')
          },
          {
            path: '/RunErrands',
            name: 'RunErrands',
            component: () => import(/* webpackChunkName: "about" */ '../views/RunErrands.vue')
          },
          {
            path: '/Log',
            name: 'Log',
            component: () => import(/* webpackChunkName: "about" */ '../views/Log.vue')
          },
          {
            path: '/Schedule',
            name: 'Schedule',
            component: () => import(/* webpackChunkName: "about" */ '../views/Schedule.vue')
          },
          
    ],
    mode: 'history'
})