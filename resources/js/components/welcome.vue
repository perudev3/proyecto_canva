<template>
        <div>
            <div class="py-10 py-lg-20" id="ofertas">
				<!--begin::Container-->
				<div class="container">
					<!--begin::Heading-->
					<div class="text-center mb-12">
						<!--begin::Title-->
						<h3 class="fs-2hx text-dark mb-5" id="team" data-kt-scroll-offset="{default: 100, lg: 150}">Ofertas laborales</h3>
						<!--end::Title-->
						<!--begin::Sub-title-->
						<div class="fs-5 text-muted fw-bold">El puesto que buscas está aquí
						<br />Unete a nuestra plataforma y se parte nuestra comunidad.</div>
						<!--end::Sub-title=-->
					</div>
					<!--end::Heading-->
					<!--begin::Slider-->
					<div class="tns tns-default" >
						<!--begin::Wrapper-->
						<div  data-tns="true" data-tns-loop="true" data-tns-swipe-angle="false" data-tns-speed="2000" data-tns-autoplay="true" data-tns-autoplay-timeout="18000" data-tns-controls="true" data-tns-nav="false" data-tns-items="1" data-tns-center="false" data-tns-dots="false" data-tns-responsive="{1200: {items: 3}, 992: {items: 2}}">
							<!--begin::Item-->
							<div class="text-center" v-for="(data, index) in jobs" :key="index + 1">
								<!--begin::Photo-->
								<div class="octagon mx-auto mb-5 d-flex w-200px h-200px bgi-no-repeat bgi-size-contain bgi-position-center"
                                :style="[ data.url_photo==null ?  { backgroundImage: 'url(https://img.favpng.com/20/11/12/computer-icons-user-profile-png-favpng-0UAKKCpRRsMj5NaiELzw1pV7L.jpg)'} : {backgroundImage: 'url('+`photo/${data.url_photo}`+')' }] "></div>
								<!--end::Photo-->
								<!--begin::Person-->
								<div class="mb-0">
									<!--begin::Name-->
									<a href="#" class="text-dark fw-bolder text-hover-primary fs-3">{{ data.job_offer_name }}</a>
									<!--end::Name-->
									<!--begin::Position-->
									<div class="text-muted fs-6 fw-bold mt-1" >
                                        <p v-html="$options.filters.truncate(data.job_offer_description)"></p>
                                    </div>

                                    <template v-if="user==null">
                                        <div class="text-muted fs-6 fw-bold mt-1" >
                                            <a href="/login"><button type="button" class="btn btn-success">Login</button></a>
                                        </div>
                                    </template>
									<!--begin::Position-->
								</div>
								<!--end::Person-->
							</div>
							<!--end::Item-->
						</div>
						<!--end::Wrapper-->
					</div>
					<!--end::Slider-->
				</div>
				<!--end::Container-->
			</div>

            <membresias></membresias>

        </div>
</template>


<script>

    import Swal from 'sweetalert2/dist/sweetalert2.js'
    import 'sweetalert2/src/sweetalert2.scss'
    import membresias from '../components/user/membership'
    import jobsofficer from '../endpoints/user/job_officer'

    

    export default {

        props:['user'],

        components:{
            membresias
        },

        filters: {
            truncate: function (text, length) {
                if (text.length > 100) {
                    return text.substring(0, 90) + '...'
                } else {
                    return text
                }
            },
        },

        data:function(){
            return {
                files:[],
                categories:[],
                jobs:[],
            }
        },

        methods: {

            Get_Jobs(){
                jobsofficer.GetJobs().then( response => {
                    this.jobs = response.data;
                    console.log(this.jobs);
                })
                .catch((error) => {
                    console.log(error);
                });
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
            self.Get_Jobs();
        }
    }



</script>