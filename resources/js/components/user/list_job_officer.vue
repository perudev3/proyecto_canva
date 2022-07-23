<template>
<div>
    <div class="mb-13 text-center">
            <h1 class="mb-3">Lista de puestos creados</h1>
    </div>
    <div class="post d-flex flex-column-fluid" id="kt_post">
		<div id="kt_content_container" class="container-xxl">
			<div class="card card-flush">
				<div class="card-header align-items-center py-5 gap-2 gap-md-5">
					<div class="card-title">
						<div class="d-flex align-items-center position-relative my-1">
							<span class="svg-icon svg-icon-1 position-absolute ms-4">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
									<rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1" transform="rotate(45 17.0365 15.1223)" fill="currentColor"></rect>
									<path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z" fill="currentColor"></path>
								</svg>
							</span>
							<input type="text" data-kt-ecommerce-order-filter="search" class="form-control form-control-solid w-250px ps-14" placeholder="Buscar Nombre...">
						</div>
					</div>
				</div>

				<div class="card-body pt-0">
					<div id="kt_ecommerce_sales_table_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="table-responsive">
                            <table class="table align-middle table-row-dashed fs-6 gy-5 dataTable no-footer" id="kt_ecommerce_sales_table">
								<thead>
                                    <th class="text-center min-w-100px sorting" tabindex="0" aria-controls="kt_ecommerce_sales_table" rowspan="1" colspan="1" aria-label="Order ID: activate to sort column ascending" style="width: 131.113px;">ID</th>
                                    <th class="text-center min-w-100px sorting" tabindex="0" aria-controls="kt_ecommerce_sales_table" rowspan="1" colspan="1" aria-label="Customer: activate to sort column ascending" style="width: 275.675px;">Titulo</th>
                                    <th class="text-center min-w-100px sorting" tabindex="0" aria-controls="kt_ecommerce_sales_table" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 100.425px;">Fecha finalización</th>
                                    <th class="text-center min-w-100px sorting" tabindex="0" aria-controls="kt_ecommerce_sales_table" rowspan="1" colspan="1" aria-label="Total: activate to sort column ascending" style="width: 131.113px;">Opciones</th>
								</thead>
								
								<tbody class="fw-bold text-gray-600">
											
									<tr class="odd" v-for="data in jobs" :key="data.id">
										<td class="text-end">
											<div class="form-check form-check-sm form-check-custom form-check-solid">
												{{ data.job_offer_id }}
											</div>
                                            
										</td>	
                                        <td class="text-center">
                                            <div class="form-check form-check-sm form-check-custom form-check-solid">
												{{ data.job_offer_name }}
											</div>
                                            
                                        </td>	
                                        <td class="text-center">
                                            <div class="form-check form-check-sm form-check-custom form-check-solid">
												{{ data.job_offer_finished }}
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
                            <div class="col-sm-12 col-md-5 d-flex align-items-center justify-content-center justify-content-md-start">
                                <div class="dataTables_length" id="kt_ecommerce_sales_table_length">
                                    <label>
                                        <select name="kt_ecommerce_sales_table_length" aria-controls="kt_ecommerce_sales_table" class="form-select form-select-sm form-select-solid">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                    </label>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-7 d-flex align-items-center justify-content-center justify-content-md-end">
                                <div class="dataTables_paginate paging_simple_numbers" id="kt_ecommerce_sales_table_paginate">
                                    <ul class="pagination">
                                        <li class="paginate_button page-item previous disabled" id="kt_ecommerce_sales_table_previous">
                                            <a href="#" aria-controls="kt_ecommerce_sales_table" data-dt-idx="0" tabindex="0" class="page-link">
                                                <i class="previous"></i>
                                            </a>
                                        </li>
                                        <li class="paginate_button page-item active">
                                            <a href="#" aria-controls="kt_ecommerce_sales_table" data-dt-idx="1" tabindex="0" class="page-link">1</a>
                                        </li>
                                        <li class="paginate_button page-item ">
                                            <a href="#" aria-controls="kt_ecommerce_sales_table" data-dt-idx="2" tabindex="0" class="page-link">2</a>
                                        </li>
                                        <li class="paginate_button page-item ">
                                            <a href="#" aria-controls="kt_ecommerce_sales_table" data-dt-idx="3" tabindex="0" class="page-link">3</a>
                                        </li>
                                        <li class="paginate_button page-item ">
                                            <a href="#" aria-controls="kt_ecommerce_sales_table" data-dt-idx="4" tabindex="0" class="page-link">4</a>
                                        </li>
                                        <li class="paginate_button page-item ">
                                            <a href="#" aria-controls="kt_ecommerce_sales_table" data-dt-idx="5" tabindex="0" class="page-link">5</a>
                                        </li>
                                        <li class="paginate_button page-item next" id="kt_ecommerce_sales_table_next">
                                            <a href="#" aria-controls="kt_ecommerce_sales_table" data-dt-idx="6" tabindex="0" class="page-link">
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
</template>

<script>

    import Swal from 'sweetalert2/dist/sweetalert2.js'
    import 'sweetalert2/src/sweetalert2.scss'

    import { VueEditor } from "vue2-editor";

    import JobOfficer from '../../endpoints/user/job_officer'

    export default {

        components: {
            VueEditor
        },

        data:function(){
            return {
                jobs:'',
            }
        },

        methods: {

            GetJobsEmpresa(){

                JobOfficer.GetJobsEmpresa().then( response => {
                    console.log(response.data);
                    this.jobs = response.data;
                })
                .catch((error) => {
                    console.log(error);
                });
            },
        },


         mounted(){
            let me = this
            me.GetJobsEmpresa();
        }

    }



</script>