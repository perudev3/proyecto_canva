<template>
    <div>
        <div class="container" style="margin-top:-25px;margin-bottom: 32px;">
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
                       
                    </div>                    
                </div>
        </div>
    
        <div class="container">
            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">{{binder_name}}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-4" v-for="data in files">
                                        <a :href="'/file/'+data.file_url" target="_blank">
                                            <img :src="'/file/'+data.file_url" style="width: 100%;" />
                                        </a>                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page">Mis Carpetas</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="container" style="background: #f9f5f5;padding: 10px;border-radius: 9px;">
                        <div class="row">
                                <div class="col-md-2" v-for="data in binders" @click="GetFiles(data.binder_id, data.binder_name, data.empresas.membership_id)">
                                    <i class="fas fa-folder" style="font-size: 62px;" ></i>
                                    <p><label>{{ data.binder_name }}</label></p>
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
    import BindersUser from '../../endpoints/user/my_binders'

    export default {

        data:function(){
            return {
                name:'',
                binders: [],
                binder_name:'',
                files:[],
            }
        },
        methods: {


            DataBindersUser(){
                BindersUser.GetBindersEmpresa().then( response => {
                    this.binders = response.data;
                    console.log(this.binders);
                })
            },

            GetFiles(binder_id, binder_name, membership_id){
                if (membership_id==null) {
                    location.href='/suscription_membership'
                }else{
                    BindersUser.GetFileEmpresa(binder_id).then( response => {
                        this.files = response.data;
                        this.binder_name = binder_name;
                        $('.modal').modal('show')
                        console.log(this.files);
                    })
                }
                
            }
        },

        mounted(){
            let me = this
            me.DataBindersUser();
        }
    }



</script>
