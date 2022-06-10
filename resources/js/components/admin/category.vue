<template>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page">Categories</li>
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
                            <div class="col-sm-10">
                            <button type="button" @click="RegisterCategory()" class="btn btn-primary"><i class="fa fa-check"></i> Registrar  </button>
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
                                    <th scope="col">Status</th>
                                    <th scope="col">Option</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="data in categories">
                                    <th scope="row">{{ data.categories_id }}</th>
                                    <td>{{  data.categories_name }}</td>
                                    <td>{{ data.categories_status==1 ? 'Activo' : 'Inactivo' }}</td>
                                    <td>
                                        <button class="btn btn-success"><i class="fas fa-edit"></i> Editar</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
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
                    console.log(this.categories);
                })
            },

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