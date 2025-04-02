@extends('layouts.auth')

@section('content')
<div class="min-vh-100 d-flex justify-content-center align-items-center bg-dark">
    <div class="card w-100 w-md-50 w-lg-40 p-4 bg-secondary text-white shadow-lg">
        <div class="card-body">
            <h3 class="text-center mb-4">Тіркелу</h3>

            <form method="POST" action="{{ route('registerPost') }}">
                @csrf

                <!-- Имя -->
                <div class="mb-3">
                    <label for="name" class="form-label">Аты</label>
                    <input type="text" id="name" name="name" class="form-control @error('name') is-invalid @enderror" value="{{ old('name') }}" required autofocus>
                    @error('name')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <!-- Второе имя -->
                <div class="mb-3">
                    <label for="second_name" class="form-label">Екінші аты</label>
                    <input type="text" id="second_name" name="second_name" class="form-control @error('second_name') is-invalid @enderror" value="{{ old('second_name') }}" required>
                    @error('second_name')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <!-- Фамилия -->
                <div class="mb-3">
                    <label for="surname" class="form-label">Фамилия</label>
                    <input type="text" id="surname" name="surname" class="form-control @error('surname') is-invalid @enderror" value="{{ old('surname') }}" required>
                    @error('surname')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <!-- Телефон -->
                <div class="mb-3">
                    <label for="phone" class="form-label">Телефон</label>
                    <input type="text" id="phone" name="phone" class="form-control @error('phone') is-invalid @enderror" value="{{ old('phone') }}" required>
                    @error('phone')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <!-- ИИН -->
                <div class="mb-3">
                    <label for="iin" class="form-label">ИИН</label>
                    <input type="text" id="iin" name="iin" class="form-control @error('iin') is-invalid @enderror" value="{{ old('iin') }}" required>
                    @error('iin')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <!-- Должность -->
                <div class="mb-3">
                    <label for="job" class="form-label">Жұмыс орны</label>
                    <input type="text" id="job" name="job" class="form-control @error('job') is-invalid @enderror" value="{{ old('job') }}" required>
                    @error('job')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" id="email" name="email" class="form-control @error('email') is-invalid @enderror" value="{{ old('email') }}" required>
                    @error('email')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <!-- Пароль -->
                <div class="mb-3">
                    <label for="password" class="form-label">Құпия сөз</label>
                    <input type="password" id="password" name="password" class="form-control @error('password') is-invalid @enderror" required>
                    @error('password')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <!-- Подтверждение пароля -->
                <div class="mb-4">
                    <label for="password_confirmation" class="form-label">Құпия сөздң қайта жазыңыз</label>
                    <input type="password" id="password_confirmation" name="password_confirmation" class="form-control" required>
                </div>

                <!-- Кнопка отправки формы -->
                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-danger w-100">Тіркелу</button>
                </div>
            </form>

            <div class="text-center mt-3">
                <p class="text-white">Аккаунтыңыз бар ма? <a href="{{ route('adminLoginShow') }}" class="text-dark">Кіру</a></p>
            </div>
        </div>
    </div>
</div>
@endsection
