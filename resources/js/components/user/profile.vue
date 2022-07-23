<template>

        <div>
            <div class="mb-13 text-center">
                <h1 class="mb-3">Mi Perfil</h1>
            </div>
            <div class="post d-flex flex-column-fluid" id="kt_post">
                <div id="kt_content_container" class="container-xxl">
                    <div class="card card-flush">
                        <div class="card-body pt-0">
                            <div class="row" style="margin-top:50px;">
                                    <div class="col-md-6">
                                        <div class="container">
                                            <form id="kt_modal_new_target_form" class="form fv-plugins-bootstrap5 fv-plugins-framework">
                                                <div class="d-flex flex-column mb-8 fv-row fv-plugins-icon-container">
                                                    <label class="d-flex align-items-center fs-6 fw-bold mb-2">
                                                        Nombres y Apellidos
                                                    </label>
                                                    <input type="text" class="form-control form-control-solid" v-model="name">
                                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                                </div>
                                                <div class="d-flex flex-column mb-8 fv-row fv-plugins-icon-container">
                                                    <label class="d-flex align-items-center fs-6 fw-bold mb-2">
                                                        E-mail
                                                    </label>
                                                    <input type="text" class="form-control form-control-solid" v-model="email">
                                                    <div class="fv-plugins-message-container invalid-feedback"></div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-10">
                                                    <button type="button" @click="UpdateUser()" class="btn btn-danger">Actualizar <i class="fa fa-list"></i> </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-md-6" align="center">
                                                <div class="container">
                                                        <img :src="photo==null ? 'https://img.favpng.com/20/11/12/computer-icons-user-profile-png-favpng-0UAKKCpRRsMj5NaiELzw1pV7L.jpg' : 'photo/'+ photo" 
                                                        style="width: 55%;border-radius: 100px;"/> <br><br>
                                                        <div class="file-input">
                                                            <input type="file" ref="file" id="file" class="file" @change="ChangePhoto($event)">
                                                            <label for="file">
                                                                Seleccionar Imagen
                                                                <p class="file-name"></p>
                                                            </label>
                                                        </div>
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
    import User from '../../endpoints/user/profile'

    export default {

        data:function(){
            return {
                name:'',
                email:'',
                photo:'',
                datauser: [],
            }
        },
        methods: {


            DataUser(){
                User.GetDataUser().then( response => {
                    this.datauser = response.data;
                    this.name = this.datauser.name;
                    this.email = this.datauser.email;
                    this.photo = this.datauser.url_photo;
                    console.log(this.datauser);
                })
            },

            ChangePhoto(e){
                
                let me = this;
                me.photo = e.target.files[0];
                var data = new FormData()

                data.append("url_photo", me.photo)
                User.UploadFotoUser(data).then(function (response) {
                	Swal.fire({
                      title: response.data.message,
                      text: 'Logo subido exitosamente!!',
                      type: 'success',
                      confirmButtonText: 'OK'
                    });
                    me.DataUser();
                }).catch(function (error) {
                    console.log(error);
                });

            },

            UpdateUser(){
                var data = new FormData()
                data.append("name", this.name)
                data.append("email", this.email)
                User.UpdateDataUser(data).then(function (response) {
                	Swal.fire({
                      title: response.data.message,
                      text: 'Logo subido exitosamente!!',
                      type: 'success',
                      confirmButtonText: 'OK'
                    });
                    me.DataUser();
                }).catch(function (error) {
                    console.log(error);
                });

            },
        },

        mounted(){
            let me = this
            me.DataUser();
        }
    }



</script>

<style>
.file {
  opacity: 0;
  width: 0.1px;
  height: 0.1px;
  position: absolute;
}

.file-input label {
  display: block;
  position: relative;
  width: 200px;
  height: 50px;
  border-radius: 25px;
  background: linear-gradient(40deg,#ff6ec4,#7873f5);
  box-shadow: 0 4px 7px rgba(0, 0, 0, 0.4);
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  font-weight: bold;
  cursor: pointer;
  transition: transform .2s ease-out;
}

.file-name {
  position: absolute;
  bottom: -35px;
  left: 10px;
  font-size: 0.85rem;
  color: #555;
}

input:hover + label,
input:focus + label {
  transform: scale(1.02);
}

/* Adding an outline to the label on focus */
input:focus + label {
  outline: 1px solid #000;
  outline: -webkit-focus-ring-color auto 2px;
}
</style>