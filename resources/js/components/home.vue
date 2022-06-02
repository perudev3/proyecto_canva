<template>
    <div class="container" style="max-width: 972px;position: absolute;right: 3%;">
        <div class="row">
            <div class="container" style="margin-top:38px;margin-bottom: 52px;">
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

        </div>
    </div>

</template>


<script>

    import Swal from 'sweetalert2/dist/sweetalert2.js'
    import 'sweetalert2/src/sweetalert2.scss'
    import File from '../endpoints/admin/files'
     import Category from '../endpoints/admin/category'

    export default {

        props:['user'],

        data:function(){
            return {
                files:[],
                categories:[],
            }
        },

        methods: {

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