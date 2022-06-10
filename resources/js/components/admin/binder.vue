<template>

    <div>
        <div class="container">
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
                            <vue2Dropzone ref="file_url" id="dropzone"
                                        :options="dropzoneOptions">
                            </vue2Dropzone><br><br>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-4" v-for="data in files">
                                        <img :src="'/file/'+data.file_url" style="width: 100%;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" @click="PostFiles()" class="bn btn-success">Subir</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page">Binders</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5">
                    <div class="container" style="background: #f9f5f5;padding: 10px;border-radius: 9px;">
                        <div class="form-group row">
                            <label for="inputvehiculo" class="col-sm-2 col-form-label">Name</label>
                            <div class="col-sm-10">
                            <input name="vehiculo" type="text" class="form-control" v-model="name" >
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputvehiculo" class="col-sm-2 col-form-label">Name</label>
                            <div class="col-sm-10">
                                <autocomplete :search="search"
                                                placeholder="Nombre del Producto"
                                                :get-result-value="getResultValue"
                                                @submit="onSubmit"
                                                ></autocomplete>
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <div class="col-sm-10">
                            <button type="button" @click="RegisterBinder()" class="btn btn-primary"><i class="fa fa-check"></i> Registrar  </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                        <table class="table" style="background: #f7f7f7;border-radius: 10px;">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Empresa</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Option</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="data in binders">
                                    <th scope="row">
                                        <i class="fas fa-folder"></i>
                                    </th>
                                    <td>{{  data.binder_name }}</td>
                                    <td>{{  data.empresas.name }}</td>
                                    <td>{{ data.binder_status==1 ? 'Activo' : 'Inactivo' }}</td>
                                    <td>
                                        <button class="btn btn-success" @click="ModalUpload(data.binder_id)">
                                            <i class="fas fa-upload"></i> Subir 
                                        </button>
                                    </td>
                                    <td>
                                        <button class="btn btn-success"><i class="fas fa-edit"></i> Editar</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

    import Swal from 'sweetalert2/dist/sweetalert2.js'
    import 'sweetalert2/src/sweetalert2.scss'
    import Autocomplete from '@trevoreyre/autocomplete-vue'
    import '@trevoreyre/autocomplete-vue/dist/style.css'
    import vue2Dropzone from 'vue2-dropzone'
    import 'vue2-dropzone/dist/vue2Dropzone.min.css'
    import Binder from '../../endpoints/admin/binder'
    import File from '../../endpoints/admin/files'

    export default {

        components: {
            Autocomplete,
            vue2Dropzone
        },

        data:function(){
            return {
                name:'',
                user_id:'',
                binders: [],
                binder_id:'',
                files:[],
                dropzoneOptions: {
                    url: 'empresa/producto',
                    thumbnailWidth: 150,
                    maxFilesize: 1.5,
                    addRemoveLinks : true,
                    autoProcessQueue:false,
                    headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                    uploadMultiple: true,
                },
            }
        },
        methods: {

            ModalUpload(binder_id){
                File.GetFiles(binder_id).then( response => {
                    console.log(response.data);
                    this.files = response.data;
                    this.binder_id = binder_id;
                })
                $('.modal').modal('show')
            },

            PostFiles(){
                this.$refs.file_url.processQueue();
                let images  = this.$refs.file_url.getAcceptedFiles();
                let  data = new FormData()
                for( let i = 0; i < images.length; i++ ){
                    let file = images[i];
                    data.append('file_url[' + i + ']', file);
                }
                data.append("binder_id", this.binder_id)
                File.CreateFile(data).then(response => {
                        if (response.data.status==='success') {
                            Swal.fire({
                              title: response.data.message,
                              text: 'Material Registrada',
                              type: 'success',
                              confirmButtonText: 'OK'
                            });
                            File.GetFiles(this.binder_id).then( response => {
                                this.files = response.data;
                            })
                        }else{
                            Swal.fire({
                              title: response.data.message,
                              text: 'Medidas Incorrectas de las Imagenes',
                              type: 'success',
                              confirmButtonText: 'OK'
                            })
                        };
                }).catch(function (error) {
                    console.log(error);
                });
            },



            search(input) {

                const url = `user_membership?name=${encodeURI(input)}`;
                return new Promise((resolve) => {
                    if (input.length < 3) {
                        return resolve([])
                    }

                    fetch(url)
                    .then((response) => response.json())
                    .then((data) => {
                        resolve(data);                    
                    })
                })
            },

            getResultValue(result) {
                return result.name;
            },

            onSubmit(result) {
			    this.user_id=result.id;
                console.log(this.user_id);
		    },


            DataBinder(){
                Binder.GetBinders().then( response => {
                    this.binders = response.data;
                    console.log(this.binders);
                })
            },

            RegisterBinder(){
                let me = this;
                let  data = new FormData()
                
                data.append("name", me.name)
                data.append("user_id", me.user_id)

                Binder.CreateBinder(data).then( response => {
                    console.log(response.data);
                    Swal.fire({
                        icon: 'success',
                        title: 'Exito',
                        text: response.data.message
                    });
                    this.DataBinder();
                })
                .catch((error) => {
                    console.log(error);
                });
            },
        },

        mounted(){
            let me = this
            me.DataBinder();
        }
    }



</script>