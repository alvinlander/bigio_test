<x-app-layout>
    <div class="container">
        <div class="row  vh-100 d-flex align-items-center justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <h1 class="my-4">Bigio School MS</h1>
                        <div class="login-menu d-flex justify-content-between my-3">
                            <a href="{{ route('login.teacher') }}" class="btn btn-primary">Login for teacher</a>
                            <a href="{{ route('login.student') }}" class="btn btn-primary">Login for Student</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
