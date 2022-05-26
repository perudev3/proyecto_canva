<template>
        <div>
            <div class="container" style="margin-top:60px;">
                <div class="row">
                    <div class="col-sm-12" style="background: #8b3dff;border-radius: 6px;">
                        <div id="div-search" align="center">
                            <h2>¿Qué Buscas?</h2>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                                <input type="text" class="form-control" id="input-search">                                
                            </div>                            
                        </div>
                        <div class="col-sm-12" id="icon">
                            <ul>
                                <li v-for="data in categories">
                                    <img :src="'icon_category/'+data.categories_url">
                                </li>
                            </ul>
                        </div>
                    </div>
                    
                </div>
            </div>
           <div class="container">
                <div class="row" >
                    <div class="col-sm-3" v-for="data in files" style="margin-top: 26px;">
                        <div class="card">
                            <img :src="'portada/'+data.files_portada" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">{{ data.files_name }}</h5>
                                <template v-if="user==null">
                                    <a href="/login" class="btn btn-primary">Login</a>
                                </template>                                
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
                Category.GetCategories().then( response => {
                    this.categories = response.data;
                    console.log(this.categories);
                })
            },
        },

        mounted() {
            let self = this
            self.Get_Files();
            self.GetCategories();
        }
    }



</script>


<style>

    #div-search{
        margin-top: 40px;
        color: #fff;
    }
    
    .input-group{
        width: 50%;
    }

    #basic-addon1{
        margin-top: 29px;
        border-color: transparent;
        background: #ffffff;
    }

    #input-search{
        width: 50%;
        margin-top: 29px;
    }

    #icon {
        margin-top: 31px;
        margin-bottom: 25px;
    }

    #icon ul {
        list-style-type: none;
         margin: 0;
        padding: 0;
        line-height: 68px;
        margin-right: 73%;
    }

    #icon li {
        display: inline-block;
        width: 50%;
    }

    #icon img {
        width: 58%;
        border-radius: 30px;
    }

    #icon img:hover {
        
        background: #00000047;
        padding: 10px;
        transition: 1s;

    }

    @media screen and (min-width: 20em) {

        #icon li {
            width: 33.33333%;
        }

    }
</style>