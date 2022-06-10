<template>
    <div class="container" style="max-width: 972px;position: absolute;right: 3%;">
        <div class="row">
            <div class="container" style="margin-top:-24px;margin-bottom: 52px;">
                <div class="row">
                    <div class="col-sm-12" style="background: -webkit-linear-gradient(110deg, rgb(126, 54, 228) 10%, rgb(110, 209, 419) 66%);border-radius: 17px;padding: 28px;padding-top: 0px;">
                        <div id="div-search" align="center">
                            <h2>¿Qué Buscas?</h2>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                                <input type="text" class="form-control" placeholder="Buscar..." id="input-search">                                
                            </div>                            
                        </div>        
                                    
                        <div class="col-ms-12" id="data_categorias">
                            <div class="owl-carousel owl-theme" style="background:transparent">
                                    <div class="item" v-for="data in files" style="margin-top: 26px;">   
                                        <div class="card">
                                            <img :src="'portada/'+data.files_portada" class="card-img-top">
                                            <div class="card-body">
                                                <h5 class="card-title">{{ data.files_name }}</h5>
                                                <template v-if="user.status_membership==0">
                                                    <p><a href="/membership" class="btn btn-primary" target="_blank" style="background-color: #a351f5;border-color: #a351f5;border-radius: 34px;"><i class="fa fa-eye"></i></a></p>
                                                    
                                                    <p><a href="/membership" class="btn btn-primary" target="_blank" style="background-color: #a351f5;border-color: #a351f5;border-radius: 34px;"><i class="fa fa-download"></i></a></p>
                                                    
                                                    <p><a href="/membership" class="btn btn-primary" target="_blank"><i class="fa fa-heart"></i></a></p>
                                                </template>  
                                                <template v-else>
                                                    <div class="row" id="icon-option">
                                                        <div class="col-md-6">
                                                            <a :href="'file/'+data.files_url" class="btn btn-primary" target="_blank" style="background-color: #a351f5;border-color: #a351f5;border-radius: 34px;"><i class="fa fa-eye"></i></a>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <a :href="'file/'+data.files_url" class="btn btn-primary" target="_blank" style="background-color: #a351f5;border-color: #a351f5;border-radius: 34px;"><i class="fa fa-download"></i></a>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <p><a :href="'file/'+data.files_url" target="_blank"><i class="fa fa-heart"></i></a></p>
                                                
                                                </template>                               
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>



            <template v-if="user.roles_id==2">
                <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                
                            </div>
                            <div class="modal-footer">
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="owl-carousel owl-theme" style="background:transparent" >
                        <div  class="item"   v-for="(data, index) in jobs" :key="index + 1" style="background:transparent;">
                            <div class="card"  style="width:350px; height:280px; background:white; box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.2);">
                                <img class="card-img-top" src="" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">{{ data.job_offer_name }}</h5>
                                    <p class="card-text">{{ data.empresa.name }}</p>
                                    <p class="card-text" v-html="$options.filters.truncate(data.job_offer_description)"></p>
                                    <button type="button" class="btn btn-success" @click="Modal()">Postular</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>   
            </template>

        </div>
    </div>

</template>


<script>

    import Swal from 'sweetalert2/dist/sweetalert2.js'
    import 'sweetalert2/src/sweetalert2.scss'
    import File from '../endpoints/admin/files'
     import Category from '../endpoints/admin/category'
     import jobsofficer from '../endpoints/user/job_officer'

    export default {

        props:['user'],

        data:function(){
            return {
                files:[],
                categories:[],
                jobs:[],
            }
        },

        filters: {
            truncate: function (text, length) {
                if (text.length > 100) {
                    return text.substring(0, 90) + '...'
                } else {
                    return text
                }
            },
        },

        methods: {

            Modal(){
                $('.modal').modal('show')
            },

            Get_Jobs(){
                jobsofficer.GetJobs().then( response => {
                    this.jobs = response.data;
                    this.$nextTick(() => {
                            $('.owl-carousel').owlCarousel({
                                nav: true,
                                navText: [
                                    "<i class='fa fa-chevron-left' style='color: black;font-size: 30px;'></i>",
                                    "<i class='fa fa-chevron-right' style='color: black;font-size: 30px;'></i>"
                                ],
                                items: 1,
                                loop: false,
                                margin: 10,
                                autoplayTimeout: 900,
                                autoplayHoverPause: false,
                                responsiveClass: false,
                                responsive: {
                                    0: {
                                        items: 6,
                                        nav: true
                                    },
                                    600: {
                                        items: 6,
                                        nav: true
                                    },
                                    1000: {
                                        items: 6,
                                        nav: true,
                                        loop: false,
                                        margin: 20
                                    }
                                }
                            });            
                    });
                })
                .catch((error) => {
                    console.log(error);
                });
            },

            Get_Files(){
                File.GetFiles().then( response => {
                    this.files = response.data;
                })
                .catch((error) => {
                    console.log(error);
                });
            },
            GetCategories(){
                let me = this
                Category.GetCategories().then( response => {
                    me.categories = response.data;
                    me.$nextTick(() => {
                            $('.owl-carousel').owlCarousel({
                                nav: true,
                                navText: [
                                    "<i class='fa fa-chevron-left' style='color: black;font-size: 30px;'></i>",
                                    "<i class='fa fa-chevron-right' style='color: black;font-size: 30px;'></i>"
                                ],
                                items: 1,
                                loop: false,
                                margin: 10,
                                autoplayTimeout: 900,
                                autoplayHoverPause: false,
                                responsiveClass: false,
                                responsive: {
                                    0: {
                                        items: 1,
                                        nav: true
                                    },
                                    600: {
                                        items: 3,
                                        nav: true
                                    },
                                    1000: {
                                        items: 3,
                                        nav: true,
                                        loop: false,
                                        margin: 20
                                    }
                                }
                            });            
                    });
                })
            },

            Search_Files(categories_id){
                File.SearchFiles({ 'categories_id': categories_id}).then( response => {
                    this.files = response.data; 
                })
                .catch((error) => {
                    console.log(error);
                });
            }
        },

        mounted() {
            let self = this
            self.Get_Files();
            self.GetCategories();
            self.Get_Jobs();
        }
    }



</script>

<style>

    .fa-heart{
        font-size: 24px;
        color: #c5b9b9;
    }

    #icon-option span{
        font-size: 12px;
    }

</style>