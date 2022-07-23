<template>

    <div>
        <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">{{binder_name}}</h5>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-lg-4 col-xl-6">
                                        <vue2Dropzone ref="file_url" id="dropzone"
                                            :options="dropzoneOptions">
                                        </vue2Dropzone>
                                    </div>
                                    <div class="col-md-6 col-lg-4 col-xl-6">
                                        <div class="row">
                                            <div class="col-md-3 col-lg-4 col-xl-3" v-for="data in files" :key="data.id">
                                                <div class="symbol symbol-60px mb-5">
                                                    <img src="/media/svg/files/pdf.svg"/>
                                                </div>                                       
                                            </div>
                                        </div>
                                        
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
        <div class="mb-13 text-center">
            <h1 class="mb-3">Crear Carpetas</h1>
        </div>
        <div class="post d-flex flex-column-fluid" id="kt_post">
                <div id="kt_content_container" class="container-xxl">
                    <div class="card card-flush">
                        <div class="card-body pt-0">
                            <div class="row" style="margin-top:50px;">
                                    <div class="col-md-4">
                                        <div class="container">
                                            <form id="kt_modal_new_target_form" class="form fv-plugins-bootstrap5 fv-plugins-framework">
                                                <div class="d-flex flex-column mb-8 fv-row fv-plugins-icon-container">
                                                    <label class="d-flex align-items-center fs-6 fw-bold mb-2">
                                                        Nombre de la carpeta
                                                    </label>
                                                    <input type="text" class="form-control form-control-solid" v-model="name">
                                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                                </div>
                                                <div class="d-flex flex-column mb-8 fv-row fv-plugins-icon-container">
                                                    <label class="d-flex align-items-center fs-6 fw-bold mb-2">
                                                        Nombre de la agencia
                                                    </label>
                                                    <autocomplete :search="search"
                                                        :get-result-value="getResultValue"
                                                        class="form-control form-control-solid"
                                                        @submit="onSubmit"
                                                    ></autocomplete>
                                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-10">
                                                    <button type="button" @click="RegisterBinder()" class="btn btn-danger">
                                                        Registrar <i class="fa fa-check"></i> </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div id="kt_ecommerce_sales_table_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                            <div class="table-responsive">
                                                <table class="table align-middle table-row-dashed fs-6 gy-5 dataTable no-footer" id="kt_ecommerce_sales_table">
                                                    <thead>
                                                        <th class="text-center min-w-100px sorting" tabindex="0" aria-controls="kt_ecommerce_sales_table" rowspan="1" colspan="1" aria-label="Order ID: activate to sort column ascending" style="width: 131.113px;"></th>
                                                        <th class="text-center min-w-100px sorting" tabindex="0" aria-controls="kt_ecommerce_sales_table" rowspan="1" colspan="1" aria-label="Customer: activate to sort column ascending" style="width: 275.675px;">Carpeta</th>
                                                        <th class="text-center min-w-100px sorting" tabindex="0" aria-controls="kt_ecommerce_sales_table" rowspan="1" colspan="1" aria-label="Customer: activate to sort column ascending" style="width: 275.675px;">Agencia</th>
                                                        <th class="text-center min-w-100px sorting" tabindex="0" aria-controls="kt_ecommerce_sales_table" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 100.425px;">Estado</th>
                                                        <th class="text-center min-w-100px sorting" tabindex="0" aria-controls="kt_ecommerce_sales_table" rowspan="1" colspan="1" aria-label="Total: activate to sort column ascending" style="width: 131.113px;">Opciones</th>
                                                    </thead>
                                                    
                                                    <tbody class="fw-bold text-gray-600">
                                                                
                                                        <tr class="odd" v-for="data in binders.data" :key="data.id">
                                                            <td class="text-end">
                                                                <div class="form-check form-check-sm form-check-custom form-check-solid">
                                                                    <i class="fas fa-folder"></i>
                                                                </div>
                                                                
                                                            </td>	
                                                            <td class="text-center">
                                                                <div class="form-check form-check-sm form-check-custom form-check-solid">
                                                                    {{ data.binder_name }}
                                                                </div>
                                                                
                                                            </td>	
                                                            <td class="text-center">
                                                                <div class="form-check form-check-sm form-check-custom form-check-solid">
                                                                    {{ data.empresas.name }}
                                                                </div>
                                                                
                                                            </td>	
                                                            <td class="text-center">
                                                                <div class="form-check form-check-sm form-check-custom form-check-solid">
                                                                    {{ data.binder_status==1 ? 'Activo' : 'Inactivo' }}
                                                                </div>
                                                                
                                                            </td>
                                                            <td class="text-center">
                                                                <div class=" w-100 mw-170px" data-select2-id="select2-data-122-23fk">
                                                                    <select class="form-control form-control-solid w-170px ps-14" @change="OptionChange($event)">
                                                                        <template>
                                                                            <option value="0">Seleccionar...</option>
                                                                        </template>
                                                                        <option :value="[1 , data.binder_id]">Subir</option>
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-12 col-md-7 d-flex align-items-center justify-content-center justify-content-md-end">
                                                    <div class="dataTables_paginate paging_simple_numbers" id="kt_ecommerce_sales_table_paginate">
                                                        <ul class="pagination">
                                                            <li class="paginate_button page-item previous"  v-show="binders.prev_page_url" id="kt_ecommerce_sales_table_previous">
                                                                <a href="#" aria-controls="kt_ecommerce_sales_table" @click.prevent="getPreviousPage" data-dt-idx="0" tabindex="0" class="page-link">
                                                                    <i class="previous"></i>
                                                                </a>
                                                            </li>
                                                            <li class="paginate_button page-item" :class="{ 'active': (binders.current_page=== n) }" v-for="n in binders.last_page">
                                                                <a href="#" @click.prevent="getPage(n)" aria-controls="kt_ecommerce_sales_table" data-dt-idx="1" tabindex="0" class="page-link">
                                                                    {{ n }}
                                                                </a>
                                                            </li>
                                                            <li class="paginate_button page-item next" v-show="binders.next_page_url" id="kt_ecommerce_sales_table_next">
                                                                <a href="#" aria-controls="kt_ecommerce_sales_table" @click.prevent="getNextPage" data-dt-idx="6" tabindex="0" class="page-link">
                                                                    <i class="next"></i>
                                                                </a>
                                                            </li>
                                                        </ul>
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
                binder_name:'',
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

            OptionChange(event){
                let dat = event.target.value.split(',')
                if(dat[0]==1){
                    this.ModalUpload(dat[1]);
                }
            },

            ModalUpload(binder_id){
                File.GetFiles(binder_id).then( response => {
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
		    },


            DataBinder(){
                Binder.GetBinders().then( response => {
                    this.binders = response.data;
                })
            },

            //Pagination//
            getPage(page){
                Binder.GetPageBinder(page).then((response)=>{
                    this.binders = response.data;
                });
            },
            getPreviousPage(){
                axios.get(this.binders['prev_page_url']).then((response)=>{
                    this.binders = response.data;
                },(response)=>{
                });
            },
            getNextPage(){
                axios.get(this.binders['next_page_url']).then((response)=>{
                    this.binders = response.data;
                },(response)=>{
                });
            },
            //End Pagination//

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

<style scoped>
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