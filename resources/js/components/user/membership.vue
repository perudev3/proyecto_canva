<template>

            <div class="container" >
                <div class="" >
                    <div class="card-group">
                        <div class="card" v-for="data in memberships">
                            <div class="card-body">
                                <h5 class="card-title"> <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M16.75 17.5h-9a.75.75 0 0 0 0 1.5h9a.75.75 0 0 0 0-1.5Z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M12.98 6.81a1.5 1.5 0 1 0-1.46.001c-.762 2.086-1.588 3.109-2.353 3.194-.862.095-1.613-.28-2.32-1.21a.807.807 0 0 0-.145-.147 1.5 1.5 0 1 0-1.204.602c0 .058.009.12.024.182l1.216 4.864A2.25 2.25 0 0 0 8.921 16h6.658a2.25 2.25 0 0 0 2.183-1.704l1.216-4.864a.81.81 0 0 0 .024-.182 1.5 1.5 0 1 0-1.203-.602.806.806 0 0 0-.136.135c-.743.935-1.5 1.314-2.33 1.222-.73-.082-1.56-1.108-2.353-3.194Z" fill="currentColor"></path></svg> {{ data.membership_name }}</h5>
                                 <div v-html="data.membership_description"></div>
                            </div>
                            <button style="background:#8b3dff;border-color:#8b3dff;" class="btn btn-success" @click="Create_Membership()">
                                 <h2>S/. {{ data.membership_price }} / Mes</h2>    <p>Empezar</p>
                            </button>
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

        data:function(){
            return {
                memberships: [],
            }
        },

        methods: {

            Get_Membership(){
                User.GetMembership().then( response => {
                    console.log(response.data);
                    this.memberships = response.data;
                })
                .catch((error) => {
                    console.log(error);
                });
            },

            Create_Membership(){
                User.CreateMembership(this.user).then( response => {
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

        mounted(){
            let me = this
            me.Get_Membership();
        }

    }



</script>

<style>

    .card{
        margin: 5px;
        border-radius: 11px;
    }
</style>