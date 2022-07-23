<template>

        <div>
            <div class="mb-13 text-center">
                <h1 class="mb-3">Crear Categorias</h1>
            </div>
            <div class="post d-flex flex-column-fluid" id="kt_post">
                <div id="kt_content_container" class="container-xxl">
                    <div class="card card-flush">
                        <div class="card-body pt-0">
                            <div class="row" style="margin-top:50px;">
                                    <div class="col-md-6">
                                        <div class="container">
                                            <form id="kt_modal_new_target_form" class="form fv-plugins-bootstrap5 fv-plugins-framework">
                                                <div class="d-flex flex-column mb-8 fv-row fv-plugins-icon-container">
                                                    <label class="d-flex align-items-center fs-6 fw-bold mb-2">
                                                        Nombre
                                                    </label>
                                                    <input type="text" class="form-control form-control-solid" v-model="name">
                                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-10">
                                                    <button type="button" @click="RegisterCategory()" class="btn btn-danger">
                                                        Registrar <i class="fa fa-check"></i> </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div id="kt_ecommerce_sales_table_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                            <div class="table-responsive">
                                                <table class="table align-middle table-row-dashed fs-6 gy-5 dataTable no-footer" id="kt_ecommerce_sales_table">
                                                    <thead>
                                                        <th class="text-center min-w-100px sorting" tabindex="0" aria-controls="kt_ecommerce_sales_table" rowspan="1" colspan="1" aria-label="Order ID: activate to sort column ascending" style="width: 131.113px;">ID</th>
                                                        <th class="text-center min-w-100px sorting" tabindex="0" aria-controls="kt_ecommerce_sales_table" rowspan="1" colspan="1" aria-label="Customer: activate to sort column ascending" style="width: 275.675px;">Nombre</th>
                                                        <th class="text-center min-w-100px sorting" tabindex="0" aria-controls="kt_ecommerce_sales_table" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 100.425px;">Estado</th>
                                                        <th class="text-center min-w-100px sorting" tabindex="0" aria-controls="kt_ecommerce_sales_table" rowspan="1" colspan="1" aria-label="Total: activate to sort column ascending" style="width: 131.113px;">Opciones</th>
                                                    </thead>
                                                    
                                                    <tbody class="fw-bold text-gray-600">
                                                                
                                                        <tr class="odd" v-for="data in categories.data" :key="data.id">
                                                            <td class="text-end">
                                                                <div class="form-check form-check-sm form-check-custom form-check-solid">
                                                                    {{ data.categories_id }}
                                                                </div>
                                                                
                                                            </td>	
                                                            <td class="text-center">
                                                                <div class="form-check form-check-sm form-check-custom form-check-solid">
                                                                    {{ data.categories_name }}
                                                                </div>
                                                                
                                                            </td>	
                                                            <td class="text-center">
                                                                <div class="form-check form-check-sm form-check-custom form-check-solid">
                                                                    {{ data.categories_status==1 ? 'Activo' : 'Inactivo' }}
                                                                </div>
                                                                
                                                            </td>
                                                            <td class="text-center">
                                                                <div class=" w-100 mw-170px" data-select2-id="select2-data-122-23fk">
                                                                    <select class="form-control form-control-solid w-170px ps-14">
                                                                        <template>
                                                                            <option value="0">Seleccionar...</option>
                                                                        </template>
                                                                        <option>Editar</option>
                                                                        <option>Eliminar</option>
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
                                                            <li class="paginate_button page-item previous"  v-show="categories.prev_page_url" id="kt_ecommerce_sales_table_previous">
                                                                <a href="#" aria-controls="kt_ecommerce_sales_table" @click.prevent="getPreviousPage" data-dt-idx="0" tabindex="0" class="page-link">
                                                                    <i class="previous"></i>
                                                                </a>
                                                            </li>
                                                            <li class="paginate_button page-item" :class="{ 'active': (categories.current_page=== n) }" v-for="n in categories.last_page">
                                                                <a href="#" @click.prevent="getPage(n)" aria-controls="kt_ecommerce_sales_table" data-dt-idx="1" tabindex="0" class="page-link">
                                                                    {{ n }}
                                                                </a>
                                                            </li>
                                                            <li class="paginate_button page-item next" v-show="categories.next_page_url" id="kt_ecommerce_sales_table_next">
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
    import Category from '../../endpoints/admin/category'

    export default {

        data:function(){
            return {
                name:'',
                categories: [],
            }
        },
        methods: {


            DataCategory(){
                Category.GetCategories().then( response => {
                    this.categories = response.data;                    
                })
            },
            //Pagination//
            getPage(page){
                Category.GetPageCategories(page).then((response)=>{
                    this.categories = response.data;
                });
            },
            getPreviousPage(){
                axios.get(this.categories['prev_page_url']).then((response)=>{
                    this.categories = response.data;
                },(response)=>{
                });
            },
            getNextPage(){
                axios.get(this.categories['next_page_url']).then((response)=>{
                    this.categories = response.data;
                },(response)=>{
                });
            },
            //End Pagination//

            RegisterCategory(){
                let me = this;
                let  data = new FormData()
                
                data.append("name", me.name)

                Category.CreateCategory(data).then( response => {
                    console.log(response.data);
                    Swal.fire({
                        icon: 'success',
                        title: 'Exito',
                        text: response.data.message
                    });
                    this.DataCategory();
                })
                .catch((error) => {
                    console.log(error);
                });
            },
        },

        mounted(){
            let me = this
            me.DataCategory();
        }
    }



</script>