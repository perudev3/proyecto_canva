{{-- @extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center" style="margin-top: 6%;">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Cambiar Contraseña') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <form method="POST" action="{{ route('password.email') }}">
                        @csrf

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Enviar link al E-mail') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection --}}


 <!DOCTYPE html>
 <html lang="en">
     <!--begin::Head-->
     <head><base href="../../../">
         <title>Canva</title>
         <meta name="description" content="The most advanced Bootstrap Admin Theme on Themeforest trusted by 94,000 beginners and professionals. Multi-demo, Dark Mode, RTL support and complete React, Angular, Vue &amp; Laravel versions. Grab your copy now and get life-time updates for free." />
         <meta name="keywords" content="Metronic, bootstrap, bootstrap 5, Angular, VueJs, React, Laravel, admin themes, web design, figma, web development, free templates, free admin themes, bootstrap theme, bootstrap template, bootstrap dashboard, bootstrap dak mode, bootstrap button, bootstrap datepicker, bootstrap timepicker, fullcalendar, datatables, flaticon" />
         <meta name="viewport" content="width=device-width, initial-scale=1" />
         <meta charset="utf-8" />
         <meta property="og:locale" content="en_US" />
         <meta property="og:type" content="article" />
         <meta property="og:title" content="Metronic - Bootstrap 5 HTML, VueJS, React, Angular &amp; Laravel Admin Dashboard Theme" />
         <meta property="og:url" content="https://keenthemes.com/metronic" />
         <meta property="og:site_name" content="Keenthemes | Metronic" />
         <link rel="canonical" href="https://preview.keenthemes.com/metronic8" />
         <link rel="shortcut icon" href="{{ asset('media/logos/favicon.ico') }}" />
         <!--begin::Fonts-->
         <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
         <!--end::Fonts-->
         <!--begin::Global Stylesheets Bundle(used by all pages)-->
         <link href="{{ asset('plugins/global/plugins.bundle.css') }}" rel="stylesheet" type="text/css" />
         <link href="{{ asset('css/style.bundle.css') }}" rel="stylesheet" type="text/css" />
         <!--end::Global Stylesheets Bundle-->
     </head>
     <!--end::Head-->
     <!--begin::Body-->
     <body id="kt_body" class="bg-body">
         <!--begin::Main-->
         <div class="d-flex flex-column flex-root">
             <!--begin::Authentication - Sign-up -->
             <div class="d-flex flex-column flex-column-fluid bgi-position-y-bottom position-x-center bgi-no-repeat bgi-size-contain bgi-attachment-fixed" style="background-image: url(assets/media/illustrations/sketchy-1/14.png">
                 <!--begin::Content-->
                 <div class="d-flex flex-center flex-column flex-column-fluid p-10 pb-lg-20">
                     <!--begin::Logo-->
                     <a href="{{ url('/')  }}" class="mb-12">
                         <img alt="Logo" src="assets/media/logos/logo-1.svg" class="h-40px" />
                     </a>
                     <!--end::Logo-->
                     <!--begin::Wrapper-->
                     <div class="w-lg-600px bg-body rounded shadow-sm p-10 p-lg-15 mx-auto">
                         <!--begin::Form-->
                         @if (session('status'))
                            <div class="alert alert-success" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif

                         <form class="form w-100" method="POST" action="{{ route('password.email') }}">
                             @csrf
                             <!--begin::Heading-->
                             <div class="mb-10 text-center">
                                 <!--begin::Title-->
                                 <h1 class="text-dark mb-3">Recuperar cuenta</h1>
                                 <!--end::Title-->
                             </div>
                             <!--end::Heading-->
                             <!--begin::Input group-->
                             <div class="row fv-row mb-7">
                                 <!--begin::Col-->
                                <label class="form-label fw-bolder text-dark fs-6">E-mail</label>
                                <input id="email" type="email" class="form-control form-control-lg form-control-solid @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                                 <!--end::Col-->
                             </div>
                             <!--end::Input group-->
                             <!--begin::Actions-->
                             <div class="text-center">
                                 <button type="submit" class="btn btn-lg btn-primary">
                                     <span class="indicator-label">{{ __('Enviar link al E-mail') }}</span>
                                     <span class="indicator-progress">Please wait...
                                     <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                                 </button>
                             </div>
                             <!--end::Actions-->
                         </form>
                         <!--end::Form-->
                     </div>
                     <!--end::Wrapper-->
                 </div>
                 <!--end::Content-->
             </div>
             <!--end::Authentication - Sign-up-->
         </div>
         <!--end::Main-->
         <!--begin::Javascript-->
         <!--begin::Global Javascript Bundle(used by all pages)-->
         <script src="{{ asset('plugins/global/plugins.bundle.js') }}"></script>
         <script src="{{ asset('js/scripts.bundle.js') }}"></script>
         <!--end::Global Javascript Bundle-->
         <!--end::Page Custom Javascript-->
         <!--end::Javascript-->
     </body>
     <!--end::Body-->
 </html>
 