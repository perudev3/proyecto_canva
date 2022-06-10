<template>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page">Mi Perfil</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="container" style="background: #f9f5f5;padding: 10px;border-radius: 9px;">
                        <div class="row">
                            <div class="container" align="center">
                                <img src="https://img.favpng.com/20/11/12/computer-icons-user-profile-png-favpng-0UAKKCpRRsMj5NaiELzw1pV7L.jpg" 
                                style="width: 15%;border-radius: 100px;"/>
                            </div><br><br><br><br><br><br>
                            <div class="container">
                                <div class="form-group row">
                                    <label for="inputvehiculo" class="col-sm-2 col-form-label">Nombre y Apellidos</label>
                                    <div class="col-sm-5">
                                        <label for=""></label>
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