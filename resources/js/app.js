

require('./bootstrap');

window.Vue = require('vue');
import VueRouter from 'vue-router';

Vue.use(VueRouter);

const routes = [

    {
        path: '/',
        name: '/',
        component: require('./components/welcome.vue').default
    },


    {
        path: '/home',
        name: 'home',
        component: require('./components/home.vue').default
    },

    {
        path: '/files',
        name: 'files',
        component: require('./components/admin/files.vue').default
    },

    {
        path: '/membership',
        name: 'membership',
        component: require('./components/user/membership.vue').default
    },

]


const router = new VueRouter({
    routes: routes,
    mode: "history"
})

const app = new Vue({
    router
}).$mount('#app');
