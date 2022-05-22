@extends('layouts.app')

@section('content')

    <router-view :user="{{ json_encode(session('user')) }}"></router-view>

@endsection
