<template>
    <!-- <div class="container" style="max-width: 972px;position: absolute;right: 3%;">
        <div class="row">
            <div class="container" style="margin-top:-24px;margin-bottom: 52px;">
                <div class="row">
                    <div class="col-sm-12">   
                                    
                        <div class="col-ms-12" id="data_categorias">
                            <div class="owl-carousel owl-theme" style="background:transparent">
                                    <div class="item" v-for="data in files" :key="data.id" style="margin-top: 26px;">   
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
                                <h5 class="modal-title" id="exampleModalLabel">{{ jobs_info.job_offer_name  }}</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6 modal-overflow">
                                        <p class="card-text" v-html="jobs_info.job_offer_description"></p>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="container" style="background: #f9f5f5;padding: 10px;border-radius: 9px;">
                                            <h5 class="modal-title" id="exampleModalLabel">POSTULACIÓN!!</h5>
                                            <div class="form-group row">
                                                <label for="inputvehiculo" class="col-sm-10 col-form-label">Nombres y Apellidos</label>
                                                <div class="col-sm-10">
                                                <input name="vehiculo" type="text" class="form-control" >
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputvehiculo" class="col-sm-10 col-form-label">Celular</label>
                                                <div class="col-sm-10">
                                                <input name="vehiculo" type="text" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputvehiculo" class="col-sm-10 col-form-label">E-mail</label>
                                                <div class="col-sm-10">
                                                <input name="vehiculo" type="email" class="form-control" >
                                                </div>
                                            </div>
                                             <div class="form-group row">
                                                <label for="inputvehiculo" class="col-sm-10 col-form-label">Curriculum</label>
                                                <div class="col-sm-10">
                                                <input name="vehiculo" type="file" class="form-control" >
                                                </div>
                                            </div>
                                        
                                            <div class="form-group row">
                                                <div class="col-sm-10">
                                                    <button type="button" class="btn btn-primary"><i class="fa fa-check"></i> Enviar  </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
                                <img class="card-img-top" :src="data.url_photo==null ? 'https://img.favpng.com/20/11/12/computer-icons-user-profile-png-favpng-0UAKKCpRRsMj5NaiELzw1pV7L.jpg' : 'photo/'+ data.url_photo"  alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">{{ data.job_offer_name }}</h5>
                                    <p class="card-text">{{ data.empresa.name }}</p>
                                    <p class="card-text" v-html="$options.filters.truncate(data.job_offer_description)"></p>
                                    <button type="button" class="btn btn-success" @click="Modal(data.job_offer_id)">Postular</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>   
            </template>

        </div>
    </div> -->

    
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
                jobs_info:[],
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

            Modal(job_offer_id){
                jobsofficer.GetFirstJob(job_offer_id).then(response => {
                    this.jobs_info = response.data;
                    console.log(response.data);
                })
                $('.modal').modal('show')
            },

            Get_Jobs(){
                jobsofficer.GetJobs().then( response => {
                    this.jobs = response.data;
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

    .modal-overflow{
        width: 253px;
        height: 368px;
        overflow: scroll;
        scrollbar-width: thin;
    }

    .modal-overflow::-webkit-scrollbar {
        width: 8px;     /* Tamaño del scroll en vertical */
        height: 8px;    /* Tamaño del scroll en horizontal */
        display: none;  /* Ocultar scroll */
    }

    .modal-overflow::-webkit-scrollbar-thumb  {
        background: #ccc;
        border-radius: 4px;
    }

</style>