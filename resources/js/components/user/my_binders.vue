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
                                    <div class="col-md-6 col-lg-4 col-xl-3" v-for="data in files" :key="data.id">
                                        <a :href="'/file/'+data.file_url" target="_blank">
                                            <div class="symbol symbol-60px mb-5">
                                                <img src="/media/svg/files/pdf.svg"/>
                                            </div>
                                        </a>                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="d-flex flex-wrap flex-stack mb-6">
                <h3 class="fw-bolder my-2">Mis Carpetas
                <span class="fs-6 text-gray-400 fw-bold ms-1">{{ binders.length }}+ en fila</span></h3>
                <div class="d-flex my-2">
                    <div class="d-flex align-items-center position-relative me-4">
                        <span class="svg-icon svg-icon-3 position-absolute ms-3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1" transform="rotate(45 17.0365 15.1223)" fill="black" />
                                <path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z" fill="black" />
                            </svg>
                        </span>
                        <input type="text" id="kt_filter_search" class="form-control form-control-white form-control-sm w-150px ps-9" placeholder="Buscar Carpeta..." />
                    </div>
                </div>
            </div>

            <div class="row g-6 g-xl-9 mb-6 mb-xl-9">
				<div class="col-md-6 col-lg-4 col-xl-3" v-for="data in binders" :key="data.id" @click="GetFiles(data.binder_id, data.binder_name, data.empresas.membership_id)">
					<div class="card h-100">
						<div class="card-body d-flex justify-content-center text-center flex-column p-8"  >
							<a class="text-gray-800 text-hover-primary d-flex flex-column">
								<div class="symbol symbol-75px mb-5">
									<img src="media/svg/files/folder-document.svg" alt="" />
								</div>
								<div class="fs-5 fw-bolder mb-2">{{ data.binder_name }}</div>
							</a>
							<div class="fs-7 fw-bold text-gray-400">{{ data.files.length }} archivos</div>
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
