

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
        path: '/pubish_job_offer',
        name: 'pubish_job_offer',
        component: require('./components/user/job_officer.vue').default
    },

    {
        path: '/category',
        name: 'category',
        component: require('./components/admin/category.vue').default
    },

    {
        path: '/binders',
        name: 'binders',
        component: require('./components/admin/binder.vue').default
    },

    {
        path: '/my_profile',
        name: 'my_profile',
        component: require('./components/user/profile.vue').default
    },

    {
        path: '/my_binders',
        name: 'my_binders',
        component: require('./components/user/my_binders.vue').default
    },


    {
        path: '/membership',
        name: 'membership',
        component: require('./components/admin/membership.vue').default
    },

    {
        path: '/suscription_membership',
        name: 'suscription_membership',
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
