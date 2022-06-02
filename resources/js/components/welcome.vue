<template>
        <div>
            <div class="container" style="margin-top:38px;margin-bottom: 52px;">
                <div class="row">
                    <div class="col-sm-12" style="background: -webkit-linear-gradient(110deg, rgb(126, 54, 228) 10%, rgb(110, 209, 419) 66%);border-radius: 17px;padding: 28px;padding-top: 0px;">
                        <div id="div-search" align="center">
                            <h2>¿Qué Buscas?</h2>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                                <input type="text" class="form-control" placeholder="Buscar..." id="input-search">                                
                            </div>                            
                        </div>
                       
                    </div>                    
                </div>
            </div>
           <div class="container">
                <div class="row" style="margin-bottom: 40px;">                                 
                    <div class="col-md-6">
                        <video autoplay="autoplay" style="width: 100%;">
                            <source src="videos/inspirate.mp4" type="video/mp4" />
                        </video>
                    </div>
                    <div class="col-md-6">
                        <aside style="margin-top: 13%;">
                            <strong><p><h2>Inspírate</h2></p></strong>  
                            <p>Con miles de recursos de gran calidad, imágenes y plantillas diseñadas por profesionales, tienes una gran ventaja para darles vida a tus ideas y concretar tu mejor trabajo.</p> 
                            <p><button class="btn btn-success" style="background:#8b3dff;border-color:#8b3dff;">Conoce más</button></p>
                        </aside>
                    </div>                
                </div>
                <div class="row" style="margin-bottom: 40px;">
                    <div class="col-md-6">
                        <aside style="margin-top: 13%;">
                            <p><h2>Diseña en equipo con facilidad</h2></p>  
                            <p>Invita más personas a colaborar o crea un equipo entero con Canva Pro para gestionar los recursos de tu marca, agregar comentarios, aprobar diseños y generar contenido visual.</p> 
                            <p><button class="btn btn-success" style="background:#8b3dff;border-color:#8b3dff;">Conoce más</button></p>
                        </aside>
                    </div>
                    <div class="col-md-6">
                        <img src="videos/equipo.webp" style="width: 100%;">
                    </div>                    
                </div>
                <div class="row" style="margin-bottom: 40px;">
                    <div class="col-md-6">
                        <img src="videos/orgullo.webp" style="width: 100%;">
                    </div>    
                    <div class="col-md-6">
                        <aside style="margin-top: 13%;">
                            <p><h2>Comparte con orgullo</h2></p>  
                            <p>Más allá de si usas Canva para presentar diseños, descargarlos, programar su publicación, compartirlos o imprimirlos, sabes que tu trabajo tiene un impacto en el mundo.</p> 
                            <p><button class="btn btn-success" style="background:#8b3dff;border-color:#8b3dff;">Conoce más</button></p>
                        </aside>
                    </div>                                    
                </div>
                <div class="row" style="margin-bottom: 40px;">
                    <div class="col-md-12" align="center">
                       <b><p><h2>Ideal para cualquier equipo</h2></p></b> 
                    </div>

                    <div class="row" align="center">
                        <membresias></membresias>
                    </div>
                    
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-4">

                    </div>
                    <div class="col-md-4" align="center">
                        <p>@2022 Todos los derechos reservados:Canva</p>
                        <p>Política de privacidad | Condiciones</p>
                    </div>
                    <div class="col-md-4">
                        <ul>
                            <li><i class="fa fa-facebook-f"></i></li>
                            <li><i class="fa fa-twitter"></i></li>
                            <li><i class="fa fa-pinteres"></i></li>
                            <li><i class="fa fa-instagram"></i></li>
                        </ul>
                    </div>
                </div>
            </div>
            
            
        </div>
</template>


<script>

    import Swal from 'sweetalert2/dist/sweetalert2.js'
    import 'sweetalert2/src/sweetalert2.scss'
    import File from '../endpoints/admin/files'
    import Category from '../endpoints/admin/category'
    import membresias from '../components/user/membership'

    export default {

        props:['user'],

        components:{
            membresias
        },

        data:function(){
            return {
                files:[],
                categories:[],
            }
        },

        methods: {

            Get_Files(){
                File.GetFiles().then( response => {
                    this.files = response.data;
                })
                .catch((error) => {
                    console.log(error);
                });
            },

            GetCategories(){
                let me = this
                Category.GetCategories().then( response => {
                    me.categories = response.data;
                    me.$nextTick(() => {
                            $('.owl-carousel').owlCarousel({
                                nav: true,
                                navText: [
                                    "<i class='fa fa-chevron-left' style='color: black;font-size: 30px;'></i>",
                                    "<i class='fa fa-chevron-right' style='color: black;font-size: 30px;'></i>"
                                ],
                                items: 1,
                                loop: false,
                                margin: 10,
                                autoplayTimeout: 900,
                                autoplayHoverPause: false,
                                responsiveClass: false,
                                responsive: {
                                    0: {
                                        items: 6,
                                        nav: true
                                    },
                                    600: {
                                        items: 6,
                                        nav: true
                                    },
                                    1000: {
                                        items: 6,
                                        nav: true,
                                        loop: false,
                                        margin: 20
                                    }
                                }
                            });            
                    });
                })
            },

            Search_Files(categories_id){
                File.SearchFiles({ 'categories_id': categories_id}).then( response => {
                    this.files = response.data; 
                })
                .catch((error) => {
                    console.log(error);
                });
            }
        },

        mounted() {
            let self = this
            self.Get_Files();
            self.GetCategories();
        }
    }



</script>


<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans:wght@500&display=swap');

    h2{
        font-family: 'Noto Sans', sans-serif;
    }

    li label{
        font-family: 'Noto Sans', sans-serif;
    }

    #div-search{
        margin-top: 40px;
        color: #fff;
    }
    
    .input-group{
        width: 50%;
    }

    #basic-addon1{
        margin-top: 29px;
        margin-bottom: 0px;
        border-right-color: white;
        background: #ffffff;
        border-left-color: white;
    }

    #input-search{
        width: 50%;
        height: 50px;
        margin-top: 29px;
        border-left-color: white;
    }

    #icon {
        margin-top: 31px;
        margin-bottom: 25px;
    }

    #icon ul {
        list-style-type: none;
         margin: 15px;
        padding: 0;
        line-height: 27px;
        margin-right: 75%;
    }

    #icon li {
        display: inline-block;
        width: 50%;
    }

    #icon img {
        width: 58%;
        border-radius: 30px;
    }

    #icon img:hover {
        
        background: #00000047;
        padding: 10px;
        transition: 1s;

    }

    #icon label{
        color: #ffffff;
        font-size: 12px;
    }

    @media screen and (min-width: 20em) {

        #icon li {
            width: 33.33333%;
        }

    }

    .my-fixed-item {
        position: fixed;
        min-height: 120px;
        width: 252px;
        text-align: center;
        word-wrap: break-word;
        background-color: aquamarine;
    }

    #lista1 {
        font-family:Arial;
        font-weight:bold;
        font-size:13px;
        margin-top: 21px;
    }

    #lista1 li {
        display:inline;
        padding-left:36px;
        padding-right:3px;
    }

    #lista1 img{
        width: 5%;
        border-radius: 42px;
    }

    #lista1 img:hover {
        
        background: #00000047;
        padding: 10px;
        transition: 1s;

    }

    #data_categorias{
        background: #ffffff;
        border-radius: 0 0 9px 17px;
    }

    .owl-item > div{
        background :rgb(255 255 255 / 0%);
    }
    .owl-dots{
        visibility: hidden;
    }
    .owl-stage-outer{
        box-shadow: 2px 97px 70px #a6a4a426 !important;
    }
    .owl-stage-outer .owl-stage{
        background: #a6a4a426;
    }
    .owl-nav .owl-prev{
        background: white !important;
        position: absolute;
        width: 5%;
        border-radius: 80px !important;
        height: 61px;
        margin-top: -197px !important;
        right: 98%;
        box-shadow: 1px 3px 3px #00000047 !important;
    }
    .owl-nav .owl-next{
        background: white !important;
        position: absolute;
        width: 5%;
        border-radius: 80px !important;
        height: 61px;
        margin-top: -197px !important;
        left: 98%;
        box-shadow: 1px 3px 3px #00000047 !important;
    }

    .owl-item{
        width: 8% !important;
    }

    .owl-stage{
        width: 2144px !important;
    }

</style>