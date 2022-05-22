<template>

            <div class="container" >
                <div class="row" >
                    <div class="col-sm-4" style="margin-top: 26px;">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Membresia 1</h5>
                                <a  class="btn btn-primary" @click="Create_Membership()" >Obtener</a>                          
                            </div>
                        </div>
                    </div> 
                    
                    <div class="col-sm-4" style="margin-top: 26px;">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Membresia 2</h5>
                                <a  class="btn btn-primary" @click="Create_Membership()" >Obtener</a>                          
                            </div>
                        </div>
                    </div> 

                    <div class="col-sm-4" style="margin-top: 26px;">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Membresia 3</h5>
                                <a  class="btn btn-primary" @click="Create_Membership()" >Obtener</a>                          
                            </div>
                        </div>
                    </div> 
                </div>
            </div>

</template>


<script>

    import Swal from 'sweetalert2/dist/sweetalert2.js'
    import 'sweetalert2/src/sweetalert2.scss'
    import User from '../../endpoints/user/membership'

    export default {

        methods: {

            Create_Membership(){
                User.CreateMembership(this.user).then( response => {
                    console.log(response.data);
                })
                .catch((error) => {
                    console.log(error);
                });
            },
        },

    }



</script>