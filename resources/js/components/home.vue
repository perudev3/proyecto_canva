<template>

            <div class="container" >
                <div class="row" >
                    <div class="col-sm-3" v-for="data in files" style="margin-top: 26px;">
                        <div class="card">
                            <img :src="'portada/'+data.files_portada" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">{{ data.files_name }}</h5>
                                <template v-if="user.status_membership==0">
                                    <a href="/membership" class="btn btn-primary">Obtener Membresía</a>
                                </template>  
                                <template v-else>
                                    <a :href="'file/'+data.files_url" class="btn btn-primary" target="_blank">Ver</a>
                                    
                                    <a :href="'file/'+data.files_url" class="btn btn-primary" target="_blank">Descargar</a>                                
                                    
                                    <a :href="'file/'+data.files_url" class="btn btn-primary" target="_blank">Favorito</a>
                                
                                </template>                                 
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