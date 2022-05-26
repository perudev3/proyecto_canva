<template>
    <div class="container">
        <div class="form-group row">
            <label for="inputvehiculo" class="col-sm-2 col-form-label">Name</label>
            <div class="col-sm-10">
            <input name="vehiculo" type="text" class="form-control" v-model="name" >
            </div>
        </div>
    
        <div class="form-group row">
            <label for="inputvehiculo" class="col-sm-2 col-form-label">Category</label>
            <div class="col-sm-10">
            <select class="form-control" v-model="categories_id">
                <option :value="data.categories_id" v-for="data in categories"> 
                    {{ data.categories_name }}
                </option>
            </select>
            </div>
        </div>

        <div class="form-group row">
            <label for="inputmodelo" class="col-sm-2 col-form-label">file</label>
            <div class="col-sm-10">
            <input name="modelo" type="file" class="form-control" v-on:change="file">
            </div>
        </div>

        <div class="form-group row">
            <label for="inputPuertas" class="col-sm-2 col-form-label">Portada</label>
            <div class="col-sm-10">
            <input name="puertas" type="file" class="form-control" v-on:change="portada" >
            </div>
        </div>

        <div class="form-group row">
            <label for="inputPuertas" class="col-sm-2 col-form-label">Publicación</label>
            <div class="col-sm-10">
            <vue-editor v-model="content"></vue-editor>
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

    import File from '../../endpoints/admin/files'
    import Category from '../../endpoints/admin/category'

    export default {

        components: {
            VueEditor
        },

        data:function(){
            return {
                name:'',
                file_:'',
                portada_:'',
                categories:[],
                categories_id:'',
                content:'',
            }
        },

        methods: {

            file(e){
                this.file_ = e.target.files[0];
            },

            portada(e){
                this.portada_ = e.target.files[0];
            },

            GetCategories(){
                Category.GetCategories().then( response => {
                    this.categories = response.data;
                })
            },

            Upload(){
                let me = this;
                let  data = new FormData()
                
                data.append("categories_id", me.categories_id)
                data.append("name", me.name)
                data.append("file", me.file_)
                data.append("portada", me.portada_)
                data.append("content", me.content)

                File.CreateFile(data).then( response => {
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

        mounted() {
            let self = this
            self.GetCategories();
        }
    }



</script>