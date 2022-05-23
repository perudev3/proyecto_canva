<template>
        <div>
            <div class="container" style="margin-top:60px;">
                <div class="row">
                    <div class="col-sm-12" style="background: #8b3dff;border-radius: 6px;">
                        <div id="div-search" align="center">
                            <h2>¿Qué Buscas?</h2>
                            <input type="text" class="form-control" id="input-search">
                        </div>
                    </div>
                    <div class="col-sm-12">

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

    export default {

        props:['user'],

        data:function(){
            return {
                files:[],
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
        },

        mounted() {
            let self = this
            self.Get_Files();
        }
    }



</script>


<style>

    #div-search{
        margin-top: 40px;
        color: #fff;
    }
    #input-search{
        width: 50%;
        margin-top: 29px;
    }
</style>