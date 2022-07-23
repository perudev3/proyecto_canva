@extends('layouts.app2')

@section('content')

    <router-view :user="{{ json_encode(session('user')) }}"></router-view>

@endsection
