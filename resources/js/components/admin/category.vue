<template>
    <div class="row">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="container">
                        <div class="form-group row">
                            <label for="inputvehiculo" class="col-sm-2 col-form-label">Name</label>
                            <div class="col-sm-10">
                            <input name="vehiculo" type="text" class="form-control" v-model="name" >
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="inputmodelo" class="col-sm-2 col-form-label">Icon</label>
                            <div class="col-sm-10">
                            <input name="modelo" type="file" class="form-control" v-on:change="file">
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-10">
                            <button type="button" @click="Upload()" class="btn btn-primary">Subir <i class="fa fa-upload"></i> </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                        <table class="table">
                            <thead>
                                <tr>
                                <th scope="col">#</th>
                                <th scope="col">First</th>
                                <th scope="col">Last</th>
                                <th scope="col">Handle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                                </tr>
                                <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                                </tr>
                                <tr>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
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
    import Category from '../../endpoints/admin/category'

    export default {
        data:function(){
            return {
                name:'',
                icon:'',
            }
        },

        methods: {

            file(e){
                this.icon = e.target.files[0];
            },

            Upload(){
                let me = this;
                let  data = new FormData()
                
                data.append("name", me.name)
                data.append("url", me.icon)

                Category.CreateCategory(data).then( response => {
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
        }
    }



</script>