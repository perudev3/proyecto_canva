<template>
    <div class="container">
        <div class="form-group row">
            <label for="inputvehiculo" class="col-sm-2 col-form-label">Name</label>
            <div class="col-sm-10">
            <input name="vehiculo" type="text" class="form-control" v-model="job_offer_name" >
            </div>
        </div>

        <div class="form-group row">
            <label for="inputvehiculo" class="col-sm-2 col-form-label">Fecha de Finalización</label>
            <div class="col-sm-10">
            <input name="vehiculo" type="date" class="form-control" v-model="job_offer_finished" >
            </div>
        </div>

        <div class="form-group row">
            <label for="inputPuertas" class="col-sm-2 col-form-label">Descripción</label>
            <div class="col-sm-10">
            <vue-editor v-model="job_offer_description"></vue-editor>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-10">
            <button type="button" @click="Upload()" class="btn btn-primary">Subir <i class="fa fa-upload"></i> </button>
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
                job_offer_name:'',
                job_offer_description:'',
                job_offer_finished:'',
            }
        },

        methods: {

            Upload(){
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