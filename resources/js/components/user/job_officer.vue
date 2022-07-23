<template>
    <form id="kt_modal_new_target_form" class="form fv-plugins-bootstrap5 fv-plugins-framework">
		<div class="mb-13 text-center">
			<h1 class="mb-3">Crear Oferta Laboral</h1>
			<div class="text-muted fw-bold fs-5">Crea oportunidades para otros.</div>
		</div>
		<div class="d-flex flex-column mb-8 fv-row fv-plugins-icon-container">
			<label class="d-flex align-items-center fs-6 fw-bold mb-2">
				Nombre de la Oferta Laboral
			</label>
			<input type="text" class="form-control form-control-solid" v-model="job_offer_name">
		    <div class="fv-plugins-message-container invalid-feedback"></div>
        </div>
        <div class="d-flex flex-column mb-8 fv-row fv-plugins-icon-container">
			<label class="d-flex align-items-center fs-6 fw-bold mb-2">
                Fecha de Finalización
			</label>
			<input type="date" class="form-control form-control-solid" v-model="job_offer_finished">
		    <div class="fv-plugins-message-container invalid-feedback"></div>
        </div>
        <div class="d-flex flex-column mb-8 fv-row fv-plugins-icon-container">
			<label class="d-flex align-items-center fs-6 fw-bold mb-2">
				Descripcion del puesto
			</label>
            <vue-editor v-model="job_offer_description" class="form-control form-control-solid"></vue-editor>
		    <div class="fv-plugins-message-container invalid-feedback"></div>
        </div>
        <div class="form-group row">
            <div class="col-sm-10">
            <button type="button" @click="Crear()" class="btn btn-primary">Crear <i class="fa fa-list"></i> </button>
            </div>
        </div>
    </form>

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
                job_offer_name:'',
                job_offer_description:'',
                job_offer_finished:'',
            }
        },

        methods: {

            Crear(){
                let me = this;
                let  data = new FormData()
                
                data.append("job_offer_name", me.job_offer_name)
                data.append("job_offer_description", me.job_offer_description)
                data.append("job_offer_finished", me.job_offer_finished)

                JobOfficer.CreateJobs(data).then( response => {
                    console.log(response.data);
                    Swal.fire({
                        icon: 'success',
                        title: 'Exito',
                        text: response.data.message
                    })
                })
                .catch((error) => {
                    console.log(error);
                });
            },
        },
    }



</script>