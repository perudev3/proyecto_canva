<template>
    <div class="container">
        <div class="form-group row">
            <label for="inputvehiculo" class="col-sm-2 col-form-label">Name</label>
            <div class="col-sm-10">
            <input name="vehiculo" type="text" class="form-control" v-model="membership_name" >
            </div>
        </div>

        <div class="form-group row">
            <label for="inputvehiculo" class="col-sm-2 col-form-label">Price</label>
            <div class="col-sm-10">
            <input name="vehiculo" type="text" class="form-control" v-model="membership_price" >
            </div>
        </div>

        <div class="form-group row">
            <label for="inputPuertas" class="col-sm-2 col-form-label">Descripción</label>
            <div class="col-sm-10">
            <vue-editor v-model="membership_description"></vue-editor>
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

    import Membership from '../../endpoints/admin/membership'

    export default {

        components: {
            VueEditor
        },

        data:function(){
            return {
                membership_name:'',
                membership_description:'',
                membership_price:'',
            }
        },

        methods: {

            Upload(){
                let me = this;
                let  data = new FormData()
                
                data.append("membership_name", me.membership_name)
                data.append("membership_description", me.membership_description)
                data.append("membership_price", me.membership_price)

                Membership.CreateMembership(data).then( response => {
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