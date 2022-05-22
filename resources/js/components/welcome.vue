<template>

            <div class="container" style="margin-top: -38rem;">
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